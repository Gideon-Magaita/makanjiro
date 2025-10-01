from django.shortcuts import render,redirect
from .models import *
from django.contrib import messages
from .forms import *
from django.core.paginator import Paginator
#Counting visitors
from django.utils.timezone import now




def get_client_ip(request):
    """Retrieve client IP address."""
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip


def home(request):
    #news pagination
    news_list = Service.objects.all().order_by('-date')  # Order by latest news first
    paginator = Paginator(news_list, 3)  # Show 3 news items per page

    page_number = request.GET.get('page')
    news_page = paginator.get_page(page_number)
    #endnews pagination
    sliders = Slider.objects.all()
    story = Story.objects.all()
    choose = Choosing.objects.all()
    reason = Reasons_for_choosing.objects.all()
    special = Special.objects.all()
    points = Special_point.objects.all()
    flex = Flexibility.objects.all()
    questions = Faq.objects.all()

    if request.method == 'POST':
        form = QuoteForm(request.POST or None)
        if form.is_valid():
            form.save()
            messages.success(request,'Message sent successfully')
        else:
            messages.error(request,'Something went wrong')
        return redirect('home')
    else:
        form = QuoteForm()

    # Track visitor per day
    ip = get_client_ip(request)
    today = now().date()

    if not Visitor.objects.filter(ip_address=ip, visit_time__date=today).exists():
       Visitor.objects.create(ip_address=ip)

        
    context = {
        'sliders':sliders,
        'story':story,
        'choose':choose,
        'reason':reason,
        'special':special,
        'points':points,
        'flex':flex,
        'questions':questions,
        'service':news_page,
    }
    return render(request,'pages/users/home.html',context)


def about(request):
    misvis = Mission_vision.objects.all()
    success = Success_story.objects.all()
    mission = Mission.objects.all()
    vision = Vision.objects.all()
    afill = Affiliation.objects.all()
    org = Affiliation_org.objects.all()
    cores = Value.objects.all()
    team = Team.objects.all()
    context={
        'success':success,
        'misvis':misvis,
        'mission':mission,
        'vision':vision,
        'afill':afill,
        'org':org,
        'cores':cores,
        'team':team,
    }
    
    bg_classes = ["bg-success", "bg-primary", "bg-warning"]
    for i, item in enumerate(org):
        item.bg_class = bg_classes[i % len(bg_classes)]

    return render(request,'pages/users/about.html',context)



def service(request):
    #Service pagination
    news_list = Service.objects.all().order_by('-date')  # Order by latest news first
    paginator = Paginator(news_list, 3)  # Show 3 news items per page

    page_number = request.GET.get('page')
    news_page = paginator.get_page(page_number)
    #endservice pagination
    context = {
        'service':news_page,
    }
    return render(request,'pages/users/service.html',context)


def detail_service(request,id):
    ser = Service.objects.get(id=id)
    context={
        'ser':ser,
    }
    return render(request,'pages/users/service-details.html',context)


def projects(request):
    project = Project.objects.all()
    context = {
        'project':project,
    }
    return render(request,'pages/users/projects.html',context)



def shipment_view(request):
    # Assuming you only have one general heading/subheading entry
    heading_section = Shipment.objects.first()
    services = Shipment.objects.all()
    return render(request, 'pages/users/shipment.html', {
        'heading_section': heading_section,
        'services': services
    })




def contact(request):
    if request.method == 'POST':
        form = ContactForm(request.POST or None)
        if form.is_valid():
            form.save()
            messages.success(request,'Message sent successfully')
        else:
            messages.error(request,'Something went wrong')
        return redirect('contact')
    else:
        form = ContactForm()
    context = {
    }
    return render(request,'pages/users/contact.html',context)





#Custome error page
def custom_404_view(request, exception):
    return render(request, '404.html', status=404)


