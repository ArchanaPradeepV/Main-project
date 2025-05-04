from django.shortcuts import render
from staff.models import Staff
from login.models import Login
from django.http import HttpResponseRedirect

import smtplib
# def adstaff(request):
#         msg = None
#         if request.method == 'POST':
#             obj = Staff()
#
#
#
#             obj.name=request.POST.get('na')
#             obj.place=request.POST.get('pl')
#             obj.phone_number = request.POST.get('ph')
#             f = request.POST.get('em')
#             if Staff.objects.filter(email=f).exists():
#                    c = {'ms': "Invalid username already exist"}
#             obj.email = f
#             obj.save()
#
#
#             ob = Login()
#             ob.username = obj.name
#             ob.password =obj.phone_number
#             ob.u_id = obj.staff_id
#             ob.type = 'staff'
#             ob.save()
#             msg = "Staff member added successfully!"
#
#             email = "projectmailbg@gmail.com"
#             em = obj.email
#
#             pwd = ob.password
#             sub = "Staff member added successfully!"
#             msg = 'Username:' + em + '& Password: ' + pwd
#             text = f'subject :{sub}\n\n{msg}'
#             server = smtplib.SMTP("smtp.gmail.com", 587)
#             server.starttls()
#             server.login(email, 'iqjjrhsyerovorav')
#             server.sendmail(email, str(em), text)
#
#
#
#
#
#             return HttpResponseRedirect('temp/admin')
#
#         return render(request,'staff/admin add staff.html',{'msg': msg})
#
#




from django.db import IntegrityError
from django.shortcuts import render, HttpResponseRedirect
from login.models import Login
import smtplib

# def adstaff(request):
#     msg = None
#     if request.method == 'POST':
#         name = request.POST.get('na')
#         place = request.POST.get('pl')
#         phone_number = request.POST.get('ph')
#         email = request.POST.get('em')
#
#         try:
#             # Create and save Staff object
#             obj = Staff.objects.create(
#                 name=name,
#                 place=place,
#                 phone_number=phone_number,
#                 email=email
#             )
#
#             # Create login credentials (after Staff is saved)
#             ob = Login.objects.create(
#                 username=obj.name,
#                 password=obj.phone_number,
#                 u_id=obj.pk,  # ✅ Correct primary key assignment
#                 type='staff'
#             )
#
#             # Send email notification
#             sender_email = "projectmailbg@gmail.com"
#             password = 'iqjjrhsyerovorav'
#             subject = "Staff member added successfully!"
#             message = f'Username: {email}\nPassword: {phone_number}'
#             text = f'Subject: {subject}\n\n{message}'
#
#             server = smtplib.SMTP("smtp.gmail.com", 587)
#             server.starttls()
#             server.login(sender_email, password)
#             server.sendmail(sender_email, email, text)
#             server.quit()
#
#             msg = "Staff member added successfully!"
#             return HttpResponseRedirect('temp/admin')
#
#         except IntegrityError:
#             msg = "Error: Email already exists."
#
#     return render(request, 'staff/admin add staff.html', {'msg': msg})
#

#
#


from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.db import IntegrityError
import smtplib
from .models import Staff
from login.models import Login

def adstaff(request):
    msg = None
    email_exists = False  # Variable to track email existence

    if request.method == 'POST':
        name = request.POST.get('na')
        place = request.POST.get('pl')
        phone_number = request.POST.get('ph')
        email = request.POST.get('em')

        # Check if the email already exists in Staff
        if Staff.objects.filter(email=email).exists():
            email_exists = True
        else:
            try:
                # Create and save Staff object
                obj = Staff.objects.create(
                    name=name,
                    place=place,
                    phone_number=phone_number,
                    email=email
                )

                # Create login credentials (after Staff is saved)
                ob = Login.objects.create(
                    username=obj.name,
                    password=obj.phone_number,
                    u_id=obj.pk,
                    type='staff'
                )

                # Send email notification
                sender_email = "projectmailbg@gmail.com"
                password = 'iqjjrhsyerovorav'
                subject = "Staff member added successfully!"
                message = f'Username: {email}\nPassword: {phone_number}'
                text = f'Subject: {subject}\n\n{message}'

                server = smtplib.SMTP("smtp.gmail.com", 587)
                server.starttls()
                server.login(sender_email, password)
                server.sendmail(sender_email, email, text)
                server.quit()

                msg = "Staff member added successfully!"
                return HttpResponseRedirect('temp/admin')

            except IntegrityError:
                msg = "Error: Could not add staff. Please try again."

    return render(request, 'staff/admin add staff.html', {'msg': msg, 'email_exists': email_exists})












from django.core.paginator import Paginator
from django.shortcuts import render
from .models import Staff


def manstaff(request):
    obj = Staff.objects.all().order_by('-staff_id')

    # Implement pagination with 3 items per page
    paginator = Paginator(obj, 3)
    page_number = request.GET.get('page')  # Get the page number from the request
    page_obj = paginator.get_page(page_number)  # Get the paginated objects

    context = {
        'a': page_obj  # Pass the paginated object to the template
    }

    return render(request, 'staff/admin man staff.html', context)


def edit(request, idd):
    ob = Staff.objects.get(staff_id=idd)
    context = {
        's':ob
    }
    if request.method == 'POST':
        obj = Staff.objects.get(staff_id=idd)
        obj.name = request.POST.get('na')
        obj.place = request.POST.get('pl')
        obj.phone_number = request.POST.get('ph')
        obj.email = request.POST.get('em')
        obj.save()

        ob=Login.objects.get(u_id=obj.staff_id,type="staff")
        ob.username=obj.name
        ob.password=obj.phone_number
        ob.save()
        return manstaff(request)
    return render(request, 'staff/edit staff.html', context)


def delete(request, idd):
    obj = Staff.objects.get(staff_id=idd)
    obj.delete()
    return manstaff(request)
def block(request, idd):
    obj = Staff.objects.get(staff_id=idd)
    obj.status='blocked'
    obj.save()
    u=Login()
    if u.u_id==idd and u.type=="staff":
        ulog=Login.objects.get(u_id=idd,type='staff')
    # if len(ulog)>0:
    #     ulog[0].delete()
        ulog.delete()
    return manstaff(request)




