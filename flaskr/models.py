from datetime import datetime
from dateutil.relativedelta import relativedelta
from uuid import uuid4
from flaskr import db

def _get_now():
    return datetime.now()

def _get_uuid():
    return str(uuid4())

class Person(db.Model):
    __tablename__ = 'persons'
    id = db.Column(db.String(36), primary_key=True, default=_get_uuid)
    name = db.Column(db.String(64), nullable=False)
    display = db.Column(db.String(64), nullable=True)
    idm = db.Column(db.String(16), unique=True)
    enabled = db.Column(db.Boolean, nullable=True)
    number = db.Column(db.String(10), nullable=False)
    amount = db.Column(db.String(64), nullable=False)
    usestart = db.Column(db.Date, nullable=True)
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
    