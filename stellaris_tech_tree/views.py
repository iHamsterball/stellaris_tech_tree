from django.core import serializers
from django.http import HttpResponse
from django.template import loader
from django.utils import translation
from django import http
from django.conf import settings


def index(request):
    template = loader.get_template('index.html')
    version_list = {
        'niven' : 'Niven v2.1.2',
        'cherryh' : 'Cherryh v2.0.5',
        'boulle' : 'Boulle v1.9.1',
        'capek' : 'Čapek v1.8.3',
        'adams' : 'Adams v1.6.2',
        'banks' : 'Banks v1.5.1',
        'kennedy' : 'Kennedy v1.4.1',
        'heinlein' : 'Heinlein v1.3.2',
        'asimov' : 'Asimov v1.2.5',
        'clarke' : 'Clarke v1.1.0',
        'launch' : 'Launch v1.0.3',
        'alphamod' : 'Alpha Mod',
        'isb' : 'Improved Space Battles',
        'new_horizons' : 'ST: New Horizons',
        'nsc' : 'New Ship Classes',
    }
    return HttpResponse(template.render({'version_list' : version_list}, request))

def about(request):
    template = loader.get_template('about.html')
    return HttpResponse(template.render({}, request))
