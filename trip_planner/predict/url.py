from django.conf.urls import url
from predict import views

urlpatterns=[
    url('predict/',views.predict)
]