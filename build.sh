#!/usr/bin/env bash

echo " Instalando dependencias"
pip install -r requirements.txt

echo "hacer migraciones"
python manage.py makemigrations

echo " Ejecutando migraciones"
python manage.py migrate


echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.filter(username='admin').exists() or User.objects.create_superuser('admin', 'admin@example.com', 'adminpass')" | python manage.py shell

echo " Recolectando archivos estaticos"
python manage.py collectstatic --noinput
