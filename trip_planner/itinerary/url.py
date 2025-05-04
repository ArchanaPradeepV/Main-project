from django.conf.urls import url
from itinerary import views
urlpatterns = [
    url('itinerary/(?P<idd>\w+)',views.aditin),
    url('manage/',views.manitin),
    url('edit/(?P<idd>\w+)', views.edititin),
    url('delete/(?P<idd>\w+)', views.delete),
    url('view/(?P<idd>\w+)', views.viewitin),
    url('viewitin/', views.viewitinadmin),
    url('customize/', views.customizeitin, name='customizeitin'),
    url('viewaiitin/', views.viewaiitinstaff),



]


