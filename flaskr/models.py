from datetime import datetime
from dateutil.relativedelta import relativedelta
from uuid import uuid4
from flaskr import db

def _get_now():
    return datetime.now()

def _get_uuid():
    return str(uuid4())

# 利用者テーブル
class Person(db.Model):
    __tablename__ = 'persons'
    id = db.Column(db.String(36), primary_key=True, default=_get_uuid)
    name = db.Column(db.String(64), nullable=False)     # 名前
    display = db.Column(db.String(64), nullable=True)   # 表示名
    idm = db.Column(db.String(16), unique=True)         # Ferica IDM
    enabled = db.Column(db.Boolean, nullable=True)      # 有効化
    number = db.Column(db.String(10), nullable=False)   # 受給者番号
    amount = db.Column(db.String(64), nullable=False)   # 契約支給量
    usestart = db.Column(db.Date, nullable=True)        # 利用開始日
    create_at = db.Column(db.DateTime, default=_get_now)
    update_at = db.Column(db.DateTime, onupdate=_get_now)
    def get_usestart(self):
        if self.usetart is None:
            return None, None
        return  self.usestart, self.usetart + relativedelta(days=30)
    def is_usestart(self, d):
        usestart, usestart30d = self.get_usestart()
        if usestart is None:
            return False
        return (usestart <= d) and (d <= usestart30d)
    def populate_form(self,form):
        form.populate_obj(self)
        if (self.id is not None) and (len(self.id) == 0):
            self.id = None
        if (self.idm is not None) and (len(self.idm) == 0):
            self.idm = None
    @classmethod
    def get(cls, id):
        return cls.query.filter(cls.id == id).first()
    @classmethod
    def get_idm(cls, idm):
        return cls.query.filter(cls.idm == idm).first()

# 実績記録表
class PerformLogs(db.Model):
    __tablename__ = 'performlogs'
    person_id = db.Column(db.String(36), db.ForeignKey('persons.id'), primary_key=True) # 利用者ID
    yymm = db.Column(db.String(8), primary_key=True) # 年月
    dd = db.Column(db.Integer, primary_key=True)     # 日
    enabled = db.Column(db.Boolean)                  # 月の日数-8を超えたらFalse
    absence = db.Column(db.Boolean, nullable=False)  # サービス利用状況(欠席加算)
    work_in  = db.Column(db.String(8))               # 開始時間
    work_out = db.Column(db.String(8))               # 終了時間
    pickup_in  = db.Column(db.Integer)               # 送迎加算（往路）
    pickup_out = db.Column(db.Integer)               # 送迎加算（復路）
    visit = db.Column(db.Integer)                    # 訪問支援特別加算（時間数）
    meal = db.Column(db.Integer)                     # 食事提供加算
    medical = db.Column(db.Integer)                  # 医療連携体制加算
    experience = db.Column(db.Integer)               # 体験利用支援加算
    outside = db.Column(db.Integer)                  # 施設外支援
    remarks = db.Column(db.String(128))              # 備考
    create_at = db.Column(db.DateTime, default=_get_now)
    update_at = db.Column(db.DateTime, onupdate=_get_now)
    def populate_form(self,form):
        form.populate_obj(self)
        if (self.work_in is not None) and (len(self.work_in) == 0):
            self.work_in == None
        if (self.work_out is not None) and (len(self.work_out) == 0):
            self.work_out == None
        if (self.pickup_in is not None) and (len(self.pickup_in) == 0):
            self.pickup_in == None
        if (self.pickup_out is not None) and (len(self.pickup_out) == 0):
            self.work_out == None
        if (self.visit is not None) and (len(self.visit) == 0):
            self.visit == None
        if (self.meal is not None) and (len(self.meal) == 0):
            self.meal == None
        if (self.medical is not None) and (len(self.medical) == 0):
            self.medical == None
        if (self.experience is not None) and (len(self.experience) == 0):
            self.experience == None
        if (self.outside is not None) and (len(self.outside) == 0):
            self.outside == None
        if (self.remarks is not None) and (len(self.remarks) == 0):
            self.remarks == None
    @classmethod
    def get(cls, id, yymm, dd):
        return cls.query.filter(cls.person_id == id, cls.yymm == yymm, cls.dd == dd).first()
    @classmethod
    def get_date(cls, yymmdd):
        yymm = yymmdd.strftime('%Y%m')
        return cls.query.filter(cls.person_id == id, cls.yymm == yymm, cls.dd == yymmdd.day).first()
    @classmethod
    def get_yymm(cls, id, yymm):
        return cls.query.filter(cls.person_id == id, cls.yymm == yymm).all()