from django.urls import path
from .import views
from django.conf import settings
from django.conf.urls.static import static
urlpatterns = [
    path("",views.index,name="index"),
    path("index",views.index,name="index"),
    path("about",views.about,name="about"),
    path("contact",views.contact,name="contact"),
    path("login",views.Login,name="login"),
    path("Logout",views.Logout,name="Logout"),
    path("admin",views.admin,name="admin"),
    path("List_committee",views.List_committee,name="List_committee"),
    path("staff",views.staff,name="staff"),
    path("List_Staff",views.List_Staff,name="List_Staff"),
    path("user",views.user,name="user"),
    path("user_Reg",views.User_Reg,name="user_Reg"),
    path("Staff_Reg",views.Staff_Reg,name="Staff_Reg"),
    path("login_now",views.Login_now,name="login_now"),
    path("register_user",views.register_user,name="register_user"),
    path("register_provider",views.register_provider,name="register_provider"),
    path("Privacy",views.Privacy,name="Privacy"),
    path("All_Users",views.All_Users,name="All_Users"),
    path("Feedback",views.Feedback,name="Feedback"),
    path("Committee_Reg",views.Committee_Reg,name="Committee_Reg"),
    path("register_committee",views.register_committee,name="register_committee"),
    path("News_Reg",views.News_Reg,name="News_Reg"),
    path("program_Reg",views.program_Reg,name="program_Reg"),
    path("program_Register",views.program_Register,name="program_Register"),
    path("delete_program",views.delete_program,name="delete_program"),
    path("List_program",views.List_program,name="List_program"),
    path("News_Register",views.News_Register,name="News_Register"),
    path("delete_news",views.delete_news,name="delete_news"),
    path("List_news",views.List_news,name="List_news"),
    path("remove_usr",views.remove_usr,name="remove_usr"),
    path("delete_staff",views.delete_staff,name="delete_staff"),
    path("delete_category",views.delete_category,name="delete_category"),
    path("Profile",views.Profile,name="Profile"),
    path("complaints",views.complaints,name="complaints"),
    path("manage_complaint",views.manage_complaint,name="manage_complaint"),
    path("delete_complaint",views.delete_complaint,name="delete_complaint"),
    path("Allot_complaints",views.Allot_complaints,name="Allot_complaints"),
    path("View_feedback",views.View_feedback,name="View_feedback"),
    path("delete_feedback",views.delete_feedback,name="delete_feedback"),
    path("reg_user_complaint",views.reg_user_complaint,name="reg_user_complaint"),
    path("Complaint_reg",views.Complaint_reg,name="Complaint_reg"),
    path("ListUserComplaint",views.ListUserComplaint,name="ListUserComplaint"),
    path("Reg_feedback",views.Reg_feedback,name="Reg_feedback"),
   
   

	path("View_program",views.View_program,name="View_program"),
	

	path("Alloted_works",views.Alloted_works,name="Alloted_works"),
	path("Update_status",views.Update_status,name="Update_status"),
	path("Udelete_complaint",views.Udelete_complaint,name="Udelete_complaint"),
    path("Udelete_feedback",views.Udelete_feedback,name="Udelete_feedback"),  
    path("Send_mail_user",views.Send_mail_user,name="Send_mail_user"),
	path("view_mails",views.view_mails,name="view_mails"),
	path("send_mail_staff",views.send_mail_staff,name="send_mail_staff"),
	path("view_mails_staff",views.view_mails_staff,name="view_mails_staff"),
	path("view_mails_admin",views.view_mails_admin,name="view_mails_admin"),



path("traing_Reg",views.traing_Reg,name="traing_Reg"),
path("tra_Register",views.tra_Register,name="tra_Register"),
path("delete_tra",views.delete_tra,name="delete_tra"),
path("list_traing",views.list_traing,name="list_traing"),
path("help_Register",views.help_Register,name="help_Register"),
path("delete_help",views.delete_help,name="delete_help"),
path("add_help",views.add_help,name="add_help"),
path("list_help",views.list_help,name="list_help"),
path("add_gallery",views.add_gallery,name="add_gallery"),
path("list_gallery",views.list_gallery,name="list_gallery"),
path("gallery_Register",views.gallery_Register,name="gallery_Register"),
path("delete_gallery",views.delete_gallery,name="delete_gallery"),





path("ViewTips",views.ViewTips,name="ViewTips"),
path("ViewNews",views.ViewNews,name="ViewNews"),
path("ViewAct",views.ViewAct,name="ViewAct"),
path("ViewTraining",views.ViewTraining,name="ViewTraining"),
path("ViewHelpline",views.ViewHelpline,name="ViewHelpline"),




]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
