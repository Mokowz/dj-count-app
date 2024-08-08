#!/usr/bin/env bash

# Migrate database
python manage.py migrate --noinput

# Collect static files
python manage.py collectstatic --noinput

# Start Gunicorn processes
gunicorn --bind 0.0.0.0:8000 app.wsgi:application