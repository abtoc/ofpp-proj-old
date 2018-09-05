from flask import Blueprint
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField
from wtforms.validators import DataRequired
from flaskr import db, lm
from flaskr.models import User

bp = Blueprint('auth', __name__, url_prefix="/auth")

@lm.user_loader
def load_user(id):
    return User.query.get(id)

class LoginForm(FlaskForm):
    userid = StringField('ログインID')
    password = PasswordField('パスワード')

@bp.route('/login',methods=['GET','POST'])
def login():
    form = LoginForm()
    if form.validate_on_submit():
        user, checked = User.auth(form.userid.data, form.password.data)
        if checked:
            login_user(user)
            return redirect(request.args.get("next") or url_for("index"))
        flash('ユーザIDまたはパスワードが違います', 'danger')
        return render_template('auth/login.pug', form=form), 401
    return render_template('auth/login.pug', form=form)

@bp.route('/logout')
def logout():
    logout_user()
    cache.set('idm', None, 5*60)
    return redirect(url_for('index'))

