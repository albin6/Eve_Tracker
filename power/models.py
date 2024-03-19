from django.db import models

# Create your models here.
class login(models.Model):
    logid = models.AutoField(primary_key=True)
    username = models.CharField("username",max_length=100)
    password =  models.CharField("password",max_length=100)
    role=models.CharField('role',max_length=10)
    #logid,username,password,role
    
class user(models.Model):
    User_id= models.AutoField(primary_key=True)
    User_name=models.CharField("uname", max_length=200)
    User_address=models.CharField("address", max_length=200)
    User_email=models.CharField("email", max_length=100)
    User_phone=models.CharField("phone", max_length=100)
    User_gender=models.CharField("User_gender", max_length=200,default="")
    User_dob=models.CharField("User_dob", max_length=200,default="")
    User_aadhar=models.CharField("User_dob", max_length=200,default="")
    User_state=models.CharField("User_dob", max_length=200,default="")
    User_district=models.CharField("User_dob", max_length=200,default="")
    User_village=models.CharField("User_dob", max_length=200,default="")
    User_status=models.CharField("status", max_length=200)
    Log_id=models.ForeignKey(login, on_delete=models.CASCADE, null=True)
#User_id,User_name,User_address,User_email,User_phone,User_location,User_district,Log_id,User_status

class employee(models.Model):
   staff_id= models.AutoField(primary_key=True)
   staff_name= models.CharField("Name",max_length=100)
   staff_address = models.CharField("Staff_address", max_length=500)
   staff_email = models.EmailField("Staff_email", max_length=200)
   staff_phone=models.CharField("Staff_phone",max_length=100)
   staff_location = models.CharField("Staff_location", max_length=200,default="")
   staff_status=models.CharField("Staff_status",max_length=50,default="")
   staff_logid=models.ForeignKey(login, on_delete=models.CASCADE, null=True)
   designation=models.CharField("designation",max_length=50,default="")


class Complaint(models.Model):
    Complaint_id= models.AutoField(primary_key=True)
    Complaint_subject= models.CharField("subject", max_length=100)
    Complaint_message= models.CharField("message", max_length=500)
    Complaint_date= models.CharField("date", max_length=100)
    incident_date= models.CharField("date", max_length=100)
    incident_type= models.CharField("incident_type", max_length=100)
    Complaint_reply= models.CharField("replay", max_length=500)
    user =models.ForeignKey(user, on_delete=models.CASCADE, null=True)
    staff =models.ForeignKey(employee, on_delete=models.CASCADE, null=True)
    assign_date= models.CharField("date", max_length=100)
    finish_date= models.CharField("date", max_length=100)
    remarks= models.CharField("remarks", max_length=500)

class training(models.Model):
    t_id= models.AutoField(primary_key=True)
    t_subject= models.CharField("subject", max_length=100)
    t_message= models.CharField("message", max_length=500)
    t_date= models.CharField("date", max_length=100)
    t_name= models.CharField("replay", max_length=500)
    resource_person= models.CharField("resource_person", max_length=500)


class helpline(models.Model):
   h_id= models.AutoField(primary_key=True)
   h_title= models.CharField("service_type",max_length=100)
   h_details = models.CharField("service_details", max_length=1000)

class act(models.Model):
   act_id= models.AutoField(primary_key=True)
   act_title= models.CharField("service_type",max_length=100)
   act_details = models.CharField("service_details", max_length=1000)

class tips(models.Model):
   tip_id= models.AutoField(primary_key=True)
   tip_safty= models.CharField("service_type",max_length=100)
   tip_details = models.CharField("service_details", max_length=1000)
   
   
class gallery(models.Model):
    g_id= models.AutoField(primary_key=True)
    g_details= models.CharField("service_details", max_length=1000)
    gal_img = models.FileField("news_img", max_length=1000,upload_to='images/')
    
class news(models.Model):
    news_id= models.AutoField(primary_key=True)
    news_subject= models.CharField("commi_name", max_length=100)
    news_details= models.CharField("service_details", max_length=1000)
    
	
class mail(models.Model):
    mail_id= models.AutoField(primary_key=True)
    mail_message= models.CharField("message", max_length=500)
    mail_date= models.CharField("date", max_length=100)
    complaint=models.ForeignKey(Complaint, on_delete=models.CASCADE,null=True)
    user =models.ForeignKey(user, on_delete=models.CASCADE, null=True)
    staff =models.ForeignKey(employee, on_delete=models.CASCADE, null=True)
   

