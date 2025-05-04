from django.conf.urls import url
from staff import views
urlpatterns = [
    url('adstaff/',views.adstaff),
    url('manstaff/',views.manstaff),
    url('edit/(?P<idd>\w+)', views.edit),
    url('delete/(?P<idd>\w+)',views.delete),
    url('block/(?P<idd>\w+)',views.block)


]