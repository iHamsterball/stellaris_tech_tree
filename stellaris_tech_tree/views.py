from django.core import serializers
from django.http import HttpResponse
from django.template import loader
from django.utils import translation
from django import http
from django.conf import settings

def index(request):
    template = loader.get_template('index.html')
    return HttpResponse(template.render({}, request))

def about(request):
    template = loader.get_template('about.html')
    return HttpResponse(template.render({}, request))
