from django.shortcuts import render,redirect
import datetime
from datetime import date
from django.core.files.storage import FileSystemStorage
from django.db.models import Q
from .models import user as usr,login as log,employee as stf,Complaint as comp,training as fed,helpline as cate,act as ser,tips as pay,mail as ma,gallery as gal,news as ne
from django.contrib import messages
# Create your views here.
def index(request):
    msg=request.GET.get("msg",'')
    if(request.session.get('role', ' ')=="admin"):
        response = redirect('/admin')
        return response
    elif(request.session.get('role', ' ')=="provider"):
        response = redirect('/staff')
        return response
    elif(request.session.get('role', ' ')=="user"):
        response = redirect('/user')
        return response
    else:
        return render(request,"index.html",{"msg":msg})
def admin(request):
    if(request.session.get('role', ' ')=="admin"):
        return render(request,"adminhome.html")
    else:
        response = redirect('/index'+"?msg=session expired login again")
        return response
def user(request):
    if(request.session.get('role', ' ')=="user"):
        msg="Registers successfuly"
        return render(request,"userhome.html")
    else:
        response = redirect('/index'+"?msg=session expired login again")
        return response
def staff(request):
    if(request.session.get('role', ' ')=="staff"):
        return render(request,"staffhome.html")
    else:
        response = redirect('/index'+"?msg=session expired login again")
        return response
def User_Reg(request):
    msg=request.GET.get("msg",'')
    return render(request,"UserReg.html",{"msg":msg})

def about(request):
    msg=request.GET.get("msg",'')
    return render(request,"about.html",{"msg":msg})

def contact(request):
    msg=request.GET.get("msg",'')
    return render(request,"contact.html",{"msg":msg})


def nurse(request):
    if(request.session.get('role', ' ')=="Nurse"):
        return render(request,"nursehome.html")
    else:
        response = redirect('/index'+"?msg=session expired login again")
        return response

def register_user(request):
    msg=""
    if request.POST:
        t1 = request.POST["t1"]
        t2 = request.POST["t2"]
        t3 = request.POST["t3"]
        t4 = request.POST["t4"]
        t5 = request.POST["t5"]
        t6 = request.POST["t6"]
        t7 = request.POST["t7"]
        t8 = request.POST["t8"]
        t9 = request.POST["t9"]
        t10 = request.POST["t10"]
       
        
        t11= request.POST["t11"]
        t12 = request.POST["t12"]
        log.objects.create(username=t7, password=t8, role="user")
        data=log.objects.last()
        usr.objects.create(User_name=t1,User_dob=t2,User_address=t3,User_gender=t4,User_email=t5,User_phone=t6,User_aadhar=t9,User_state=t10,User_district=t11,User_village=t12, User_status="approved",Log_id=data)
        messages.add_message(request, messages.INFO, 'Registered successfully.')
        response = redirect('index')
        return response
    else:    
        msg = ""
    data1=usr.objects.all()
    return render(request,"UserReg.html",{"msg":msg,"data":data1}) 
    
def Staff_Reg(request):
    msg=""
    data1=cate.objects.all()
    return render(request,"Staff_Reg.html",{"msg":msg,"data":data1})
def register_provider(request):
    msg=""
    if request.POST:
        t1 = request.POST["t1"]
        t2 = request.POST["t2"]
        t3 = request.POST["t3"]
        t4 = request.POST["t4"]
        t5 = request.POST["t5"]
        t6=request.POST["t6"]
        
        t7 = request.POST["t7"]
        t8 = request.POST["t8"]
        
        log.objects.create(username=t7, password=t8, role="staff")
        data=log.objects.last()
        stf.objects.create(staff_name=t1,staff_email=t2,staff_phone=t3,staff_location=t5,staff_address=t6, staff_status="waiting",staff_logid=data,designation=t4)
        msg="Registers successfuly"
        data1=stf.objects.all()
        messages.add_message(request, messages.INFO, 'Registered successfully.')
        response = redirect('Staff_Reg')
        return response
    else:    
        msg = ""
    data1=stf.objects.all()
    
    return render(request,"List_staff.html",{"msg":msg,"data":data1})  

def Login(request):
    msg=""
    data1=cate.objects.all()
    return render(request,"Login.html",{"msg":msg,"data":data1})
def Login_now(request):
    if request.POST:
        user = request.POST["username"]
        password = request.POST["password"]
        try:
            data = log.objects.get(username=user, password=password)
            if (data.role == "admin"):
                request.session['username'] = data.username
                request.session['role'] = data.role
                request.session['id'] = data.logid
                response = redirect('/admin')
                return response
            elif (data.role == "staff"):
                request.session['username'] = data.username
                request.session['role'] = data.role
                request.session['id'] = data.logid
                response = redirect('/staff')
                return response
            elif(data.role =="user"):
                request.session['username'] = data.username
                request.session['role'] = data.role
                request.session['id'] = data.logid
                response = redirect('/user')
                return response       
            else:
                return render(request, "index.html", {"msg": "invalid account Details"})
        except:
            return render(request, "index.html", {"msg": "invalid user name or password "})
    else:
        response = redirect('/index')
        return response

def Profile(request):
    msg=""
    ids=request.session["id"]
    if request.POST:
        if request.session["role"] =="staff":
            t2 = request.POST["t6"]
            t3 = request.POST["t2"]
            t4 = request.POST["t3"]
            stf.objects.filter(staff_logid=ids).update(staff_address=t2,staff_email=t3,staff_phone=t4)
        elif request.session["role"] =="user":
            t2 = request.POST["t6"]
            t3 = request.POST["t2"]
            t4 = request.POST["t3"]
           
            usr.objects.filter(Log_id=ids).update(User_address=t2,User_email=t3,User_phone=t4)
        
    
    if request.session["role"] =="staff":
        data1=stf.objects.get(staff_logid=ids)
        returnpage="StaffProfile.html"
    elif request.session["role"] =="user":
        data1=usr.objects.get(Log_id=ids)
        returnpage="Userprofile.html"
    else:
        response = redirect('/index'+"?msg=session expired login again")
        return response
    return render(request,returnpage,{"msg":msg,"data":data1})




def complaints(request):
        msg=""
        #datax=usr.objects.get(Log_id=request.session["id"])
        if request.POST:
                t1 = request.POST["t1"]
                t2 = request.POST["t2"]
                
                msg="updated sucessfully"
                comp.objects.filter(Complaint_id=t1).update(Complaint_reply=t2)
        data1=comp.objects.all()
        return render(request, "Answer_Queries.html",{"msg":msg,"data":data1})

def Feedback(request):
        msg=""
        #datax=usr.objects.get(Log_id=request.session["id"])
        if request.POST:
                t1 = request.POST["t1"]
                t2 = request.POST["t2"]
                
                msg="updated sucessfully"
                fed.objects.filter(Feedback_id=t1).update(Feedback_reply=t2)
        data1=fed.objects.all()
        return render(request, "Answer_Queries1.html",{"msg":msg,"data":data1})
def UserFeedback(request):
        msg=""
        d=request.session['id'] 
        datal=log.objects.get(logid=d) 
        datau=usr.objects.get(Log_id=datal)
        #datax=usr.objects.get(Log_id=request.session["id"])
        if request.POST:
                ids=request.session["id"]
                t1 = request.POST["t1"]
                t2 = request.POST["t2"]
                t3 = "2022-02-22"
                msg="updated sucessfully"
                fed.objects.create(Feedback_subject=t1,Feedback_message=t2,Feedback_date=t3,Feedback_reply="not yet Seen",user=datau)
        data1=fed.objects.filter(user_id=datau).all()
        return render(request, "UserFeedback.html",{"msg":msg,"data":data1})
def Logout(request):
    try:
        del request.session['id']
        del request.session['role']
        del request.session['username']
        response = redirect("/index?id=logout")
        return response
    except:
        response = redirect("/index?id=logout")
        return response

def All_Users(request):
    msg=""
    data=usr.objects.all()
    return render(request,"All_Users.html",{"msg":msg,"data":data}) 
def remove_usr(request):
    usr.objects.filter(Log_id=request.GET["id"]).delete()
    log.objects.filter(logid=request.GET["id"]).delete()
    response = redirect('/All_Users')
    return response
def Privacy(request):
    msg=""
    if request.POST:
        t1=request.POST["t1"]
        t2=request.POST["t2"]
        id=request.session["id"]
        data=log.objects.get(logid=id)
        if data.password==t1:
            msg="sucessfully updated"
            log.objects.filter(logid=id).update(password=t2)
        else:
            msg="invalid current password"

    returnpage="adminhead.html"
    if(request.session.get('role', ' ')=="staff"):
        returnpage="staffhead.html"
    if(request.session.get('role', ' ')=="admin"):
        returnpage="adminhead.html"
    elif(request.session.get('role', ' ')=="user"):
        returnpage="userhead.html"
    return render(request, "privacy.html",{"role":returnpage,"msg":msg})

def delete_staff(request):
    stf.objects.filter(staff_logid=request.GET["id"]).delete()
    log.objects.filter(logid=request.GET["id"]).delete()
    response = redirect('/List_Staff')
    return response
def List_Staff(request):
    msg = ""
    data1=stf.objects.all()
    return render(request,"List_staff.html",{"msg":msg,"data":data1}) 
def approve_provider(request):
        t2=request.GET["id"]
        #datax=usr.objects.get(Log_id=request.session["id"])
        msg="updated sucessfully"
        stf.objects.filter(Provide_logid=t2).update(Provide_status="approve")
        log.objects.filter(logid=t2).update(role="provider")
        data1=comp.objects.all()
        response = redirect('/List_Staff')
        return response

def Committee_Reg(request):
    msg=""
    data1=cate.objects.all()
    return render(request,"Committee_Reg.html",{"msg":msg,"data":data1})        
def register_committee(request):
    msg=""
    if request.POST:
        t1 = request.POST["t1"]
        t2 = request.POST["t2"]
       
        
        pay.objects.create(tip_safty=t1,tip_details=t2)
        messages.add_message(request, messages.INFO, 'Added successfully.')
        response = redirect('/Committee_Reg')
        return response
    else:    
        msg = ""
    data1=cate.objects.all()
    return render(request,"Committee_Reg.html",{"msg":msg,"data":data1}) 
def List_committee(request):
    msg = ""
    data1=pay.objects.all()
    return render(request,"List_committee.html",{"msg":msg,"data":data1}) 
def delete_category(request):
    pay.objects.filter(tip_id=request.GET["id"]).delete()
    response = redirect('/List_committee')
    return response
    
def ViewServices(request):
    msg = ""
    data1=ser.objects.all()
    return render(request,"ViewServices.html",{"msg":msg,"data":data1})
    
   
def ViewPayments(request):
    msg = ""
    id=request.GET["id"]
    data1=pay.objects.filter(servicerequest=id).all()
    return render(request,"ViewPayment.html",{"msg":msg,"data":data1})
def RequestService(request):
    msg = ""
    data1=stf.objects.all()
    return render(request,"RequestService.html",{"msg":msg,"data":data1}) 
def AddRequest(request):
        msg=""
        d=request.session['id'] 
        datal=log.objects.get(logid=d) 
        datau=usr.objects.get(Log_id=datal)
        #datax=usr.objects.get(Log_id=request.session["id"])
        if request.POST:
                ids=request.session["id"]
                
                t1 = 22
                pl=log.objects.get(logid=t1) 
               
                t2 = request.POST["t2"]
                p2=cate.objects.get(catgerory_id=t2) 
                t3 = "2022-02-22"
                s1 = request.POST["s1"]
                s2 = request.POST["s2"]
                msg="Register sucessfully"
                ser.objects.create(service_type=s1,service_details=s2,reg_date=t3,request_date=t3,request_rating="4star",user=datau,request_status="pending",Provide_logid=pl,catgerory=p2)
        data1=ser.objects.filter(user_id=datau).all()
        return render(request, "ServiceHistory.html",{"msg":msg,"data":data1})

def ServiceHistory(request):
    msg = ""
    d=request.session['id'] 
    datal=log.objects.get(logid=d) 
    datau=usr.objects.get(Log_id=datal)
    data1=ser.objects.filter(user_id=datau).all()
    return render(request,"ServiceHistory.html",{"msg":msg,"data":data1}) 
def ServicePayments(request):
    msg = ""
    id=request.GET["id"]
    data1=pay.objects.filter(servicerequest=id).all()
    return render(request,"ServicePayments.html",{"msg":msg,"data":data1})
def AddPayment(request):
        msg=""
        d=request.session['id'] 
        datal=log.objects.get(logid=d) 
        datau=usr.objects.get(Log_id=datal)
        #datax=usr.objects.get(Log_id=request.session["id"])
        if request.POST:
                ids=request.session["id"]
                
                t1 = 22
               
               
                t2 = request.POST["t1"]
                pl=ser.objects.get(request_id=t2) 
                t3 = 2000
                s1 = request.POST["s1"]
                s2 = request.POST["s2"]
                msg="Register sucessfully"
                pay.objects.create(amount=t3,pay_status="Payment Complete",servicerequest=pl,user=datau)
        data1=pay.objects.filter(user_id=datau).all()
        return render(request, "ServicePayments.html",{"msg":msg,"data":data1})

def providerService(request):
    msg = ""
    d=request.session['id'] 
    datal=log.objects.get(logid=d) 
    datau=22
    data1=ser.objects.filter(Provide_logid=datau).all()
    return render(request,"providerService.html",{"msg":msg,"data":data1}) 
def UpdateRequest(request):
        t2=request.GET["id"]
        #datax=usr.objects.get(Log_id=request.session["id"])
        msg="updated sucessfully"
        ser.objects.filter(request_id=t2).update(request_status="approve")
        datau=22
        data1=ser.objects.filter(Provide_logid=datau).all()
        response = redirect('/providerService')
        return response
def RequestPayments(request):
    msg = ""
    id=request.GET["id"]
    data1=pay.objects.filter(servicerequest=id).all()
    return render(request,"RequestPayments.html",{"msg":msg,"data":data1})

def News_Reg(request):
    msg=""
    data1=pay.objects.all()
    return render(request,"News_Reg.html",{"msg":msg,"data":data1})        
def News_Register(request):
    msg=""
    if request.POST:
        t1 = request.POST["t1"]
        t2 = request.POST["t2"]
       
        
        ne.objects.create(news_subject=t1,news_details=t2)
        msg="Registers successfuly"
        messages.add_message(request, messages.INFO, 'Added successfully.')
        response = redirect('/News_Reg')
        return response
    else:    
        msg = ""
    data1=cate.objects.all()
    return render(request,"News_Reg.html",{"msg":msg,"data":data1}) 
def List_news(request):
    msg = ""
    data1=ne.objects.all()
    return render(request,"List_news.html",{"msg":msg,"data":data1}) 
def delete_news(request):
    ne.objects.filter(news_id=request.GET["id"]).delete()
    response = redirect('/List_news')
    return response


def program_Reg(request):
    msg=""
    data1=cate.objects.all()
    return render(request,"program_Reg.html",{"msg":msg,"data":data1})        
def program_Register(request):
    msg=""
    if request.POST:
        t1 = request.POST["t1"]
        t2 = request.POST["t2"]
            
        ser.objects.create(act_title=t1,act_details=t2)
        messages.add_message(request, messages.INFO, 'Added successfully.')
        response = redirect('/program_Reg')
        return response
    else:    
        msg = ""
    data1=cate.objects.all()
    return render(request,"program_Reg.html",{"msg":msg,"data":data1}) 
def List_program(request):
    msg = ""
    data1=ser.objects.all()
    return render(request,"List_program.html",{"msg":msg,"data":data1}) 
def delete_program(request):
    ser.objects.filter(act_id=request.GET["id"]).delete()
    response = redirect('/List_program')
    return response



def traing_Reg(request):
    msg=""
    data1=cate.objects.all()
    return render(request,"tra_Reg.html",{"msg":msg,"data":data1})        
def tra_Register(request):
    msg=""
    if request.POST:
        t1 = request.POST["t1"]
        t2 = request.POST["t2"]
        t3 = request.POST["t3"]
        t4 = request.POST["t4"]
        t5 = request.POST["t5"]
       
        
        fed.objects.create(t_subject=t2,t_message=t4,t_date=t3,t_name=t1,resource_person=t5)
        messages.add_message(request, messages.INFO, 'Added successfully.')
        response = redirect('/traing_Reg')
        return response
    else:    
        msg = ""
    data1=cate.objects.all()
    return render(request,"tra_Reg.html",{"msg":msg,"data":data1}) 
def list_traing(request):
    msg = ""
    data1=fed.objects.all()
    return render(request,"List_tra.html",{"msg":msg,"data":data1}) 
def delete_tra(request):
    fed.objects.filter(t_id=request.GET["id"]).delete()
    response = redirect('/list_traing')
    return response

def add_help(request):
    msg=""
    data1=cate.objects.all()
    
    return render(request,"help_Reg.html",{"msg":msg,"data":data1})        
def help_Register(request):
    msg=""
    if request.POST:
        t1 = request.POST["t1"]
        t2 = request.POST["t2"]
        
       
        
        cate.objects.create(h_title=t1,h_details=t2)
        messages.add_message(request, messages.INFO, 'Added successfully.')
        response = redirect('/add_help')
        return response
    else:    
        msg = ""
    data1=cate.objects.all()
    return render(request,"help_Reg.html",{"msg":msg,"data":data1}) 
def list_help(request):
    msg = ""
    data1=cate.objects.all()
    return render(request,"List_help.html",{"msg":msg,"data":data1}) 
def delete_help(request):
    cate.objects.filter(h_id=request.GET["id"]).delete()
    response = redirect('/list_help')
    return response



def add_gallery(request):
    msg=""
    data1=cate.objects.all()
    return render(request,"gallery_Reg.html",{"msg":msg,"data":data1})        
def gallery_Register(request):
    msg=""
    if request.POST:
        t1 = request.POST["t1"]
        tf2 = request.FILES["tf1"]
        
       
        
        gal.objects.create(g_details=t1,gal_img=tf2)
        messages.add_message(request, messages.INFO, 'Added successfully.')
        response = redirect('/add_gallery')
        return response
    else:    
        msg = ""
    data1=cate.objects.all()
    return render(request,"gallery_Reg.html",{"msg":msg,"data":data1}) 
def list_gallery(request):
    msg = ""
    data1=gal.objects.all()
    return render(request,"List_gallery.html",{"msg":msg,"data":data1}) 
def delete_gallery(request):
    gal.objects.filter(g_id=request.GET["id"]).delete()
    response = redirect('/list_gallery')
    return response








def manage_complaint(request):
    msg = ""
    data1=comp.objects.all()
    data2=stf.objects.all()
    return render(request,"manage_complaint.html",{"msg":msg,"data":data1,"d":data2})
def delete_complaint(request):
    comp.objects.filter(Complaint_id=request.GET["id"]).delete()
    response = redirect('/manage_complaint')
    return response 

def Allot_complaints(request):
        msg=""
        #datax=usr.objects.get(Log_id=request.session["id"])
        if request.POST:
                t1 = request.POST["t1"]
                t2 = request.POST["s1"]
                
                msg="updated sucessfully"
                comp.objects.filter(Complaint_id=t1).update(staff=t2)
        data1=comp.objects.all()
        return render(request, "manage_complaint.html",{"msg":msg,"data":data1})
def View_feedback(request):
    msg = ""
    data1=fed.objects.all()
    return render(request,"View_feedback.html",{"msg":msg,"data":data1}) 
def delete_feedback(request):
    fed.objects.filter(Feedback_id=request.GET["id"]).delete()
    response = redirect('/View_feedback')
    return response
def reg_user_complaint(request):
    msg=""
    data1=cate.objects.all()
    return render(request,"reg_user_complaint.html",{"msg":msg,"data":data1})   
def Complaint_reg(request):
        msg=""
        d=request.session['id'] 
        datal=log.objects.get(logid=d) 
        datau=usr.objects.get(Log_id=datal)
        #datax=usr.objects.get(Log_id=request.session["id"])
        if request.POST:
                ids=request.session["id"]
                
                t1 = request.POST["t1"]
                t2 = request.POST["t2"]
                t4 = request.POST["t3"]
                t5 = request.POST["t4"]
                t3 = date.today()
                messages.add_message(request, messages.INFO, 'Added successfully.')
                comp.objects.create(Complaint_subject=t1,Complaint_message=t2,Complaint_date=t3,incident_date=t4,incident_type=t5,Complaint_reply="not yet Seen",user=datau)
        response = redirect('/reg_user_complaint')
        return response
def ListUserComplaint(request):
    msg = ""
    d=request.session['id']
    datal=log.objects.get(logid=d) 
    datau=usr.objects.get(Log_id=datal)
    data1=comp.objects.filter(user=datau).all()
    return render(request,"ListUserComplaint.html",{"msg":msg,"data":data1})
def Reg_feedback(request):
    msg=""
    data1=fed.objects.all()
    return render(request,"Reg_feedback.html",{"msg":msg,"data":data1}) 
def Feedback_reg(request):
        msg=""
        d=request.session['id'] 
        datal=log.objects.get(logid=d) 
        datau=usr.objects.get(Log_id=datal)
        #datax=usr.objects.get(Log_id=request.session["id"])
        if request.POST:
                ids=request.session["id"]
                
                t1 = request.POST["t1"]
                t2 = request.POST["t2"]
                t3 = date.today()
                msg="Register sucessfully"
                fed.objects.create(Feedback_subject=t1,Feedback_message=t2,Feedback_date=t3,Feedback_reply="not yet Seen",user=datau)
        data1=fed.objects.filter(user=datau).all()
        return render(request, "ListFeedback.html",{"msg":msg,"data":data1}) 
def ViewTips(request):
    msg = ""
    d=request.session['id']
    datal=log.objects.get(logid=d) 
    datau=usr.objects.get(Log_id=datal)
    data1=pay.objects.all()
    return render(request,"ViewTips.html",{"msg":msg,"data":data1})
def ViewHelpline(request):
    msg = ""
    data1=cate.objects.all()
    return render(request,"ViewHelpline.html",{"msg":msg,"data":data1}) 
def ViewTraining(request):
    msg = ""
    data1=fed.objects.all()
    return render(request,"ViewTraining.html",{"msg":msg,"data":data1}) 
def View_program(request):
    msg = ""
    data1=cate.objects.all()
    return render(request,"View_program.html",{"msg":msg,"data":data1}) 
def ViewNews(request):
    msg = ""
    data1=ne.objects.all()
    return render(request,"ViewNews.html",{"msg":msg,"data":data1})
def ViewAct(request):
    msg = ""
    data1=ser.objects.all()
    return render(request,"ViewAct.html",{"msg":msg,"data":data1}) 
def Alloted_works(request):
    msg = ""
    d=request.session['id']
    datal=log.objects.get(logid=d) 
    datau=stf.objects.get(staff_logid=d)
    data1=comp.objects.filter(staff=datau).all()
    return render(request,"Alloted_works.html",{"msg":msg,"data":data1})
def Update_status(request):
        msg=""
        #datax=usr.objects.get(Log_id=request.session["id"])
        if request.POST:
                t1 = request.POST["t1"]
                t2 = request.POST["s1"]
                
                msg="updated sucessfully"
                comp.objects.filter(Complaint_id=t1).update(Complaint_reply=t2)
        d=request.session['id']
        datal=log.objects.get(logid=d) 
        datau=stf.objects.get(staff_logid=d)
        data1=comp.objects.filter(staff=datau).all()
        return render(request, "Alloted_works.html",{"msg":msg,"data":data1})
def Udelete_complaint(request):
    comp.objects.filter(Complaint_id=request.GET["id"]).delete()
    response = redirect('/ListUserComplaint')
    return response
def Udelete_feedback(request):
    fed.objects.filter(Feedback_id=request.GET["id"]).delete()
    response = redirect('/ListUserFeedback')
    return response	
def Send_mail_user(request):
        msg=""
        d=request.session['id'] 
        datal=log.objects.get(logid=d) 
        datau=usr.objects.get(Log_id=datal)
        #datax=usr.objects.get(Log_id=request.session["id"])
        if request.POST:
                ids=request.session["id"]
                
                t1 = request.POST["t1"]
                cc=comp.objects.get(Complaint_id=t1)
                t2 = request.POST["s1"]
                t3 = date.today()
                msg="Send sucessfully"
                ma.objects.create( mail_message=t2 , mail_date=t3 ,complaint=cc,user=datau)
        data1=comp.objects.filter(user=datau).all()
        return render(request, "ListUserComplaint.html",{"msg":msg,"data":data1})

def view_mails(request):
    msg=""
    data1=ma.objects.filter(complaint=request.GET["id"]).all()
    return render(request,"view_mails.html",{"msg":msg,"data":data1})
def send_mail_staff(request):
        msg=""
        d=request.session['id'] 
        datal=log.objects.get(logid=d) 
        datau=stf.objects.get(staff_logid=d)
        #datax=usr.objects.get(Log_id=request.session["id"])
        if request.POST:
                ids=request.session["id"]
                
                t1 = request.POST["t1"]
                cc=comp.objects.get(Complaint_id=t1)
                t2 = request.POST["s1"]
                t3 = date.today()
                msg="Send sucessfully"
                ma.objects.create(mail_message=t2,mail_date=t3,complaint=cc,staff=datau)
        data1=comp.objects.filter(staff=datau).all()
        return render(request, "Alloted_works.html",{"msg":msg,"data":data1})
def view_mails_staff(request):
    msg=""
    data1=ma.objects.filter(complaint=request.GET["id"]).all()
    return render(request, "view_mails_staff.html",{"msg":msg,"data":data1})
def view_mails_admin(request):
    msg=""
    data1=ma.objects.filter(complaint=request.GET["id"]).all()
    return render(request, "view_mails_admin.html",{"msg":msg,"data":data1})


