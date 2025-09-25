from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from .import views
from .import admins
#auth
from .admins import CustomPasswordChangeView
from django.contrib.auth import views as auth_views
from django.contrib.auth.decorators import login_required


urlpatterns = [
    path('',views.home,name='home'),
    path('about/',views.about,name='about'),
    path('services/',views.service,name='service'),
    path('projects/',views.projects,name='project'),
    path('shipment/',views.shipment,name='shipment'),
    path('contact/',views.contact,name='contact'),
    path('detail_service/<int:id>',views.detail_service,name='detail_service'),

    #admin urls
    path('admin_home',admins.admin_home,name='admin_home'),
    #authenticationurls
    path('login_user', admins.login_user,name='login_user'),
    path('logoutUser', admins.logoutUser,name='logoutUser'),
    #change password
    path('change-password/',CustomPasswordChangeView.as_view(), name='change_password'),
    path('change-password/',
         login_required(auth_views.PasswordChangeView.as_view(
             template_name='pages/admins/change-password.html'
         )),
         name='change_password'),

    path('password-change-done/',
         auth_views.PasswordChangeDoneView.as_view(template_name='pages/admins/password_change_done.html'),
         name='password_change_done'),
         
    #admin home page urls
    path('sliders',admins.sliders,name='sliders'),
    path('edit_slider/<int:id>',admins.edit_slider,name='edit_slider'),
    path('delete_slider/<int:id>',admins.delete_slider,name='delete_slider'),

    path('story',admins.story,name='story'),
    path('edit_story/<int:id>',admins.edit_story,name='edit_story'),
    path('delete_story/<int:id>',admins.delete_story,name='delete_story'),

    path('choosing',admins.choosing,name='choosing'),
    path('edit_choosing/<int:id>',admins.edit_choosing,name='edit_choosing'),
    path('delete_choosing/<int:id>',admins.delete_choosing,name='delete_choosing'),

    path('reason',admins.reason,name='reason'),
    path('edit_reason/<int:id>',admins.edit_reason,name='edit_reason'),
    path('delete_reason/<int:id>',admins.delete_reason,name='delete_reason'),

    path('special',admins.special,name='special'),
    path('edit_special/<int:id>',admins.edit_special,name='edit_special'),
    path('delete_special/<int:id>',admins.delete_special,name='delete_special'),

    path('special_points',admins.special_points,name='special_points'),
    path('edit_special_points/<int:id>',admins.edit_special_points,name='edit_special_points'),
    path('delete_special_points/<int:id>',admins.delete_special_points,name='delete_special_points'),

    path('flexibility',admins.flexibility,name='flexibility'),
    path('edit_flexibility/<int:id>',admins.edit_flexibility,name='edit_flexibility'),
    path('delete_flexibility/<int:id>',admins.delete_flexibility,name='delete_flexibility'),

    path('faqs_page',admins.faqs_page,name='faqs_page'),
    path('edit_faqs/<int:id>',admins.edit_faqs,name='edit_faqs'),
    path('delete_faqs/<int:id>',admins.delete_faqs,name='delete_faqs'),

    path('contact_page',admins.contact_page,name='contact_page'),
    path('delete_contact_page/<int:id>',admins.delete_contact_page,name='delete_contact_page'),

    path('quote',admins.quote,name='quote'),
    path('delete_quote/<int:id>',admins.delete_quote,name='delete_quote'),

    

    #admin about page urls
    path('success',admins.success,name='success'),
    path('edit_success/<int:id>',admins.edit_success,name='edit_success'),
    path('delete_success/<int:id>',admins.delete_success,name='delete_success'),

    path('mission_vision',admins.mission_vision,name='mission_vision'),
    path('edit_mission_vision/<int:id>',admins.edit_mission_vision,name='edit_mission_vision'),
    path('delete_mission_vision/<int:id>',admins.delete_mission_vision,name='delete_mission_vision'),

    path('mission',admins.mission,name='mission'),
    path('edit_mission/<int:id>',admins.edit_mission,name='edit_mission'),
    path('delete_mission/<int:id>',admins.delete_mission,name='delete_mission'),

    path('vision',admins.vision,name='vision'),
    path('edit_vision/<int:id>',admins.edit_vision,name='edit_vision'),
    path('delete_vision/<int:id>',admins.delete_vision,name='delete_vision'),
    
    path('affiliation',admins.affiliation,name='affiliation'),
    path('delete_affiliation/<int:id>',admins.delete_affiliation,name='delete_affiliation'),
    path('edit_affiliation/<int:id>',admins.edit_affiliation,name='edit_affiliation'),

    path('affiliation_org',admins.affiliation_org,name='affiliation_org'),
    path('edit_affiliation_org/<int:id>',admins.edit_affiliation_org,name='edit_affiliation_org'),
    path('delete_affiliation_org/<int:id>',admins.delete_affiliation_org,name='delete_affiliation_org'),

    path('values',admins.values,name='values'),
    path('edit_values/<int:id>',admins.edit_values,name='edit_values'),
    path('delete_values/<int:id>',admins.delete_values,name='delete_values'),

    path('team',admins.team,name='team'),
    path('edit_team/<int:id>',admins.edit_team,name='edit_team'),
    path('delete_team/<int:id>',admins.delete_team,name='delete_team'),

    path('service_page',admins.service_page,name='service_page'),
    path('edit_service/<int:id>',admins.edit_service,name='edit_service'),
    path('delete_service/<int:id>',admins.delete_service,name='delete_service'),

    path('project_page',admins.project_page,name='project_page'),
    path('edit_project/<int:id>',admins.edit_project,name='edit_project'),
    path('delete_project/<int:id>',admins.delete_project,name='delete_project'),


]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)


