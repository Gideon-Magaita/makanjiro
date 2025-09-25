from django.contrib import admin
from .models import *

admin.site.register([
    Slider,
    Story,
    Choosing,
    Reasons_for_choosing,
    Service,
    Special,
    Special_point,
    Flexibility,
    Faq,
    Quote,
    Mission_vision,
    Mission,
    Vision,
    Affiliation,
    Affiliation_org,
    Team,
    Value,
    Project,
    Contact,
    Visitor
])
