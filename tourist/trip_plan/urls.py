
from django.urls import path
from . import views

urlpatterns = [
    path('',views.home,name='home'),
    path('loginn',views.loginn,name='loginn'),
    path('logoutt',views.logoutt,name='logoutt'),
    path('register',views.register,name='register'),
    path('detail/<category>',views.detail,name='detail'),
    path('reservation/<category>',views.reservation,name='reservation'),
    path('confirm/<category>',views.confirm,name='confirm'),
    path('payment_success/<category>',views.payment_success,name='payment_success'),
    path('history',views.history,name="history"),
    path('about',views.about,name='about'),
    path('deals',views.deals,name='deals'),
    path('feedback/<category>',views.feedback,name='feedback'),
    path('allreviews',views.allreviews,name="allreviews")
]
