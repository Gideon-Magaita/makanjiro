from django.shortcuts import render,redirect
from .models import *
from django.contrib import messages
from .forms import *
#counting visitors imports
from django.utils.timezone import now
from datetime import timedelta
#authentication
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .decorators import unauthenticated_user,allowed_users,admin_only
#change password
from django.contrib.auth.views import PasswordChangeView
from .forms import PasswordChangeCustomForm
from django.urls import reverse_lazy


#change password class
class CustomPasswordChangeView(PasswordChangeView):
    form_class = PasswordChangeCustomForm
    template_name = 'pages/admins/change-password.html'
    success_url = reverse_lazy('password_change_done')


#authentication functions
@unauthenticated_user
def login_user(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username,password=password)
        if user is not None:
            login(request, user)
            return redirect('admin_home')
        else:
            messages.info(request,'username or password is incorrect')

    return render(request,'pages/auth/login.html')


def logoutUser(request):
    logout(request)
    return redirect('login_user')



@login_required(login_url='login_user')
@admin_only
def admin_home(request):
    projects = Project.objects.all().count()
    message = Contact.objects.all().count()
    q = Quote.objects.all().count()
    faq = Faq.objects.all().count()
    """View for the admin dashboard showing visitor statistics."""
    today = now().date()
    week_start = today - timedelta(days=today.weekday())  # Start of the current week
    month_start = today.replace(day=1)  # Start of the current month

    # Count visitors
    total_visitors = Visitor.objects.count()
    daily_visitors = Visitor.objects.filter(visit_time__date=today).count()
    weekly_visitors = Visitor.objects.filter(visit_time__date__gte=week_start).count()
    monthly_visitors = Visitor.objects.filter(visit_time__date__gte=month_start).count()
    context = {
        'projects':projects,
        'message':message,
        'faq':faq,
        'q':q,
        'total_visitors': total_visitors,
        'daily_visitors': daily_visitors,
        'weekly_visitors': weekly_visitors,
        'monthly_visitors': monthly_visitors,
    }
    return render(request,'pages/admins/home.html',context)



@login_required(login_url='login_user')
@admin_only
def sliders(request):
    slider = Slider.objects.all()

    if request.method == 'POST':
        form = SliderForm(request.POST or None, request.FILES or None)
        try:
            if form.is_valid():
                form.save()
                messages.success(request, 'Data added successfully!')
            else:
                messages.error(request, 'Please correct the errors below.')
        except Exception as e:
            messages.error(request, f'Something went wrong: {str(e)}')

        return redirect('sliders')  # Always redirect after POST
    else:
        form = SliderForm()

    context = {
        'form': form,
        'slider': slider,
    }
    return render(request, 'pages/admins/home/sliders.html', context)




@login_required(login_url='login_user')
@admin_only
def edit_slider(request, id):
    try:
        slider = Slider.objects.get(id=id)
    except Slider.DoesNotExist:
        messages.error(request, 'Slider not found!')
        return redirect('sliders')

    if request.method == 'POST':
        form = SliderForm(request.POST or None, request.FILES or None, instance=slider)
        if form.is_valid():
            form.save()
            messages.success(request, 'Data updated successfully!')
            return redirect('sliders')
        else:
            messages.error(request, 'Please correct the errors below.')
    else:
        form = SliderForm(instance=slider)

    context = {
        'form': form,
        'slider': slider,
    }
    return render(request, 'pages/admins/home/edit-slider.html', context)



@login_required(login_url='login_user')
@admin_only
def delete_slider(request, id):
    try:
        # Attempt to fetch the slider object by ID
        slider = Slider.objects.get(id=id)
        slider.delete()
        messages.success(request, 'Data deleted!')
    except Slider.DoesNotExist:
        # Handle case where the slider with the given ID doesn't exist
        messages.error(request, 'Slider not found!')
    except Exception as e:
        # Handle any other exceptions that might occur
        messages.error(request, f'Something went wrong: {str(e)}')
    return redirect('sliders')


@login_required(login_url='login_user')
@admin_only
def story(request):
    story = Story.objects.all()
    if request.method == 'POST':
        form = StoryForm(request.POST or None,request.FILES or None)
        if form.is_valid():
            form.save()
            messages.success(request,'Data added successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('story')
    else:
        form = StoryForm()
        context={
            'form':form,
            'story':story,
        }
    return render(request,'pages/admins/home/story.html',context)



@login_required(login_url='login_user')
@admin_only
def edit_story(request,id):
    story = Story.objects.get(id=id)
    if request.method == 'POST':
        form = StoryForm(request.POST or None,request.FILES or None,instance=story)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('story')
    else:
        form = StoryForm(instance=story)
        context={
            'form':form,
        }
    return render(request,'pages/admins/home/edit-story.html',context)



@login_required(login_url='login_user')
@admin_only
def delete_story(request,id):
    story = Story.objects.get(id=id)
    if story:
        story.delete()
        messages.success(request,'Data deleted!')
    else:
        messages.error(request,'Something went wrong!')
    return redirect('story')


@login_required(login_url='login_user')
@admin_only
def choosing(request):
    choose = Choosing.objects.all()
    if request.method == 'POST':
        form = ChoosingForm(request.POST or None,request.FILES or None)
        if form.is_valid():
            form.save()
            messages.success(request,'Data added successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('choosing')
    else:
        form = ChoosingForm()
        context={
            'form':form,
            'choose':choose,
        }
    return render(request,'pages/admins/home/choosing.html',context)


@login_required(login_url='login_user')
@admin_only
def edit_choosing(request,id):
    choose = Choosing.objects.get(id=id)
    if request.method == 'POST':
        form = ChoosingForm(request.POST or None,request.FILES or None,instance=choose)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('choosing')
    else:
        form = ChoosingForm(instance=choose)
        context={
            'form':form,
        }
    return render(request,'pages/admins/home/edit-choosing.html',context)



@login_required(login_url='login_user')
@admin_only
def delete_choosing(request,id):
    choose = Choosing.objects.get(id=id)
    if choose:
        choose.delete()
        messages.success(request,'Data deleted!')
    else:
        messages.error(request,'Something went wrong!')
    return redirect('choosing')



@login_required(login_url='login_user')
@admin_only
def reason(request):
    choose = Reasons_for_choosing.objects.all()
    if request.method == 'POST':
        form = Reasons_for_choosingForm(request.POST or None)
        if form.is_valid():
            form.save()
            messages.success(request,'Data added successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('reason')
    else:
        form = Reasons_for_choosingForm()
        context={
            'form':form,
            'choose':choose,
        }
    return render(request,'pages/admins/home/reasons.html',context)



@login_required(login_url='login_user')
@admin_only
def edit_reason(request,id):
    choose = Reasons_for_choosing.objects.get(id=id)
    if request.method == 'POST':
        form = Reasons_for_choosingForm(request.POST or None,instance=choose)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('reason')
    else:
        form = Reasons_for_choosingForm(instance=choose)
        context={
            'form':form,
        }
    return render(request,'pages/admins/home/edit-reason.html',context)



@login_required(login_url='login_user')
@admin_only
def delete_reason(request,id):
    choose = Reasons_for_choosing.objects.get(id=id)
    if choose:
        choose.delete()
        messages.success(request,'Data deleted!')
    else:
        messages.error(request,'Something went wrong!')
    return redirect('reason')



@login_required(login_url='login_user')
@admin_only
def special(request):
    specials = Special.objects.all()
    if request.method == 'POST':
        form = SpecialForm(request.POST or None)
        if form.is_valid():
            form.save()
            messages.success(request,'Data added successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('special')
    else:
        form = SpecialForm()
        context={
            'form':form,
            'specials':specials,
        }
    return render(request,'pages/admins/home/special.html',context)




@login_required(login_url='login_user')
@admin_only
def edit_special(request,id):
    special = Special.objects.get(id=id)
    if request.method == 'POST':
        form = SpecialForm(request.POST or None,instance=special)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('special')
    else:
        form = SpecialForm(instance=special)
        context={
            'form':form,
        }
    return render(request,'pages/admins/home/edit-special.html',context)



@login_required(login_url='login_user')
@admin_only
def delete_special(request,id):
    special = Special.objects.get(id=id)
    if special:
        special.delete()
        messages.success(request,'Data deleted!')
    else:
        messages.error(request,'Something went wrong!')
    return redirect('special')



@login_required(login_url='login_user')
@admin_only
def special_points(request):
    specials = Special_point.objects.all()
    if request.method == 'POST':
        form = Special_pointForm(request.POST or None)
        if form.is_valid():
            form.save()
            messages.success(request,'Data added successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('special_points')
    else:
        form = Special_pointForm()
        context={
            'form':form,
            'specials':specials,
        }
    return render(request,'pages/admins/home/special2.html',context)



@login_required(login_url='login_user')
@admin_only
def edit_special_points(request,id):
    special = Special_point.objects.get(id=id)
    if request.method == 'POST':
        form = Special_pointForm(request.POST or None,instance=special)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('special_points')
    else:
        form = Special_pointForm(instance=special)
        context={
            'form':form,
        }
    return render(request,'pages/admins/home/edit-special2.html',context)



@login_required(login_url='login_user')
@admin_only
def delete_special_points(request,id):
    special = Special_point.objects.get(id=id)
    if special:
        special.delete()
        messages.success(request,'Data deleted!')
    else:
        messages.error(request,'Something went wrong!')
    return redirect('special_points')


@login_required(login_url='login_user')
@admin_only
def flexibility(request):
    flex = Flexibility.objects.all()
    if request.method == 'POST':
        form = FlexibilityForm(request.POST or None,request.FILES or None)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('flexibility')
    else:
        form = FlexibilityForm()
        context={
            'form':form,
            'flex':flex
        }
    return render(request,'pages/admins/home/flexibility.html',context)



@login_required(login_url='login_user')
@admin_only
def edit_flexibility(request,id):
    flex = Flexibility.objects.get(id=id)
    if request.method == 'POST':
        form = FlexibilityForm(request.POST or None,request.FILES or None,instance=flex)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('flexibility')
    else:
        form = FlexibilityForm(instance=flex)
        context={
            'form':form,
        }
    return render(request,'pages/admins/home/edit-flexibility.html',context)



@login_required(login_url='login_user')
@admin_only
def delete_flexibility(request,id):
    special = Flexibility.objects.get(id=id)
    if special:
        special.delete()
        messages.success(request,'Data deleted!')
    else:
        messages.error(request,'Something went wrong!')
    return redirect('flexibility')


#About page functions
@login_required(login_url='login_user')
@admin_only
def success(request):
    succ = Success_story.objects.all()
    if request.method == 'POST':
        form = Success_storyForm(request.POST or None,request.FILES or None)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('success')
    else:
        form = Success_storyForm()
        context={
            'form':form,
            'succ':succ
        }
    return render(request,'pages/admins/about/success.html',context)



@login_required(login_url='login_user')
@admin_only
def edit_success(request,id):
    success = Success_story.objects.get(id=id)
    if request.method == 'POST':
        form = Success_storyForm(request.POST or None,request.FILES or None,instance=success)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('success')
    else:
        form = Success_storyForm(instance=success)
        context={
            'form':form,
        }
    return render(request,'pages/admins/about/edit-success.html',context)



@login_required(login_url='login_user')
@admin_only
def delete_success(request,id):
    success = Success_story.objects.get(id=id)
    if success:
        success.delete()
        messages.success(request,'Data deleted!')
    else:
        messages.error(request,'Something went wrong!')
    return redirect('success')



@login_required(login_url='login_user')
@admin_only
def mission_vision(request):
    mv = Mission_vision.objects.all()
    if request.method == 'POST':
        form = Mission_visionForm(request.POST or None,request.FILES or None)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('mission_vision')
    else:
        form = Mission_visionForm()
        context={
            'form':form,
            'mv':mv
        }
    return render(request,'pages/admins/about/mission-vision.html',context)



@login_required(login_url='login_user')
@admin_only
def edit_mission_vision(request,id):
    success = Mission_vision.objects.get(id=id)
    if request.method == 'POST':
        form = Mission_visionForm(request.POST or None,request.FILES or None,instance=success)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('mission_vision')
    else:
        form = Mission_visionForm(instance=success)
        context={
            'form':form,
        }
    return render(request,'pages/admins/about/edit-mission-vision.html',context)



@login_required(login_url='login_user')
@admin_only
def delete_mission_vision(request,id):
    success = Mission_vision.objects.get(id=id)
    if success:
        success.delete()
        messages.success(request,'Data deleted!')
    else:
        messages.error(request,'Something went wrong!')
    return redirect('mission_vision')


@login_required(login_url='login_user')
@admin_only
def mission(request):
    ms = Mission.objects.all()
    if request.method == 'POST':
        form = MissionForm(request.POST or None,request.FILES or None)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('mission')
    else:
        form = MissionForm()
        context={
            'form':form,
            'ms':ms
        }
    return render(request,'pages/admins/about/mission.html',context)


@login_required(login_url='login_user')
@admin_only
def edit_mission(request,id):
    mission = Mission.objects.get(id=id)
    if request.method == 'POST':
        form = MissionForm(request.POST or None,request.FILES or None,instance=mission)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('mission')
    else:
        form = MissionForm(instance=mission)
        context={
            'form':form,
        }
    return render(request,'pages/admins/about/edit-mission.html',context)


@login_required(login_url='login_user')
@admin_only
def delete_mission(request,id):
    success = Mission.objects.get(id=id)
    if success:
        success.delete()
        messages.success(request,'Data deleted!')
    else:
        messages.error(request,'Something went wrong!')
    return redirect('mission')



@login_required(login_url='login_user')
@admin_only
def vision(request):
    vs = Vision.objects.all()
    if request.method == 'POST':
        form = VisionForm(request.POST or None,request.FILES or None)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('vision')
    else:
        form = VisionForm()
        context={
            'form':form,
            'vs':vs
        }
    return render(request,'pages/admins/about/vision.html',context)


@login_required(login_url='login_user')
@admin_only
def edit_vision(request,id):
    vision = Vision.objects.get(id=id)
    if request.method == 'POST':
        form = VisionForm(request.POST or None,request.FILES or None,instance=vision)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('vision')
    else:
        form = VisionForm(instance=vision)
        context={
            'form':form,
        }
    return render(request,'pages/admins/about/edit-vision.html',context)


@login_required(login_url='login_user')
@admin_only
def delete_vision(request,id):
    success = Vision.objects.get(id=id)
    if success:
        success.delete()
        messages.success(request,'Data deleted!')
    else:
        messages.error(request,'Something went wrong!')
    return redirect('vision')



@login_required(login_url='login_user')
@admin_only
def affiliation(request):
    affil = Affiliation.objects.all()
    if request.method == 'POST':
        form = AffiliationForm(request.POST or None,request.FILES or None)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('affiliation')
    else:
        form = AffiliationForm()
        context={
            'form':form,
            'affil':affil
        }
    return render(request,'pages/admins/about/affiliation.html',context)



@login_required(login_url='login_user')
@admin_only
def edit_affiliation(request,id):
    affil = Affiliation.objects.get(id=id)
    if request.method == 'POST':
        form = AffiliationForm(request.POST or None,request.FILES or None,instance=affil)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('affiliation')
    else:
        form = AffiliationForm(instance=affil)
        context={
            'form':form,
        }
    return render(request,'pages/admins/about/edit-affiliation.html',context)




@login_required(login_url='login_user')
@admin_only
def delete_affiliation(request,id):
    affil = Affiliation.objects.get(id=id)
    if affil:
        affil.delete()
        messages.success(request,'Data deleted!')
    else:
        messages.error(request,'Something went wrong!')
    return redirect('affiliation')



@login_required(login_url='login_user')
@admin_only
def affiliation_org(request):
    affil = Affiliation_org.objects.all()
    if request.method == 'POST':
        form = Affiliation_orgForm(request.POST or None,request.FILES or None)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('affiliation_org')
    else:
        form = Affiliation_orgForm()
        context={
            'form':form,
            'affil':affil
        }
    return render(request,'pages/admins/about/affiliation-org.html',context)



@login_required(login_url='login_user')
@admin_only
def edit_affiliation_org(request,id):
    affil = Affiliation_org.objects.get(id=id)
    if request.method == 'POST':
        form = Affiliation_orgForm(request.POST or None,request.FILES or None,instance=affil)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('affiliation_org')
    else:
        form = Affiliation_orgForm(instance=affil)
        context={
            'form':form,
        }
    return render(request,'pages/admins/about/edit-affiliation-org.html',context)



@login_required(login_url='login_user')
@admin_only
def delete_affiliation_org(request,id):
    affil = Affiliation_org.objects.get(id=id)
    if affil:
        affil.delete()
        messages.success(request,'Data deleted!')
    else:
        messages.error(request,'Something went wrong!')
    return redirect('affiliation_org')



@login_required(login_url='login_user')
@admin_only
def values(request):
    value = Value.objects.all()
    if request.method == 'POST':
        form = ValueForm(request.POST or None,request.FILES or None)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('values')
    else:
        form = ValueForm()
        context={
            'form':form,
            'value':value
        }
    return render(request,'pages/admins/about/values.html',context)



@login_required(login_url='login_user')
@admin_only
def edit_values(request,id):
    value = Value.objects.get(id=id)
    if request.method == 'POST':
        form = ValueForm(request.POST or None,request.FILES or None,instance=value)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('values')
    else:
        form = ValueForm(instance=value)
        context={
            'form':form,
        }
    return render(request,'pages/admins/about/edit-values.html',context)




@login_required(login_url='login_user')
@admin_only
def delete_values(request,id):
    value = Value.objects.get(id=id)
    if value:
        value.delete()
        messages.success(request,'Data deleted!')
    else:
        messages.error(request,'Something went wrong!')
    return redirect('values')




@login_required(login_url='login_user')
@admin_only
def team(request):
    teams = Team.objects.all()
    if request.method == 'POST':
        form = TeamForm(request.POST or None,request.FILES or None)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('team')
    else:
        form = TeamForm()
        context={
            'form':form,
            'teams':teams
        }
    return render(request,'pages/admins/about/team.html',context)




@login_required(login_url='login_user')
@admin_only
def edit_team(request,id):
    teams = Team.objects.get(id=id)
    if request.method == 'POST':
        form = TeamForm(request.POST or None,request.FILES or None,instance=teams)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('team')
    else:
        form = TeamForm(instance=teams)
        context={
            'form':form,
        }
    return render(request,'pages/admins/about/edit-team.html',context)



@login_required(login_url='login_user')
@admin_only
def delete_team(request,id):
    teams = Team.objects.get(id=id)
    if teams:
        teams.delete()
        messages.success(request,'Data deleted!')
    else:
        messages.error(request,'Something went wrong!')
    return redirect('team')



@login_required(login_url='login_user')
@admin_only
def service_page(request):
    serv = Service.objects.all()
    if request.method == 'POST':
        form = ServiceForm(request.POST or None,request.FILES or None)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('service_page')
    else:
        form = ServiceForm()
        context={
            'form':form,
            'serv':serv
        }
    return render(request,'pages/admins/service/service.html',context)




@login_required(login_url='login_user')
@admin_only
def edit_service(request,id):
    service = Service.objects.get(id=id)
    if request.method == 'POST':
        form = ServiceForm(request.POST or None,request.FILES or None,instance=service)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('service_page')
    else:
        form = ServiceForm(instance=service)
        context={
            'form':form,
        }
    return render(request,'pages/admins/service/edit-service.html',context)




@login_required(login_url='login_user')
@admin_only
def delete_service(request,id):
    serv = Team.objects.get(id=id)
    if serv:
        serv.delete()
        messages.success(request,'Data deleted!')
    else:
        messages.error(request,'Something went wrong!')
    return redirect('service_page')




@login_required(login_url='login_user')
@admin_only
def project_page(request):
    pro = Project.objects.all()
    if request.method == 'POST':
        form = ProjectForm(request.POST or None,request.FILES or None)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('project_page')
    else:
        form = ProjectForm()
        context={
            'form':form,
            'pro':pro
        }
    return render(request,'pages/admins/project/project.html',context)




@login_required(login_url='login_user')
@admin_only
def edit_project(request,id):
    project = Project.objects.get(id=id)
    if request.method == 'POST':
        form = ProjectForm(request.POST or None,request.FILES or None,instance=project)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('project_page')
    else:
        form = ProjectForm(instance=project)
        context={
            'form':form,
        }
    return render(request,'pages/admins/project/edit-project.html',context)




@login_required(login_url='login_user')
@admin_only
def delete_project(request,id):
    pro = Project.objects.get(id=id)
    if pro:
        pro.delete()
        messages.success(request,'Data deleted!')
    else:
        messages.error(request,'Something went wrong!')
    return redirect('project_page')




@login_required(login_url='login_user')
@admin_only
def faqs_page(request):
    faqs = Faq.objects.all()
    if request.method == 'POST':
        form = FaqForm(request.POST or None,request.FILES or None)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('faqs_page')
    else:
        form = FaqForm()
        context={
            'form':form,
            'faqs':faqs
        }
    return render(request,'pages/admins/home/faqs.html',context)




@login_required(login_url='login_user')
@admin_only
def edit_faqs(request,id):
    faqs = Faq.objects.get(id=id)
    if request.method == 'POST':
        form = FaqForm(request.POST or None,request.FILES or None,instance=faqs)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('faqs_page')
    else:
        form = FaqForm(instance=faqs)
        context={
            'form':form,
        }
    return render(request,'pages/admins/home/edit-faqs.html',context)



@login_required(login_url='login_user')
@admin_only
def delete_faqs(request,id):
    freq = Faq.objects.get(id=id)
    if freq:
        freq.delete()
        messages.success(request,'Data deleted!')
    else:
        messages.error(request,'Something went wrong!')
    return redirect('faqs_page')




@login_required(login_url='login_user')
@admin_only
def contact_page(request):
    contact =Contact.objects.all()
    context={
        'contact':contact
    }
    return render(request,'pages/admins/home/contact.html',context)



@login_required(login_url='login_user')
@admin_only
def delete_contact_page(request,id):
    contact = Contact.objects.get(id=id)
    if contact:
        contact.delete()
        messages.success(request,'Data deleted!')
    else:
        messages.error(request,'Something went wrong!')
    return redirect('contact_page')


@login_required(login_url='login_user')
@admin_only
def quote(request):
    contact = Quote.objects.all()
    context={
        'contact':contact
    }
    return render(request,'pages/admins/home/price-quote.html',context)



@login_required(login_url='login_user')
@admin_only
def delete_quote(request,id):
    contact = Quote.objects.get(id=id)
    if contact:
        contact.delete()
        messages.success(request,'Data deleted!')
    else:
        messages.error(request,'Something went wrong!')
    return redirect('quote')


@login_required(login_url='login_user')
@admin_only
def shipment(request):
    ship = Shipment.objects.all()
    if request.method == 'POST':
        form = ShipmentForm(request.POST or None,request.FILES or None)
        if form.is_valid():
            form.save()
            messages.success(request,'Data added successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('shipment')
    else:
        form = ShipmentForm()
        context={
            'form':form,
            'ship':ship
        }
    return render(request,'pages/admins/shipment.html',context)



def edit_shipment(request,id):
    ship = Shipment.objects.get(id=id)
    if request.method == 'POST':
        form = ShipmentForm(request.POST or None,request.FILES or None,instance=ship)
        if form.is_valid():
            form.save()
            messages.success(request,'Data updated successsfully!')
        else:
            messages.error(request,'Something went wrong!')
        return redirect('shipment')
    else:
        form = ShipmentForm(instance=ship)
        context={
            'form':form,
        }
    return render(request,'pages/admins/edit-shipment.html',context)




def delete_shipment(request,id):
    ship = Shipment.objects.get(id=id)
    if ship:
        ship.delete()
        messages.success(request,'Data deleted!')
    else:
        messages.error(request,'Something went wrong!')
    return redirect('shipment')