from django.shortcuts import render
from trip_planner import settings
from pandas import read_excel
from package.models import Package

# Create your views here.

def predict(request):
    if request.method=='POST':
        a1=request.POST.get('vn')
        print(a1)
        a2=request.POST.get('vp')
        print (a2)
        a3= request.POST.get('vk')
        print(a3)
        a4 = request.POST.get('tm')
        print(a4)
        a5 = request.POST.get('hm')
        print(a5)
        a6 = request.POST.get('ph')
        print(a6)
        # a7 = request.POST.get('rf')
        # print(a7)
        imgpath = str(settings.BASE_DIR) + str(settings.STATIC_URL) + "all_combinations_updated_labels.xlsx"
        data = read_excel(imgpath, "Sheet1")
        X = data.iloc[:, 0:6].values
        y = data.iloc[:, 6].values

        test = [float(a1), float(a2), float(a3), float(a4), float(a5), float(a6)]
        from sklearn.ensemble import RandomForestClassifier
        sv = RandomForestClassifier(n_estimators=100)
        sv.fit(X, y)
        res = sv.predict([test])

        print(res[0])
        print("Predicted Category ID:", res[0])
        # context = {
        #     'kk': res[0]
        # }
        vv=Package.objects.filter(category_id=res)
        context={
            'a':vv,
        }
        return render(request, 'package/pkgview.html', context)
    return render(request, 'predict/prediction.html')




# def predict(request):
#     if request.method=='POST':
#         a1=request.POST.get('vn')
#         print(a1)
#         a2=request.POST.get('vp')
#         print (a2)
#         a3= request.POST.get('vk')
#         print(a3)
#         a4 = request.POST.get('tm')
#         print(a4)
#         a5 = request.POST.get('hm')
#         print(a5)
#         a6 = request.POST.get('ph')
#         print(a6)
#         # a7 = request.POST.get('rf')
#         # print(a7)
#         imgpath = str(settings.BASE_DIR) + str(settings.STATIC_URL) + "all_combinations_with_labels.xlsx"
#         data = read_excel(imgpath, "Sheet1")
#         X = data.iloc[:, 0:6].values
#         y = data.iloc[:, 6].values
#
#         test = [float(a1), float(a2), float(a3), float(a4), float(a5), float(a6)]
#         from sklearn.ensemble import RandomForestClassifier
#         sv = RandomForestClassifier(n_estimators=100)
#         sv.fit(X, y)
#         res = sv.predict([test])
#
#         print(res[0])
#
#         context = {
#             'kk': res[0]
#         }
#         return render(request, 'predict/results.html', context)
#     return render(request, 'predict/prediction.html')
#



