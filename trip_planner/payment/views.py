from django.shortcuts import render
from payment.models import Payment

# Create your views here.

#
# def view_payment(request):
#     obj = Payment.objects.all()  # Fetch all packages
#
#     return render(request, 'payment/view_payment.html', {'a': obj})

from django.core.paginator import Paginator
from django.shortcuts import render
from .models import Payment

def view_payment(request):
    obj = Payment.objects.all().order_by('-booking_id')  # Fetch all payments

    # Pagination
    paginator = Paginator(obj, 3)  # Show 10 payments per page
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 'payment/view_payment.html', {'a': page_obj})

#


# def view_payment_admin(request):
#     obj = Payment.objects.all()  # Fetch all packages
#
#     return render(request, 'payment/view_payment_admin.html', {'a': obj})

from django.core.paginator import Paginator
from django.shortcuts import render
from .models import Payment

def view_payment_admin(request):
    obj = Payment.objects.all().order_by('-booking_id')  # Fetch all payments

    # Pagination
    paginator = Paginator(obj, 3)  # Show 10 payments per page
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 'payment/view_payment_admin.html', {'a': page_obj})
