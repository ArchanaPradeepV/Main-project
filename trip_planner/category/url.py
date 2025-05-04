from django.conf.urls import url
from category import views
urlpatterns = [
    url('category/',views.category),
]
