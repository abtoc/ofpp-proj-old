from datetime import date
from dateutil.relativedelta import relativedelta
from flask import Blueprint, render_template, redirect, url_for, flash, abort
from flask_wtf import FlaskForm
from wtforms import StringField, BooleanField, IntegerField
from wtforms.validators import DataRequired, Regexp, Optional
from flaskr import app, db
from flaskr.models import Person, PerformLog
from flaskr.utils import weeka

bp = Blueprint('performlogs', __name__, url_prefix='/performlogs')

class PerformLogs(FlaskForm):
    absence = BooleanField('欠席加算')
    work_in = StringField('開始時間', validators=[Optional(), Regexp(message='HH:MMで入力してください', regex='^[0-2][0-9]:[0-5][0-9]$')])
    work_out = StringField('終了時間', validators=[Optional(), Regexp(message='HH:MMで入力してください', regex='^[0-2][0-9]:[0-5][0-9]$')])
    pickup_in = IntegerField('送迎加算（往路）', validators=[Optional()])
    pickup_out = IntegerField('送迎加算（復路）', validators=[Optional()])
    visit = IntegerField('訪問支援特別加算（時間数）', validators=[Optional()])
    meal = IntegerField('食事提供加算', validators=[Optional()])
    medical = IntegerField('医療連携体制加算', validators=[Optional()])
    outside = IntegerField('体験利用支援加算（初日ー５日目は１、６日目ー１５日目は2）', validators=[Optional()])
    remarks = StringField('備考')

def _check_yymmdd(yymm, dd=1):
    if len(yymm) != 6:
        return False
    try:
        yy = int(yymm[:4])
        mm = int(yymm[4:])
        dd = int(dd)
        date(yy,mm,dd)
        return True
    except ValueError:
        return False

@bp.route('/<id>')
@bp.route('/<id>/<yymm>')
def index(id, yymm=None):
    if (yymm is not None) and (not _check_yymmdd(yymm)):
        abort(400)
    person = Person.get(id)
    if person is None:
        abort(404)
    if yymm is None:
        now = date.today()
        yymm = now.strftime('%Y%m')
    else:
        now = date(int(yymm[:4]), int(yymm[4:]), 1)
    first = date(now.year, now.month, 1)
    last = first + relativedelta(months=1)
    prev = first - relativedelta(months=1)
    head = dict(
        id=person.id,
        name=person.get_display(),
        yymm=yymm,
        ym='{}年{}月'.format(first.year, first.month),
        prev=prev.strftime('%Y%m'),
        next=last.strftime('%Y%m')
    )
    foot = dict(
        count=0,
        pickup=0,
        visit=0,
        meal=0,
        medical=0,
        experience=0,
        outside=0
    )
    items = []
    while first < last:
        item = dict(
            dd=first.day,
            week=weeka[first.weekday()],
            edit=False,
            enabled=None,
            absence=False,
            work_in=None,
            work_out=None,
            pickup_in=None,
            pickup_out=None,
            visit=None,
            meal=None,
            medical=None,
            experience=None,
            outside=None,
            remarks=None
        )
        performlog = PerformLog.get_date(id, first)
        if performlog is not None:
            item['edit'] = True
            item['enabled'] = performlog.enabled
            item['absence'] = performlog.absence
            item['work_in'] = performlog.work_in
            item['work_out'] = performlog.work_out
            item['pickup_in'] = performlog.pickup_in
            item['pickup_out'] = performlog.pickup_out
            item['visit'] = performlog.visit
            item['meal'] = performlog.meal
            item['experience'] = performlog.experience
            item['outside'] = performlog.outside
            item['remarks'] = performlog.remarks
            if (bool(item['enabled'])) and (not bool(item['absence'])):
                foot['count'] = foot['count'] + (1 if item['work_in'] is not None else 0)
                foot['pickup'] = foot['pickup'] + (1 if item['pickup_in'] is not None else 0)
                foot['pickup'] = foot['pickup'] + (1 if item['pickup_out'] is not None else 0)
                foot['visit'] = foot['visit'] + (1 if item['visit'] is not None else 0)
                foot['meal'] = foot['meal'] + (1 if item['meal'] is not None else 0)
                foot['experience'] = foot['meexperienceal'] + (1 if item['experience'] is not None else 0)
                foot['outside'] = foot['outside'] + (1 if item['outside'] is not None else 0)
        items.append(item)
        first = first + relativedelta(days=1)
    return render_template('performlogs/index.pug', head=head, items=items, foot=foot)
