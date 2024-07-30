from django.shortcuts import render
# from count import countdown

# Create your views here.
def home(request):
  return render(request, 'home.html')