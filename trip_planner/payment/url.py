from django.conf.urls import url
from payment import views

urlpatterns=[
    url('view_pay/',views.view_payment),


url('view_payadmin/',views.view_payment_admin)
]