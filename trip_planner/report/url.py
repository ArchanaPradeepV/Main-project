# from django.conf.urls import url
# from report import views
# urlpatterns = [
#     url('vwreport/',views.adminreport),
#
# ]

from django.urls import path
from report import views

urlpatterns = [
    path('vwreport/', views.adminreport, name='admin_monthly_report'),
]
