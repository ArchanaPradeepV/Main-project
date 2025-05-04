from django.shortcuts import render
import datetime
# Create your views here.
# rzp_test_Ey8ivDWGODPlAZ == api
# ttmCr5Cy7mQYI2Eck7W6UD3u == sec


from django.shortcuts import render
from booking.models import Booking
from payment.models import Payment
from django.conf import settings
from django.http import HttpResponseRedirect
import razorpay

# def payment_form(request,idd):
#     uid=request.session["u_id"]
#     razorpay_key = 'rzp_test_Ey8ivDWGODPlAZ'
#     ob=Booking.objects.get(booking_id=idd)
#     amount=float(ob.package.amount)*100
#     context={
#         'razorpay_key': razorpay_key,
#         'amt':str(amount)
#     }
#     obj=Payment()
#     obj.booking_id=idd
#     obj.user_id=uid
#     obj.status='pending'
#     obj.amount=ob.package.amount
#     obj.owner_id=ob.user.user_id
#     obj.date=datetime.datetime.today()
#     obj.save()
#     request.session['payid']=str(obj.payment_id)
#     return render(request, 'paymentrazor.html', context)
#     # return HttpResponseRedirect('/temp/user/',context)





from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect
import datetime
# from .models import Booking, Payment

def payment_form(request, idd):
    uid = request.session.get("u_id")
    if not uid:
        return redirect('/login/')  # Ensure user is logged in

    razorpay_key = 'rzp_test_Ey8ivDWGODPlAZ'
    ob = Booking.objects.get(booking_id=idd)
    amount = float(ob.package.amount) * 100

    obj = Payment()
    obj.booking_id = idd
    obj.user_id = uid
    obj.status = 'pending'
    obj.amount = ob.package.amount
    obj.owner_id = ob.user.user_id
    obj.date = datetime.datetime.today()
    obj.save()

    request.session['payid'] = str(obj.payment_id)

    context = {
        'razorpay_key': razorpay_key,
        'amt': str(amount),
    }

    return render(request, 'paymentrazor.html', context)

 # Redirect after successful payment
import datetime
from django.shortcuts import render, redirect
# from .models import Booking, Payment


# def payment_form(request, idd):
#     uid = request.session.get("u_id")
#     razorpay_key = 'rzp_test_Ey8ivDWGODPlAZ'
#
#     # Fetch the booking details
#     ob = Booking.objects.get(booking_id=idd)
#     amount = float(ob.package.amount) * 100
#
#     # Check if a payment already exists for this booking by the same user
#     existing_payment = Payment.objects.filter(user_id=uid).exclude(status='failed').first()
#
#     if existing_payment:
#         # Redirect user if payment already exists
#         return redirect('payment_already_done')  # Change this to an actual view
#
#     # Create a new payment entry
#     obj = Payment(
#         booking_id=idd,
#         user_id=uid,
#         status='pending',
#         amount=ob.package.amount,
#         # owner_id=ob.user.user_id,
#         date=datetime.datetime.today()
#     )
#     obj.save()
#
#     # Store payment ID in session
#     request.session['payid'] = str(obj.payment_id)
#
#     context = {
#         'razorpay_key': razorpay_key,
#         'amt': str(amount)
#     }
#
#     return render(request, 'paymentrazor.html', context)


from django.http import JsonResponse

def update_payment(request):

    ob=Payment.objects.get(payment_id=request.session['payid'])
    ob.status='paid'
    ob.save()
    obj = Booking.objects.get(booking_id=ob.booking_id)
    obj.status='paid'
    obj.save()
    msg = {

        'al': 'Payment completed Successfully',

    }
    return JsonResponse(msg)




