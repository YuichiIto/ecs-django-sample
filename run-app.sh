pip install -r requirements.txt
python manage.py migrate
python manage.py custom_createsuperuser --username admin --email admin@example.com --password admin
python manage.py runserver 0.0.0.0:80
exit 0
