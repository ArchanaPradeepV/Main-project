from django.conf.urls import url
from package import views
urlpatterns = [
    url('package/',views.adpkg),
    url('vwpkg/',views.viewstaffpkg),
    url('view_package_user/',views.viewuserpkg),
    url('mng_packages/',views.mngpkg),
    url('delete/(?P<idd>\w+)',views.delete),
    url('edit/(?P<idd>\w+)',views.edit),






]