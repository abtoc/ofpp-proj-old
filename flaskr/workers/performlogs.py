from datetime import date
from dateutil.relativedelta import relativedelta
from flaskr import app, db
from flaskr.models import Person, PerformLog, WorkLog
from flaskr.utils import is_zero_none

def sync_performlog_from_worklog(id, yymm, dd):
    app.logger.info('Synchronize PerformLog from WorkLog. id={} yymm={} dd={}'.format(id,yymm,dd))
    person = Person.get(id)
    if person is None:
        return        
    worklog = WorkLog.get(id, yymm, dd)
    if worklog is None:
        return
    performlog = PerformLog.get(id, yymm, dd)
    if performlog is None:
        performlog = PerformLog(person_id=id, yymm=yymm, dd=dd) 
    if worklog.absence:
        performlog.absence = True
        performlog.work_in = None
        performlog.work_out = None
    else:
        performlog.absence = False
        performlog.absence_add = False
        performlog.work_in = worklog.work_in
        performlog.work_out = worklog.work_out
    db.session.add(performlog)
    try:
        db.session.commit()
        update_performlogs_enabled(id, yymm)
    except Exception as e:
        db.session.rollback()
        app.logger.error(e)

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
            performlog.enabled = None
        else:
            count = count + 1
            if count <= last:
                performlog.enabled = True
            else:
                performlog.enabled = False
        db.session.add(performlog)
        try:
            db.session.commit()
        except Exception as e:
            db.session.rollback()
            app.logger.error(e)
