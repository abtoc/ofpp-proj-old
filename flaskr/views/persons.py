from flask import Blueprint, render_template, redirect, url_for, flash, abort
from flask_wtf import FlaskForm
from wtforms import StringField, BooleanField, DateField, HiddenField, SelectField, ValidationError
from wtforms.validators import DataRequired, Regexp, Optional
from sqlalchemy import func
from flaskr import app, db
from flaskr.models import Person, PerformLog, WorkLog, TimeRule
from flaskr.utils.validators import RegexpNotIf

bp = Blueprint('persons', __name__, url_prefix='/persons')

class UniqueIDM(object):
    def __init__(self, message="同一IDMが指定されています"):
        self.message = message
    def __call__(self, form, field):
        if len(field.data) == 0:
            return
        id = form._fields.get('id')
        if id is None:
            raise Exception('no field named "id" in form')
        check = Person.query.filter(Person.idm == field.data, Person.id != id.data).first()
        if check:
            raise ValidationError(self.message)

class PersonForm(FlaskForm):
    id = HiddenField('id')
    name = StringField('名前', validators=[DataRequired(message='必須項目です')])
    display = StringField('表示名')
    idm = StringField('IDM', validators=[UniqueIDM(message='同一IDMが指定されています')])
    enabled = BooleanField('有効化', default='checked')
    staff = BooleanField('職員')
    number = StringField('受給者番号', validators=[RegexpNotIf('staff', message='数字10桁で入力してください', regex='^[0-9]{10}$')])
    amount = StringField('契約支給量')
    usestart = DateField('利用開始日', validators=[Optional()])
    timerule_id = SelectField('タイムテーブル', render_kw={'class': 'form-control'})
    def __init__(self, *args, **kwargs):
        super(PersonForm, self).__init__(*args, **kwargs)
        self.timerule_id.choices = [(tr.id, tr.caption) for tr in TimeRule.query.order_by(TimeRule.caption).all()]

@bp.route('/')
def index():
    persons = Person.query.order_by(Person.name.asc()).all()
    items = []
    for person in persons:
        timerule = TimeRule.get(person.timerule_id)
        item = dict(
            id=person.id,
            enabled=person.enabled,
            name=person.get_display(),
            idm=person.idm,
            timerule=timerule.caption if timerule is not None else '',
            create_at=person.create_at.strftime('%Y/%m/%d %H:%M') if person.create_at is not None else '',
            update_at=person.update_at.strftime('%Y/%m/%d %H:%M') if person.update_at is not None else ''
        )
        items.append(item)
    return render_template('persons/index.pug', items=items)

@bp.route('/create', methods=('GET', 'POST'))
def create():
    form = PersonForm()
    if form.validate_on_submit():
        person = Person()
        person.populate_form(form)
        person.id = None
        db.session.add(person)
        try:
            db.session.commit()
            flash('メンバーの追加ができました', 'success')
            return redirect(url_for('persons.index'))
        except Exception as e:
            db.session.rollback()
            flash('メンバー追加時にエラーが発生しました "{}"'.format(e), 'danger')
    return render_template('persons/edit.pug', form=form)

@bp.route('/<id>/edit', methods=('GET', 'POST'))
def edit(id):
    person = Person.get(id)
    if person is None:
        abort(404)
    form = PersonForm(obj=person)
    if form.validate_on_submit():
        person.populate_form(form)
        db.session.add(person)
        try:
            db.session.commit()
            flash('メンバーの更新ができました', 'success')
            return redirect(url_for('persons.index'))
        except Exception as e:
            db.session.rollback()
            flash('メンバー更新時にエラーが発生しました "{}"'.format(e), 'danger')
    return render_template('persons/edit.pug', form=form)

@bp.route('/<id>/destroy', methods=('GET', 'POST'))
def destroy(id):
    person = Person.get(id)
    if person is None:
        abort(404)
    q = db.session.query(
        func.count(PerformLog.yymm)
    ).filter(
        PerformLog.person_id==id
    ).group_by(
        PerformLog.person_id
    ).first()
    if q is not None:
        flash('実績データが存在しているため削除できません','danger')
        return redirect(url_for('persons.index'))
    q = db.session.query(
        func.count(WorkLog.yymm)
    ).filter(
        WorkLog.person_id==id
    ).group_by(
        WorkLog.person_id
    ).first()
    if q is not None:
        flash('勤怠データが存在しているため削除できません','danger')
        return redirect(url_for('persons.index'))
    db.session.delete(person)
    try:
        db.session.commit()
        flash('メンバーの削除ができました', 'success')
    except Exception as e:
        db.session.rollback()
        flash('メンバー削除時にエラーが発生しました "{}"'.format(e), 'danger')
    return redirect(url_for('persons.index'))
        