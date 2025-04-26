from django.shortcuts import render,redirect,HttpResponse
from django.contrib.auth import authenticate, login,logout

from . models import *
import razorpay
from django.http import JsonResponse
from django.core.mail import send_mail
from django.conf import settings    
from datetime import date
from django.template.loader import render_to_string
# from weasyprint import HTML
from django.shortcuts import get_object_or_404
from django.utils import timezone

# Create your views here.
def home(request):
    print("sdf")
    try:
        states=State.objects.all()
        places=Tourist_place.objects.all()
        return render(request,'trip_plan/home.html',{'states':states,'places':places})
    except Exception as e:
        print("error",e)
        return render(request,'trip_plan/home.html',{})

def loginn(request):
    if request.method=="POST":
        username=request.POST.get('uname') 
        password=request.POST.get('password')
        user=authenticate(request,username=username,password=password) 
        if user is not None:
            login(request,user)
            return HttpResponse('<script>alert("Welcome!"); window.location="/";</script>')
        else:
            return HttpResponse('<script>alert("invalid"); window.location="/loginn";</script>')
    else: 
        return render(request,'trip_plan/login.html')
    
def register(request):
    if request.method=="POST":
        name=request.POST.get('name')
        email=request.POST.get('email')
        phone=request.POST.get('phone')
        gender=request.POST.get('gender')
        password=request.POST.get('password')
        repassword=request.POST.get('repassword')
        if User.objects.filter(username=email).exists():
            return HttpResponse('<script>alert("User Already Exists!"); window.location="/register";</script>')
        if password==repassword:
            user=User.objects.create_user(username=email,first_name=name,email=email,password=password)
            user.save()
            reg=Userregister.objects.create(user=user,name=name,email=email,phone=phone,gender=gender,password=password) 
            reg.save()
            return HttpResponse('<script>alert("Registered"); window.location="/loginn";</script>')
        else:
            return HttpResponse('<script>alert("Password Missmatch!"); window.location="/register";</script>')
    else:
         return render(request,'trip_plan/register.html')
    
def logoutt(request):
    logout(request)
    return redirect('home')    


def detail(request,category):
    state=State.objects.get(name=category)
    places=Tourist_place.objects.filter(name=state)
    gallery=[i.image for i in places]
    gallery.extend([state.image,state.image1])
    return render(request,'trip_plan/detail.html',{'state':state,'places':places,'gallery':gallery})

def totalprice(g,p,gst_rate=18):
    f=int(p.price_per)*int(g)
    gst=(gst_rate * f) / 100
    # print(p.price_per)
    # print(f)
    total_amount=f + gst 
    return total_amount,gst,f

def reservation(request,category):
    if not User.objects.filter(username=request.user.username).exists():
        return redirect('loginn')
    else:
        places=Tourist_place.objects.get(place=category)
        if request.method=="POST":
            name=request.POST.get('Name')
            phone=request.POST.get('Number')
            guests=request.POST.get('noo')
            email=request.POST.get('email')
            date=request.POST.get('date')
            user=User.objects.get(username=request.user.username)
            total,gst,f=totalprice(guests,places)
            re=Reservation.objects.create(user=user,t_place=places,name=name,phone=phone,guest=guests,email=email,checkin=date,total=f,gst_amount=gst,total_amount=total)
            re.save()
            s=re.id
            return HttpResponse(f'<script>alert("Reserved"); window.location="/confirm/{s}";</script>')
    return render(request,'trip_plan/reservation.html',{'place':places})
# This create an instance of razorpay.Client class, which is used to interact with the Razorpay API.
# two parameters test API Key,API Secret
client = razorpay.Client(auth=("rzp_test_TBfF4W26Xkf4GO", "OJYkwRAieFbCtMc8VIysuO5o"))

def confirm(request, category):
    t = Reservation.objects.get(id=category, user=request.user)
    if request.method == "POST":
        t = Reservation.objects.get(id=category, user=request.user)

        total = t.total_amount * 0.25
        if total >= 50000:
            total=40000
            
        existing_confirmation = Confirmation.objects.filter(user=request.user, reservation=t).first()
        if existing_confirmation:
            return JsonResponse({'status': 'error', 'message': 'Confirmation already exists'})

        con = Confirmation.objects.create(user=request.user, reservation=t, paid_amount=total, status="Pending")
        con.save()
            # A dict named DATA is created which conains the details required to creae an order in razorpay
            # The amount is multiplied by 100 because Razorpay requires the amount in paise 
            # currency set to INR
            # A unique receipt id is generated using request.user.id which helps in tracking the transaction
            # the notes in dic contains extra details which can be used for custom
        DATA = {
            "amount": float(total) * 100,  # Convert to paise
            "currency": "INR",
            "receipt": f"receipt_{request.user.id}",
            "notes": {"key1": "value3", "key2": "value2", "payment_capture": "1"}
        }
        # creating an order with razorpay.The client.order.create(data=DATA)function sends a request to razorpay's API to create an order 
        razorpay_order = client.order.create(data=DATA)
        # razorpay_order will store the response which contains details like id,status and amount
        # the newly created order_id is extracted from the response and stored in order_id
        order_id = razorpay_order['id']
        # A Json response is send back to the frontend with order_id ,status 

        return JsonResponse({'order_id': order_id, 'status': 'order created', 'price': total, "res": t.id})

    return render(request, 'trip_plan/confirm.html', {'t': t})


from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def payment_success(request,category):
    if request.method == "POST":
        try:
            user = User.objects.get(username=request.user.username)
            t=Reservation.objects.get(id=category,user=request.user)
            con = Confirmation.objects.get(reservation=t)
            print("con",con)
            try:
                con.status="Partial"
                con.save()
            except Exception as e:
                print("errorrrrrerrwrwrwr",e)
            try:
                html_message = f"""
<body style="background-color:#f2f7fb; font-family:Arial, sans-serif; padding:30px;">
    <div style="max-width:600px; margin:auto; background-color:#ffffff; padding:30px; border-radius:10px; box-shadow:0 2px 8px rgba(0,0,0,0.1);">
        <h1 style="color:#2c3e50;">Dear {user.first_name},</h1>
        <p style="font-size:16px; color:#333333;">Thank you for your recent booking with <b><i style="color:#2980b9;">WoOx</i></b>.</p>
        
        <hr style="border:none; border-top:1px solid #dcdcdc; margin:20px 0;">

        <p style="font-size:16px;"><strong>Destination:</strong> {t.t_place.place}</p>
        <p style="font-size:16px;"><strong>Check-in Date:</strong> {t.checkin}</p>
        <p style="font-size:16px;"><strong>Amount Paid:</strong> ₹{con.paid_amount}</p>

        <hr style="border:none; border-top:1px solid #dcdcdc; margin:20px 0;">
        
        <h2 style="color:#2c3e50;">Questions?</h2>
        <p style="font-size:15px;">Email us at <a href="mailto:gouridemo@gmail.com" style="color:#2980b9;">gouridemo@gmail.com</a></p>
        <p style="font-size:15px;">Visit our website: <a href="http://127.0.0.1:8000/" style="color:#2980b9;">WoOx Booking Portal</a></p>

        <p style="margin-top:30px; font-size:16px;">We appreciate your booking and look forward to seeing you soon!</p>
        
        <p style="margin-top:40px;">Sincerely,</p>
        <p><b style="color:#2980b9;">The WoOx Team</b></p>
    </div>
</body>
"""
                # Send the email
                send_mail(
                    subject='WoOx Booking Confirmation',
                    message='This is the plain text message.',  # Plain text fallback
                    from_email=settings.EMAIL_HOST_USER,  # Correctly fetch from settings
                    recipient_list=[user.email],  # User email
                    fail_silently=False,
                    html_message=html_message  # HTML content
                )
            except Exception as e:
                print("error",e)
            print("hiiiiiii")
            return JsonResponse({'status': 'success'})

        except Exception as e:
            print("errorrrr",e)
            return JsonResponse({'status': 'error', 'message': str(e)})
        
def history(request):
    today=date.today()
    confirm = Confirmation.objects.filter(user=request.user)

    return render(request,'trip_plan/history.html',{"confirms":confirm,'today':today})

def about(request):
    return render(request,'trip_plan/about.html',{})

from django.core.paginator import Paginator

def deals(request):
    t=Tourist_place.objects.all()
    paginator = Paginator(t, 2)  # Show 2 offers per page (adjust as needed)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    return render(request,'trip_plan/deals.html',{"places":page_obj})
    
def feedback(request,category):
    if request.method == "POST":
        try:
            review = request.POST.get('review')
            rate = request.POST.get('rating')
            feed = Feedback.objects.create(name=request.user,date=date.today(),rating=rate,content=review)
            feed.save()
            reservation = Reservation.objects.get(t_place=Tourist_place.objects.get(place=category))
            reservation.feedback_given=True
            reservation.save()
            return redirect('home') 
        except Exception as e:
            print("error",e)
            return redirect('home')
    return render(request,'trip_plan/feedback.html',{'category':category})

def allreviews(request):
    feed= Feedback.objects.all()
    return render(request,'trip_plan/reviews.html',{"feed":feed})