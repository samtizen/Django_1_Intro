# check a python version
python --version
>> Python 3.5.2

# check available python packages 
pip freeze
>> Django==1.9.1
>> virtualenv==15.0.1

# if virtualenv is installed, then check its version...
virtualenv --version
>> 15.0.1

# and create a new python environment - django-env. Set a proper interpreter  
virtualenv -p /usr/bin/python3.5 django-env
>> Running virtualenv with interpreter /usr/bin/python3.5
>> Using base prefix '/usr'
>> New python executable in /home/student/django-env/bin/python3.5
>> Also creating executable in /home/student/django-env/bin/python
>> Installing setuptools, pkg_resources, pip, wheel...done.

# activate the new environment
source django-env/bin/activate

# install the django to it
pip install django
>> Installing collected packages: pytz, django
>> Successfully installed django-2.0.2 pytz-2018.3

# check installed packages
pip freeze
>> Django==2.0.2
>> pkg-resources==0.0.0
>> pytz==2018.3

# create a directory for django projects
mkdir django-projects
cd django-projects

# create a django project called study_project
django-admin startproject study_project

# get into the study_project directory
cd study_project

# look at the created files and directories
ls -Rl

# run a lightweight development server on your local machine
python manage.py runserver

>> March 05, 2018 - 16:07:02
>> Django version 2.0.2, using settings 'study_project.settings'
>> Starting development server at http://127.0.0.1:8000/
>> Quit the server with CONTROL-C.

# Go to the link http://127.0.0.1:8000/. Your browser show the django starting page.

# create a web application
python manage.py startapp myapp

# look at the created files and directories
ls -Rl

# create the template directory in the myapp folder
# create the index.html file and add the following code:
<html>
	<head>
		<title>My first Django app</title>	
	</head>
	<body>
		<h1>Hello, {{ name }}!</h1>
	</body>
</html>

# change the settings.py file. add 'DIRS': ["/home/student/django-projects/study_project"] to the TEMPLATES variable

# In the veiws.py add the following code:
from django.shortcuts import render

def my_view(request):
    return render(request, "myapp/template/index.html", {"name": "World"}, content_type="text/html")

# create the urls.py inside the myapp directory and add the following code:
from django.urls import path

from . import views

urlpatterns = [
    path("", views.my_view, name="my_first_view"),
]

# change the urls.py file in the main directory to
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path("myapp/", include("myapp.urls")),
    path("admin/", admin.site.urls),
]

# Go to http://127.0.0.1:8000/myapp/

# Stop the server w ith Cntrl-C

# Deactivate the django-env environment
deactivate

# You have to activate the environment and change a directory to ~/django-projects/study_project to run the server

