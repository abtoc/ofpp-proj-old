from flaskr import app, db
from flaskr.models import Person, PerformLog, WorkLog
from flaskr.utils import is_zero_none

def sync_worklog_from_performlog(id, yymm, dd):
    app.logger.info('Synchronize WorkLog from PerformLog. id={} yymm={} dd={}'.format(id,yymm,dd))
    person = Person.get(id)
    if person is None:
        return        
    performlog = PerformLog.get(id, yymm, dd)
    worklog = WorkLog.get(id, yymm, dd)
    if (performlog is None) and (worklog is None):
        return
    if performlog is None:
        db.session.delete(worklog)
        try:
            db.session.commit()
        except Exception as e:
            db.session.rollback()
            app.logger.error(e)
        return
    if worklog is None:
        worklog = WorkLog(person_id=id, yymm=yymm, dd=dd)
    worklog.absence = performlog.absence
    worklog.work_in = performlog.work_in
    worklog.work_out = performlog.work_out
    db.session.add(worklog)
    try:
        db.session.commit()
        if (not is_zero_none(worklog.work_in)) and (not is_zero_none(worklog.work_out)):
            update_worklog_value(id, yymm, dd, worklog.work_in, worklog.work_out)
    except Exception as e:
        db.session.rollback()
        app.logger.error(e)

def update_worklog_value(id, yymm, dd, work_in, work_out):
    app.logger.info('Update WorkLog value from Time-Table. id={} yymm={} dd={}'.format(id,yymm,dd))
