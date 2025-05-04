from django.shortcuts import render
from booking.models import Booking
from django.shortcuts import redirect
# Create your views here.
def booking(request,idd):
    ss=request.session['u_id']
    if request.method=="POST":
        obj = Booking()
        obj.date = request.POST.get('bb')
        obj.adults = request.POST.get('ad')
        obj.children = request.POST.get('ch')
        obj.status = "waiting for approval"
        obj.user_id=ss
        obj.package_id=idd
        obj.save()

        return redirect('temp/user/')

    return render(request,'booking/user_booking.html')


# def adminvwbook(request):
#     obj = Booking.objects.all()  # Fetch all packages
#
#     return render(request, 'booking/admin_vw_booking.html', {'a':obj})

from django.core.paginator import Paginator
from django.shortcuts import render
from .models import Booking

def adminvwbook(request):
    obj_list = Booking.objects.all().order_by('-booking_id').exclude(status='paid')  # Fetch all bookings and order by date
    paginator = Paginator(obj_list, 3)  # Show 5 bookings per page

    page_number = request.GET.get('page')  # Get the page number from request
    page_obj = paginator.get_page(page_number)  # Get the corresponding page

    return render(request, 'booking/admin_vw_booking.html', {'page_obj': page_obj})


# def staffvwbook(request):
#     obj = Booking.objects.all()  # Fetch all packages
#
#     return render(request, 'booking/staff_vw_booking.html', {'a': obj})
from django.core.paginator import Paginator
from django.shortcuts import render
from .models import Booking

def staffvwbook(request):
    obj = Booking.objects.all().order_by('-booking_id')  # Fetch all bookings sorted by date

    # Paginate with 10 bookings per page
    paginator = Paginator(obj, 3)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 'booking/staff_vw_booking.html', {'page_obj': page_obj})



# def view_accepted_booking_pay(request):
#     ss=request.session["u_id"]
#     obj = Booking.objects.filter(status="accepted",user_id=ss)
#     # Fetch all packages
#
#     return render(request, 'booking/view_and_pay.html', {'a': obj})

#
# def view_accepted_booking_pay(request):
#     ss = request.session["u_id"]
#     # Fetch bookings with status 'accepted' or 'paid'
#     obj = Booking.objects.filter(user_id=ss, status__in=["accepted", "paid"])
#     return render(request, 'booking/view_and_pay.html', {'a': obj})


from django.core.paginator import Paginator


def view_accepted_booking_pay(request):
    ss = request.session["u_id"]
    # Fetch bookings with status 'accepted' or 'paid'
    obj = Booking.objects.filter(user_id=ss, status__in=["accepted", "paid"])

    # Add pagination
    paginator = Paginator(obj, 5)  # Show 5 bookings per page
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 'booking/view_and_pay.html', {'a': page_obj})




def accept(request,idd):
    obj=Booking.objects.get(booking_id=idd)
    obj.status="Accepted"
    obj.save()
    return adminvwbook(request)
def reject(request,idd):
    obj=Booking.objects.get(booking_id=idd)
    obj.status="Rejected"
    obj.save()
    return adminvwbook(request)



# def userviewbook(request):
#     s=request.session['u_id']
#     obj = Booking.objects.filter(user_id=s).order_by('-booking_id')  # Fetch all bookings sorted by date
#
#     # Paginate with 10 bookings per page
#     paginator = Paginator(obj, 3)
#     page_number = request.GET.get('page')
#     page_obj = paginator.get_page(page_number)
#
#     return render(request, 'booking/usrvwbookedpkg.html', {'page_obj': page_obj})
from django.core.paginator import Paginator
from django.shortcuts import render
from .models import Booking

def userviewbook(request):
    s = request.session.get('u_id')  # Get user ID from session
    obj = Booking.objects.filter(user_id=s).order_by('-booking_id')  # Fetch all bookings sorted by ID desc

    # Paginate with 3 bookings per page
    paginator = Paginator(obj, 3)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 'booking/usrvwbookedpkg.html', {'page_obj': page_obj})
