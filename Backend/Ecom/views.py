from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from .forms import CreateUserForm
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout

newuser =True


def register(request):
    form = CreateUserForm()

    if request.method == 'POST':
        form = CreateUserForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            messages.success(request, f'{username}, Your account was created successfully')
            return redirect('/login')
    return render(request, 'register.html', {'form': form})


def loginPage(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)

        if user is not None:

            login(request, user)
            return redirect('/shop')
        else:
            messages.info(request, 'Username or Password is Incorrect')
    return render(request, 'login.html', {'newuser': newuser})


def logOutUser(request):
    logout(request)
    return redirect('/login')
