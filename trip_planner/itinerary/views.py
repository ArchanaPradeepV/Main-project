from django.shortcuts import render,redirect
from itinerary.models import Itinerary
from django.http import HttpResponseRedirect



# Create your views here.
def aditin(request, idd):
    ss = request.session.get("u_id")  # Use .get() to avoid potential KeyError

    if request.method == 'POST':
        # Check if itinerary already exists
        if Itinerary.objects.filter(package_id=idd).exists():
            msg='Itinerary already exists'
            c={
                'a':msg
            }
            return render(request, 'itinerary/add itinerary.html',c)

        # Create a new itinerary entry
        obj = Itinerary()
        obj.package_id = idd
        obj.description = request.POST.get('des')
        obj.staff_id = ss
        obj.save()

        # return redirect('some_success_page')  # Redirect to a success page

    return render(request, 'itinerary/add itinerary.html')

# def manitin(request):
#     obj=Itinerary.objects.all()
#     dict={
#         'a':obj
#     }
#     return render(request,'itinerary/manage itinerary.html',dict)

def manitin(request):
    obj = Itinerary.objects.all()
    paginator = Paginator(obj, 1)  # Show 1 items per page

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    context = {
        'page_obj': page_obj
    }
    return render(request, 'itinerary/manage itinerary.html', context)


def edititin(request, idd):
    ob = Itinerary.objects.get(itinerary_id=idd)
    context = {
        's':ob
    }
    if request.method == 'POST':
        obj = Itinerary.objects.get(itinerary_id=idd)
        obj.description = request.POST.get('des')
        obj.save()
        return HttpResponseRedirect('/itinerary/manage/')


    return render(request, 'itinerary/edit itinerary.html', context)
def delete(request, idd):
    obj = Itinerary.objects.get(itinerary_id=idd)
    obj.delete()
    return manitin(request)
def viewitin(request,idd):
    obj=Itinerary.objects.filter(package_id=idd)
    dict={
        'a':obj
    }
    return render(request,'itinerary/view itinerary.html',dict)

# def viewitinadmin(request):
#     obj=Itinerary.objects.all()
#     dict={
#         'a':obj
#     }
#     return render(request, 'itinerary/admin view itin.html', dict)
#
#
from django.core.paginator import Paginator
from django.shortcuts import render
from .models import Itinerary


def viewitinadmin(request):
    obj = Itinerary.objects.all()
    paginator = Paginator(obj, 1)  # Show 3 items per page

    page_number = request.GET.get('page')  # Get current page number from request
    page_obj = paginator.get_page(page_number)  # Get the items for the requested page

    context = {
        'a': page_obj  # Pass the paginated data to the template
    }
    return render(request, 'itinerary/admin view itin.html', context)

from django.shortcuts import render, redirect
from .models import Itinerary
from django.contrib.auth.decorators import login_required
import random  # Simulating AI-based itinerary generation







# def customizeitin(request):
#
#     if request.method == "POST":
#
#         obj=Itinerary()
#         obj.destination = request.POST.get('destination')
#         obj.budget = request.POST.get('budget')
#         obj.days = request.POST.get('days')
#         ou = chat_with_gpt(f"Plan a {obj.days}-day trip to {obj.destination} within a budget of {obj.budget}")
#
#         context = {
#             'cust': ou,  # AI-generated itinerary
#             'destination': obj.destination,
#             'budget': obj.budget,
#             'days': obj.days,
#         }
#         return render(request, 'itinerary/result.html', context)
#
#     return render(request,'itinerary/customize.html')

def customizeitin(request):
    ss=request.session['u_id']
    if request.method == "POST":
        obj = Itinerary()
        obj.destination = request.POST.get('destination')
        obj.budget = request.POST.get('budget')
        obj.days = int(request.POST.get('days'))  # Convert to integer

        # AI-generated itinerary
        trip_plan = chat_with_gpt(f"Plan a {obj.days}-day trip to {obj.destination} within a budget of {obj.budget}")

        # **Budget Estimation Logic**

        context = {
            'cust': trip_plan,  # AI-generated itinerary
            'obj': obj,  # Pass the entire object instead of individual values
        }
        ab=Plan()
        ab.plan=trip_plan
        ab.user_id=ss
        ab.save()
        return render(request, 'itinerary/result.html', context)

    return render(request, 'itinerary/customize.html')






import openai



def chat_with_gpt(prompt):
    try:
        response = openai.ChatCompletion.create(
            model="gpt-3.5-turbo",  # Use "gpt-3.5-turbo" for a lighter model
            messages=[
                {"role": "system", "content": "You are a helpful assistant."},
                {"role": "user", "content": prompt}
            ],
            max_tokens=2000,  # Limit the length of the response
            temperature=0.7,  # Controls creativity (0-1)
        )
        return response['choices'][0]['message']['content'].strip()
    except Exception as e:
        return f"An error occurred: {e}"



from django.core.paginator import Paginator
from django.shortcuts import render
from .models import Plan



def viewaiitinstaff(request):
    # Fetch all AI itineraries
    obj = Plan.objects.all()
    # Paginate with 3 items per page
    paginator = Paginator(obj, 1)
    page_number = request.GET.get('page')  # Get current page number from request
    page_obj = paginator.get_page(page_number)  # Get the items for the requested page

    # Pass the paginated data to the template
    context = {
        'a': page_obj
    }

    return render(request, 'itinerary/staffvwai.html', context)




