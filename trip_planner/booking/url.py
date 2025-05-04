from django.conf.urls import url
from booking import views
urlpatterns = [
     url('booking/(?P<idd>\w+)', views.booking),
     url('adminbook/', views.adminvwbook),
     url('staffbook/', views.staffvwbook),
     url('view_book_and_pay/', views.view_accepted_booking_pay),
     url('accept/(?P<idd>\w+)',views.accept),
     url('reject/(?P<idd>\w+)',views.reject),
     url('userbookview/', views.userviewbook),



]








