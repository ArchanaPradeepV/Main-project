from django.shortcuts import render
from category.models import Category

def category(request):
    txt=""
    if request.method == 'POST':
        category=request.POST.get('ca')
        if Category.objects.filter(category_name=category).exists():
            txt="category already exists"
        else:
            obj = Category()
            obj.category_name = request.POST.get('ca')
            obj.save()
    context={
        'msg':txt
    }
    return render(request,'category/category.html',context)
