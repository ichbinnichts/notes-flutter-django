# Notes 

Full stack project made with django 5 and Flutter 3

## Dev notes

* Django notes

Install django in the virtual env with $pipenv install django

Initialize virtual env with $pipenv shell

Add project with django-admin startproject "name" .

Add api app with $python manage.py startapp api

Install rest framework with $pipenv install djangorestframework

After making models $python manage.py makemigrations "app-name"

After makemigrations $python manage.py migrate

Create a super user with $python manage.py createsuperuser

In the end of the api add cors

* Dependencies
- $pipenv install django
- $pipenv install djangorestframework
- $pipenv install django-cors-headers

<hr/>

* Flutter notes

Flutter version 3 with http version 0.13.3 dependency
Created this flutter project with flutter create "your-project-name"

* Dependencies
- http - 0.13.3