from datetime import date
from dateutil.relativedelta import relativedelta
from flaskr import app, db
from flaskr.models import Person, PerformLog, WorkLog
from flaskr.utils import is_zero_none

def update_performlogs_enabled(id, yymm):
    app.logger.info('Update PerformLogs enabled. id={} yymm={}'.format(id,yymm))
    person = Person.get(id)
    if person is None:
        return
    yy = yymm[:4]
    mm = yymm[4:]
    first = date(int(yy), int(mm), 1)
    last = first + relativedelta(months=1) - relativedelta(days=1)
    last = last.day - 8
    performlogs = PerformLog.get_yymm(id, yymm)
    count = 0
    for performlog in performlogs:
        if bool(performlog.absence):
            continue
        count = count + 1
        if count < last:
            performlog.enabled = True
        else:
            performlog.enabled = False
        db.session.add(performlog)
        try:
            db.session.commit()
        except Exception as e:
            db.session.rollback()
            app.logger.error(e)
