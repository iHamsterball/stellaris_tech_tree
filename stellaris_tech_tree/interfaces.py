import codecs
import json
import re
import yaml
from django.http import JsonResponse
from .parse import generate_localized_tech

# Debug
from pprint import pprint

def techs(request):
    # Fetch techs from specified version
    version = request.GET.get('version')

    # Load locale settings
    locale = request.GET.get('locale')

    print(locale, version)

    jsonified = generate_localized_tech(locale, version)

    data = json.loads(jsonified)

    #print(type(data))

    return JsonResponse(data, safe=False)
