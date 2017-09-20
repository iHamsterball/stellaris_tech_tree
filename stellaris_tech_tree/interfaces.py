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
    
    folder_path = os.path.join('data', version, 'cache')
    if not os.path.exists(folder_path):
        os.mkdir(folder_path)
    
    file_path = os.path.join(folder_path, locale + '.json')
    if os.path.exists(file_path):
        print('Cached')
        with open(file_path) as data_file:
            data = json.load(data_file)
    else:
        try:
            print('Generating')
            jsonified = generate_localized_tech(locale, version)
            with open(file_path, 'w') as write_file:
                write_file.write(jsonified)
            data = json.loads(jsonified)
        except FileNotFoundError:
            with open(os.path.join(folder_path, 'techs.json')) as data_file:
                data = json.load(data_file)

    #print(type(data))

    return JsonResponse(data, safe=False)
