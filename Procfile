web: gunicorn titanic.wsgi
worker: celery worker -A titanic.celery --loglevel=info --logfile=worker.log -B
