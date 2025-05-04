from django.shortcuts import render
from package.models import Package
# Create your views here.
def admin(request):
    return render(request,'temp/admin.html')
def home(request):
    obj = Package.objects.all()
    dict = {
        'a': obj
    }
    return render(request,'temp/home.html',dict)
def user(request):
    return render(request,'temp/user.html')
def staff(request):
    return render(request,'temp/staff.html')