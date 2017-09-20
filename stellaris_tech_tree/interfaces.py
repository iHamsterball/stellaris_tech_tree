import codecs
import json
import os
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
    
    file_path = os.path.join('data', version, 'techs.json')
    if os.path.isfile(file_path):
        print('Cached')
        with open(file_path) as data_file:
            data = json.load(data_file)
    else:
        print('Generating')
        jsonified = generate_localized_tech(locale, version)
        with open(file_path, 'w') as write_file:
            write_file.write(jsonified)
        data = json.loads(jsonified)

    #print(type(data))

    return JsonResponse(data, safe=False)
