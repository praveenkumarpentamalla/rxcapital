from django.shortcuts import render
# from dashboard.models import *

# Create your views here.
def home(request):
    return render(request,'webapp/home.html')

def about(request):
    return render(request,'webapp/about.html')


def platform(request):
    # pf = Addplatformlink.objects.all()
    # data = {
    #     'pf':pf
    # }
    return render(request,'webapp/platform.html')


def account_type(request):
    return render(request,'webapp/account_type.html')