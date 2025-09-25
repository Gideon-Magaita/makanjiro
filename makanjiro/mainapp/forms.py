from django import forms
from django.forms import ModelForm
from .models import *
from django.contrib.auth.forms import PasswordChangeForm




class PasswordChangeCustomForm(PasswordChangeForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for visible in self.visible_fields():
            visible.field.widget.attrs['class'] = 'form-control'


            

class SliderForm(forms.ModelForm):
    class Meta:
        model = Slider
        fields=['title','description','image']

        widgets={
            'image':forms.ClearableFileInput(attrs={'class': 'form-control'}),
            'title':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter title','required':'required'}),
            'description':forms.Textarea(attrs={'class':'form-control','placeholder':'Enter description','required':'required'}),
        }


class StoryForm(forms.ModelForm):
    class Meta:
        model = Story
        fields=['title','description','image']

        widgets={
            'image':forms.ClearableFileInput(attrs={'class': 'form-control'}),
            'title':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter title','required':'required'}),
            'description':forms.Textarea(attrs={'class':'form-control','placeholder':'Enter description','required':'required'}),
        }


class Success_storyForm(forms.ModelForm):
    class Meta:
        model = Success_story
        fields=['title','description','image']

        widgets={
            'image':forms.ClearableFileInput(attrs={'class': 'form-control'}),
            'title':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter title','required':'required'}),
            'description':forms.Textarea(attrs={'class':'form-control','placeholder':'Enter description','required':'required'}),
        }


class ChoosingForm(forms.ModelForm):
    class Meta:
        model = Choosing
        fields=['title','description','image']

        widgets={
            'image':forms.ClearableFileInput(attrs={'class': 'form-control'}),
            'title':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter title','required':'required'}),
            'description':forms.Textarea(attrs={'class':'form-control','placeholder':'Enter description','required':'required'}),
        }

class Reasons_for_choosingForm(forms.ModelForm):
    class Meta:
        model = Reasons_for_choosing
        fields=['title','icon_class','description']

        widgets={
            'title':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter title','required':'required'}),
            'icon_class':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter icon name','required':'required'}),
            'description':forms.Textarea(attrs={'class':'form-control','placeholder':'Enter description','required':'required'}),
        }

class ServiceForm(forms.ModelForm):
    class Meta:
        model = Service
        fields=['title','description','image']

        widgets={
            'title':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter title','required':'required'}),
            'description':forms.Textarea(attrs={'class':'form-control','placeholder':'Enter description','required':'required'}),
            'image':forms.ClearableFileInput(attrs={'class': 'form-control'})
        }


class SpecialForm(forms.ModelForm):
    class Meta:
        model = Special
        fields=['title','description']

        widgets={
            'title':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter title','required':'required'}),
            'description':forms.Textarea(attrs={'class':'form-control','placeholder':'Enter description','required':'required'}),
        }


class Special_pointForm(forms.ModelForm):
    class Meta:
        model = Special_point
        fields=['title']

        widgets={
            'title':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter title','required':'required'}),
        }


class FlexibilityForm(forms.ModelForm):
    class Meta:
        model = Flexibility
        fields=['title','icon_class','description','image']

        widgets={
            'image':forms.ClearableFileInput(attrs={'class': 'form-control'}),
            'title':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter title','required':'required'}),
            'icon_class':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter icon name','required':'required'}),
            'description':forms.Textarea(attrs={'class':'form-control','placeholder':'Enter description','required':'required'}),
        }


class FaqForm(forms.ModelForm):
    class Meta:
        model = Faq
        fields=['description']

        widgets={
            'description':forms.Textarea(attrs={'class':'form-control','placeholder':'Enter description','required':'required'}),
        }



class QuoteForm(ModelForm):
    class Meta:
        model = Quote
        fields='__all__'



class ContactForm(ModelForm):
    class Meta:
        model = Contact
        fields='__all__'


class Mission_visionForm(forms.ModelForm):
    class Meta:
        model = Mission_vision
        fields=['title','description']

        widgets={
            'title':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter title','required':'required'}),
            'description':forms.Textarea(attrs={'class':'form-control','placeholder':'Enter description','required':'required'}),
        }


class MissionForm(forms.ModelForm):
    class Meta:
        model = Mission
        fields=['title','description']

        widgets={
            'title':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter title','required':'required'}),
            'description':forms.Textarea(attrs={'class':'form-control','placeholder':'Enter description','required':'required'}),
        }



class VisionForm(forms.ModelForm):
    class Meta:
        model = Vision
        fields=['title','description']

        widgets={
            'title':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter title','required':'required'}),
            'description':forms.Textarea(attrs={'class':'form-control','placeholder':'Enter description','required':'required'}),
        }


class AffiliationForm(forms.ModelForm):
    class Meta:
        model = Affiliation
        fields=['title','description']

        widgets={
            'title':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter title','required':'required'}),
            'description':forms.Textarea(attrs={'class':'form-control','placeholder':'Enter description','required':'required'}),
        }


class Affiliation_orgForm(forms.ModelForm):
    class Meta:
        model = Affiliation_org
        fields=['title','description']

        widgets={
            'title':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter title','required':'required'}),
            'description':forms.Textarea(attrs={'class':'form-control','placeholder':'Enter description','required':'required'}),
        }



class TeamForm(forms.ModelForm):
    class Meta:
        model = Team
        fields=['title','description','image']

        widgets={
            'image':forms.ClearableFileInput(attrs={'class': 'form-control'}),
            'title':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter title','required':'required'}),
            'description':forms.Textarea(attrs={'class':'form-control','placeholder':'Enter description','required':'required'}),
        }



class ValueForm(forms.ModelForm):
    class Meta:
        model = Value
        fields=['title','icon_class','description']

        widgets={
            'title':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter title','required':'required'}),
            'icon_class':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter icon name','required':'required'}),
            'description':forms.Textarea(attrs={'class':'form-control','placeholder':'Enter description','required':'required'}),
        }


class ProjectForm(forms.ModelForm):
    class Meta:
        model = Project
        fields=['title','icon_class','description']

        widgets={
            'title':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter title','required':'required'}),
            'icon_class':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter icon name','required':'required'}),
            'description':forms.Textarea(attrs={'class':'form-control','placeholder':'Enter description','required':'required'}),
        }