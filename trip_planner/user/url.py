from django.conf.urls import url
from user import views
urlpatterns = [
    url('user/',views.register),
    url('update/',views.update),
    url('recommand/',views.recommandation)
]

