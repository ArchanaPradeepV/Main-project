from django.shortcuts import render
from user.models import User
from login.models import Login
from django.http import HttpResponseRedirect



# def register(request):
#     c=None
#     if request.method == 'POST':
#         obj = User()
#         obj.name = request.POST.get('na')
#         obj.place = request.POST.get('pl')
#         obj.phone_number=request.POST.get('ph')
#         obj.email = request.POST.get('em')
#         obj.username = request.POST.get('un')
#         obj.password = request.POST.get('ps')
#         obj.save()
#
#         ob = Login()
#         ob.username = obj.username
#         ob.password = obj.password
#         ob.u_id = obj.user_id
#         ob.type = 'user'
#         ob.save()
#         c="registered succefully"
#         return HttpResponseRedirect('/temp/home/')
#
#     return render(request,'user/register.html',{'msg':c})




from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.shortcuts import render
from user.models import User
from login.models import Login

# def register(request):
#     c = None
#     if request.method == 'POST':
#         name = request.POST.get('na')
#         place = request.POST.get('pl')
#         phone_number = request.POST.get('ph')
#         email = request.POST.get('em')
#         username = request.POST.get('un')
#         password = request.POST.get('ps')
#
#         # Check for duplicates in User model
#         if User.objects.filter(username=username).exists():
#             c = "Username already taken"
#         elif User.objects.filter(email=email).exists():
#             c = "Email already registered"
#         elif User.objects.filter(phone_number=phone_number).exists():
#             c = "Phone number already registered"
#         else:
#             # Create user
#             obj = User.objects.create(
#                 name=name,
#                 place=place,
#                 phone_number=phone_number,
#                 email=email,
#                 username=username,
#                 password=password
#             )
#
#             # Create login credentials
#             Login.objects.create(
#                 username=obj.username,
#                 password=obj.password,
#                 u_id=obj.user_id,
#                 type='user'
#             )
#
#             c = "Registered successfully"
#             return HttpResponseRedirect('/temp/home/')
#
#     return render(request, 'user/register.html', {'msg': c})



from django.http import HttpResponseRedirect
from django.shortcuts import render
from login.models import Login

def register(request):
    c = None
    if request.method == 'POST':
        name = request.POST.get('na')
        place = request.POST.get('pl')
        phone_number = request.POST.get('ph')
        email = request.POST.get('em')
        username = request.POST.get('un')
        password = request.POST.get('ps')

        # Check for duplicates in User model
        if User.objects.filter(username=username).exists():
            c = "Username already taken"
        elif User.objects.filter(email=email).exists():
            c = "Email already registered"
        elif User.objects.filter(phone_number=phone_number).exists():
            c = "Phone number already registered"
        else:
            # Create user
            obj = User.objects.create(
                name=name,
                place=place,
                phone_number=phone_number,
                email=email,
                username=username,
                password=password
            )

            # Create login credentials
            Login.objects.create(
                username=obj.username,
                password=obj.password,
                u_id=obj.user_id,
                type='user'
            )

            c = "Registered successfully"
            return HttpResponseRedirect('/temp/home/')

    return render(request, 'user/register.html', {'msg': c})

from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect



# def update(request):
#     ss=request.session["u_id"]
#     obj=User.objects.get(user_id=ss)
#     context={
#         'o':obj
#     }
#
#     if request.method == 'POST':
#         obj = User.objects.get(user_id=ss)
#         obj.name = request.POST.get('na')
#         obj.place = request.POST.get('pl')
#         obj.phone_number=request.POST.get('ph')
#         obj.email = request.POST.get('em')
#         obj.save()
#     return render(request,'user/update profile.html',context)
#
from django.shortcuts import render, redirect
from django.contrib import messages
from .models import User  # Ensure you import your model if not already imported
import logging

# Set up logger
logger = logging.getLogger(__name__)


def update(request):
    # Ensure that the user is logged in
    if 'u_id' not in request.session:
        return redirect('login')  # Redirect to login if no session ID exists

    ss = request.session["u_id"]
    try:
        obj = User.objects.get(user_id=ss)
    except User.DoesNotExist:
        # If the user doesn't exist, redirect or handle the error
        messages.error(request, "User not found!")
        return redirect('login')

    if request.method == 'POST':
        # Log the incoming POST data for debugging
        logger.info(f"Received POST data: {request.POST}")

        # Get data from the form
        name = request.POST.get('na')
        place = request.POST.get('pl')
        phone_number = request.POST.get('ph')
        email = request.POST.get('em')
        username = request.POST.get('un')
        password = request.POST.get('ps')

        # Ensure that the data exists and is valid
        if not name or not place or not phone_number or not email:
            messages.error(request, "All fields are required.")
            return redirect('update')  # Redirect back to the update form if fields are missing

        # Update the fields
        obj.name = name
        obj.place = place
        obj.phone_number = phone_number
        obj.email = email
        obj.username = username
        obj.password = password

        ob = Login.objects.get(u_id=obj.user_id, type="user")
        ob.username = obj.username
        ob.password = obj.password
        ob.save()

        try:
            # Save the updated user
            obj.save()

            # Optional: Display a success message
            messages.success(request, "Profile updated successfully!")
            logger.info(f"User {obj.user_id} profile updated successfully.")

            # Redirect to the profile page or a confirmation page
            return redirect('profile')  # You can change 'profile' to the appropriate name of the URL

        except Exception as e:
            # Log the error if saving fails
            logger.error(f"Error updating user profile: {e}")
            messages.error(request, "There was an error updating your profile. Please try again.")

            return HttpResponseRedirect('/temp/user/')

    context = {
        'o': obj
    }

    return render(request, 'user/update profile.html', context)



def recommandation(request):

    return render(request, 'user/recommandation.html')
