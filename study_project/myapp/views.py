from django.shortcuts import render

def my_view(request):
    return render(request, "myapp/template/index.html", {"name": "World"}, content_type="text/html")

