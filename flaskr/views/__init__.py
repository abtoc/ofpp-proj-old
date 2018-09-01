from flask import render_template, flash
from flaskr import app

@app.route('/')
def index():
    flash('テストメッセージ', 'success')
    flash('テストメッセージ', 'danger')
    return render_template('index.pug')
