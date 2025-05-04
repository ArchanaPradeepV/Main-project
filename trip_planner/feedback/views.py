from django.shortcuts import render
from feedback.models import Feedback
import datetime
from django.http import HttpResponseRedirect

# Create your views here.

from .models import Feedback
def feedform(request):
    ss=request.session["u_id"]
    if request.method=="POST":
        obj = Feedback()
        obj.feedback=request.POST.get('comments')
        obj.rating=request.POST.get('rating')
        obj.user_id=ss
        obj.date=datetime.datetime.today()
        obj.save()
        return HttpResponseRedirect('/temp/user/')
    return render(request,'feedback/userfeedback.html')


# def adminvwfeed(request):
#     obj=Feedback.objects.all()
#     dict={
#         'a':obj
#     }
#     return render(request, 'feedback/adminvwfeed.html',dict)

from django.core.paginator import Paginator
def adminvwfeed(request):
    obj = Feedback.objects.all().order_by('-feedbackid')
    paginator = Paginator(obj, 5)  # Show 5 feedbacks per page
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    dict = {
        'a': page_obj
    }
    return render(request, 'feedback/adminvwfeed.html', dict)


# def staffvwfeed(request):
#     obj=Feedback.objects.all()
#     dict={
#         'a':obj
#     }
#     return render(request, 'feedback/staffvwfeed.html',dict)




from django.core.paginator import Paginator

def staffvwfeed(request):
    obj = Feedback.objects.all().order_by('-feedbackid')
    paginator = Paginator(obj, 5)  # Show 5 feedbacks per page
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    dict = {
        'a': page_obj
    }
    return render(request, 'feedback/staffvwfeed.html', dict)