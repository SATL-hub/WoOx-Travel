from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone

# Create your models here.
class Userregister(models.Model):
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    name=models.CharField(max_length=50,null=True,blank=True)
    email=models.EmailField(null=True,blank=True)
    phone=models.BigIntegerField(null=True,blank=True)
    gender=models.CharField(max_length=50,null=True,blank=True)
    password=models.CharField(max_length=12,null=True,blank=True)

    def __str__(self):
        return self.user.first_name
    
class State(models.Model):
    name=models.CharField(max_length=50,null=True,blank=True)
    population=models.CharField(max_length=50,null=True,blank=True) 
    area=models.CharField(max_length=50,null=True,blank=True) 
    image=models.ImageField(upload_to='state/',null=True,blank=True)
    content=models.TextField()
    image1=models.ImageField(upload_to='state/',null=True,blank=True)

    def __str__(self):
        return self.name
    
class Tourist_place(models.Model):
    name=models.ForeignKey(State,on_delete=models.CASCADE)
    place=models.CharField(max_length=100,null=True,blank=True)
    details=models.TextField(null=True,blank=True)
    price_per=models.IntegerField(null=True,blank=True)
    days=models.CharField(max_length=50,null=True,blank=True) 
    image=models.ImageField(upload_to='place/',null=True,blank=True)

    def __str__(self):
        return f"{self.name.name}-{self.place}"
    
class Reservation(models.Model):
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    t_place=models.ForeignKey(Tourist_place,on_delete=models.CASCADE)
    name=models.CharField(max_length=50,null=True,blank=True) 
    phone=models.BigIntegerField(null=True,blank=True)
    email=models.EmailField(null=True,blank=True)
    checkin=models.DateField(null=True,blank=True)
    guest=models.IntegerField(null=True,blank=True)
    total=models.IntegerField(null=True,blank=True)
    gst_amount=models.IntegerField(null=True,blank=True)
    total_amount=models.IntegerField(null=True,blank=True)  
    feedback_given = models.BooleanField(default=False)


    def __str__(self):
        return f"{self.t_place}"
    
class Confirmation(models.Model):
    STATUS_CHOICES=[
        ('Pending','Pending'),
        ('Partial','Partial'),
        ('Full','Full')
    ]
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    reservation=models.ForeignKey(Reservation,on_delete=models.CASCADE)
    paid_amount=models.BigIntegerField(null=True,blank=True)
    status=models.CharField(max_length=50,choices=STATUS_CHOICES,default='Pending') 

    def __str__(self):
        return self.user.first_name

class Feedback(models.Model):
    name=models.ForeignKey(User,on_delete=models.CASCADE)
    date=models.DateField(default=timezone.now)  
    rating=models.IntegerField(null=True,blank=True)    
    content=models.TextField()

    def __str__(self):
        return self.name.first_name

