from django.shortcuts import render
from package.models import Package
from category.models import Category
from django.http import HttpResponseRedirect



from django.core.exceptions import ValidationError
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse


def validate_image_extension(file):
    valid_extensions = ['.jpg', '.jpeg', '.png']
    file_extension = file.name.split('.')[-1].lower()

    if f'.{file_extension}' not in valid_extensions:
        raise ValidationError("Invalid file type. Only JPG, JPEG, and PNG are allowed.")


def adpkg(request):
    ab=Category.objects.all()
    context={
        'a':ab
    }
    if request.method == 'POST':
        # Create a new Package object
        obj = Package()

        # Getting data from form
        obj.amount = request.POST.get('amt')
        obj.days = request.POST.get('day')
        obj.descriptiom = request.POST.get('des')
        obj.destination = request.POST.get('dest')
        obj.people = request.POST.get('people')
        obj.category_id=request.POST.get('ctr')

        # Image file validation
        myfile = request.FILES.get('img')
        if myfile:
            try:
                # Validate image extension
                validate_image_extension(myfile)

                # Save the image to the file system
                fs = FileSystemStorage()
                filename = fs.save(myfile.name, myfile)
                obj.image = filename  # Save the image filename in the model

            except ValidationError as e:
                return HttpResponse(str(e), status=400)  # Respond with an error message if validation fails

        # Save the package object
        obj.save()
        return HttpResponseRedirect('/temp/admin/')
    return render(request, 'package/admin add pkg.html',context)


# def viewstaffpkg(request):
#     obj=Package.objects.all()
#     dict={
#         'a':obj
#     }
#     return render(request,'package/staff view pkg.html',dict)

from django.core.paginator import Paginator
from django.shortcuts import render
from .models import Package  # Ensure you import your Package model

def viewstaffpkg(request):
    obj = Package.objects.all().order_by('-package_id')  # Fetch all packages
    paginator = Paginator(obj, 2)  # Show only 3 packages per page

    page_number = request.GET.get('page')  # Get page number from request
    page_obj = paginator.get_page(page_number)  # Get paginated packages

    return render(request, 'package/staff view pkg.html', {'a': page_obj})



# def viewuserpkg(request):
#     vv=request.POST.get('bk')
#     if request.method=="POST":
#         obj=Package.objects.filter(destination__icontains=vv)
#         dict={
#             'a':obj
#         }
#         return render(request, 'package/user view package.html', dict)
#     else:
#         obj = Package.objects.all()
#         dict = {
#             'a': obj
#         }
#     return render(request,'package/user view package.html',dict)

from django.shortcuts import render
from django.db.models import Q
from .models import Package

from django.shortcuts import render
from django.db.models import Q
from .models import Package



from django.shortcuts import render
from django.db.models import Q
from .models import Package

from django.shortcuts import render
from django.db.models import Q
from .models import Package

def viewuserpkg(request):
    obj = Package.objects.all()  # Default: Show all packages

    if request.method == "POST":
        search_query = request.POST.get('bk', '').strip()  # Get input and remove spaces

        if search_query:
            if search_query.isdigit():  # If input is a number, search by exact amount
                obj = obj.filter(amount=int(search_query))
            else:
                obj = obj.filter(
                    Q(destination__icontains=search_query) |  # Search by destination
                    Q(category__category_name__icontains=search_query)  # Search by category name
                )

    return render(request, 'package/user view package.html', {'a': obj})






# def mngpkg(request):
#     obj=Package.objects.all()
#     dict={
#         'a':obj
#     }
#     return render(request,'package/admin man pkg.html',dict)
from django.core.paginator import Paginator
from django.shortcuts import render
from .models import Package


def mngpkg(request):
    obj = Package.objects.all()

    # Pagination setup: Show 5 packages per page
    paginator = Paginator(obj, 3)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    context = {
        'a': page_obj  # Pass the paginated objects
    }
    return render(request, 'package/admin man pkg.html', context)


#
def edit(request, idd):
    # Get the package by its ID
    ob = Package.objects.get(package_id=idd)

    # Fetch all categories for the dropdown
    categories = Category.objects.all()

    # Add the package and categories to the context
    context = {
        's': ob,
        'a': categories,  # Add the categories to the context
    }

    if request.method == 'POST':
        # Get the package to edit
        obj = Package.objects.get(package_id=idd)
        obj.amount = request.POST.get('amt')
        obj.days = request.POST.get('day')
        obj.descriptiom = request.POST.get('des')
        obj.destination = request.POST.get('dest')
        obj.people = request.POST.get('people')
        obj.category_id = request.POST.get('ctr')  # Update the category

        # Image file validation
        myfile = request.FILES.get('img')
        if myfile:
            try:
                # Validate image extension
                validate_image_extension(myfile)

                # Save the image to the file system
                fs = FileSystemStorage()
                filename = fs.save(myfile.name, myfile)
                obj.image = filename  # Save the image filename in the model

            except ValidationError as e:
                return HttpResponse(str(e), status=400)  # Handle validation error

        # Save the updated package object
        obj.save()
        return mngpkg(request)  # Redirect or return to package management page

    return render(request, 'package/admin_edit_pkg.html', context)  # Render the edit template with categories


def delete(request, idd):
    obj = Package.objects.get(package_id=idd)
    obj.delete()
    return mngpkg(request)