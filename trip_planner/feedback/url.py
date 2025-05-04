from django.conf.urls import url
from feedback import views
urlpatterns = [
    url('feed/',views.feedform),
    url('admin/',views.adminvwfeed),
    url('staff/',views.staffvwfeed),


]