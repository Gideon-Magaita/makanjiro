from django.db import models
from ckeditor.fields import RichTextField


class Slider(models.Model):
    title = models.CharField(max_length=200)
    description = RichTextField()
    image = models.ImageField(max_length=200,upload_to='images/')
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.title

class Story(models.Model):
    title = models.CharField(max_length=200)
    description = RichTextField()
    image = models.ImageField(max_length=200,upload_to='images/',default=None)
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.title

class Success_story(models.Model):
    title = models.CharField(max_length=200)
    description = RichTextField()
    image = models.ImageField(max_length=200,upload_to='images/',default=None)
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.title
    

class Choosing(models.Model):
    title = models.CharField(max_length=200)
    description = RichTextField()
    image = models.ImageField(max_length=200,upload_to='images/',default=None)
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.title


class Reasons_for_choosing(models.Model):
    title = models.CharField(max_length=200)
    icon_class = models.CharField(max_length=50, default='fa-star')#predefined icon
    description = RichTextField()
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.title


class Service(models.Model):
    title = models.CharField(max_length=200)
    description = RichTextField()
    image = models.ImageField(max_length=200,upload_to='images/')
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.title


class Special(models.Model):
    title = models.CharField(max_length=200)
    description = RichTextField()
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.title


class Special_point(models.Model):
    title = models.CharField(max_length=200)
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.title
    

class Flexibility(models.Model):
    title = models.CharField(max_length=200,default=None)
    description = RichTextField()
    icon_class = models.CharField(max_length=50, default='fa-star')#predefined icon
    image = models.ImageField(max_length=200,upload_to='images/',blank=True,default=None)
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.title


class Faq(models.Model):
    description = RichTextField()
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.description


class Quote(models.Model):
    name = models.CharField(max_length=200)
    email = models.EmailField(max_length=50)
    mobile = models.CharField(max_length=13)
    origin = models.CharField(max_length=200)
    destination = models.CharField(max_length=200)
    subject = models.CharField(max_length=200)
    cargo_details = RichTextField()
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.name


class Mission_vision(models.Model):
    title = models.CharField(max_length=200)
    description = RichTextField()
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.title


class Mission(models.Model):
    title = models.CharField(max_length=200)
    description = RichTextField()
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.title


class Vision(models.Model):
    title = models.CharField(max_length=200)
    description = RichTextField()
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.title


class Affiliation(models.Model):
    title = models.CharField(max_length=200)
    description = RichTextField()
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.title


class Affiliation_org(models.Model):
    title = models.CharField(max_length=200)
    description = RichTextField()
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.title


class Team(models.Model):
    title = models.CharField(max_length=200)
    description = RichTextField()
    image = models.ImageField(max_length=200,upload_to='images/')
    date = models.DateField(auto_now_add=True)


class Value(models.Model):
    title = models.CharField(max_length=200)
    description = RichTextField()
    icon_class = models.CharField(max_length=50, default='fa-star')#predefined icon
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.title


class Project(models.Model):
    title = models.CharField(max_length=200)
    icon_class = models.CharField(max_length=50, default='fa-star')#predefined icon
    description = RichTextField()
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.title


class Contact(models.Model):
    name = models.CharField(max_length=200)
    email = models.EmailField(max_length=50)
    website = models.CharField(max_length=200)
    subject = models.CharField(max_length=200)
    message = RichTextField()
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.name


#Models to count the number of visitors
class Visitor(models.Model):
    ip_address = models.GenericIPAddressField()
    visit_time = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.ip_address