from django.shortcuts import render
from login.models import Login
from django.http import HttpResponseRedirect
#Create your views here.
# def login(request):
#
#     if request.method=='POST':
#         username=request.POST.get("un")
#         password=request.POST.get("ps")
#         obj=Login.objects.filter(username=username,password=password)
#         tp=""
#         for ob in obj:
#             if ob.username==username and ob.password==password:
#                 tp=ob.type
#                 uid=ob.u_id
#                 if tp=="admin":
#                     request.session["u_id"]=uid
#                     return HttpResponseRedirect('/temp/admin/')
#                 elif tp =="staff":
#                     request.session["u_id"]=uid
#                     return HttpResponseRedirect('/temp/staff/')
#                 elif tp =="user":
#                     request.session["u_id"]=uid
#                     return HttpResponseRedirect('/temp/user/')
#             else:
#                 objlist="username or password incorrect"
#                 context={
#                     'msg':objlist
#                 }
#                 return render(request,'login/login.html',context)
#     return render(request,'login/login.html')


from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect
from .models import Login

# from django.shortcuts import render, redirect
# from django.http import HttpResponseRedirect
# from .models import Login
#
# def login(request):
#     if request.method == 'POST':
#         username = request.POST.get("un").strip()
#         password = request.POST.get("ps").strip()
#
#         obj = Login.objects.filter(username=username, password=password).first()
#
#         if obj:  # If user exists
#             request.session["u_id"] = obj.u_id
#
#             context = {
#                 "success": True,  # Pass success flag to template
#                 "redirect_url": "/temp/user/"  # Redirect to home page after 5s
#             }
#             return render(request, 'login/login.html', context)
#         else:
#             return render(request, 'login/login.html', {'msg': 'Invalid username or password'})
#
#     return render(request, 'login/login.html')




from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect
from .models import Login
# def login(request):
#     if request.method == 'POST':
#         username = request.POST.get("un").strip()
#         password = request.POST.get("ps").strip()
#
#         obj = Login.objects.filter(username=username).first()  # Removed password check for debugging
#
#         if obj:
#             print(f"DEBUG: Found user {obj.username} with role {obj.type} and password {obj.password}")
#
#             if obj.password == password:  # Direct match, check for hashing
#                 request.session["u_id"] = obj.u_id
#                 tp = obj.type.lower()  # Convert to lowercase to avoid case issues
#
#                 if tp == "admin":
#                     redirect_url = "/temp/admin/"
#                 elif tp == "staff":
#                     redirect_url = "/temp/staff/"
#                 elif tp == "user":
#                     redirect_url = "/temp/user/"
#                 else:
#                     return render(request, 'login/login.html', {'msg': 'Invalid role assigned'})
#
#                 return render(request, 'login/login.html', {
#                     "success": True,
#                     # "msg": "Login successful! Redirecting...",
#                     "redirect_url": redirect_url,
#                 })
#             else:
#                 print("DEBUG: Password mismatch")
#                 return render(request, 'login/login.html', {'msg': 'Invalid password'})
#
#         print("DEBUG: No user found")
#         return render(request, 'login/login.html', {'msg': 'Invalid username or password'})
#
#     return render(request, 'login/login.html')




from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect
from .models import Login

# def login(request):
#
#     if request.method=='POST':
#         username=request.POST.get("un")
#         password=request.POST.get("ps")
#         obj=Login.objects.filter(username=username,password=password)
#         tp=""
#         for ob in obj:
#             if ob.username==username and ob.password==password:
#                 tp=ob.type
#                 uid=ob.u_id
#                 if tp=="admin":
#                     request.session["u_id"]=uid
#                     return HttpResponseRedirect('/temp/admin/')
#                 elif tp =="staff":
#                     request.session["u_id"]=uid
#                     return HttpResponseRedirect('/temp/staff/')
#                 elif tp =="user":
#                     request.session["u_id"]=uid
#                     return HttpResponseRedirect('/temp/user/')
#             else:
#                 objlist="username or password incorrect"
#                 context={
#                     'msg':objlist
#                 }
#                 return render(request,'login/login.html',context)
#     return render(request,'login/login.html')
#
#
#

def login(request):
    if request.method == 'POST':
        username = request.POST.get("un")
        password = request.POST.get("ps")

        # Check if the user exists
        obj = Login.objects.filter(username=username, password=password)

        if obj.exists():  # If a user is found
            ob = obj.first()  # Get the first matched user
            tp = ob.type
            uid = ob.u_id

            # Store session and redirect based on user type
            request.session["u_id"] = uid
            if tp == "admin":
                return HttpResponseRedirect('/temp/admin/')
            elif tp == "staff":
                return HttpResponseRedirect('/temp/staff/')
            elif tp == "user":
                return HttpResponseRedirect('/temp/user/')
        else:
            # Invalid login message
            context = {'msg': "Invalid username or password"}
            return render(request, 'login/login.html', context)

    return render(request, 'login/login.html')


