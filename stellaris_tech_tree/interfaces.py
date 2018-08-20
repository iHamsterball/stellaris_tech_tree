import codecs
import json
import os
import re
import yaml
from django.http import JsonResponse, HttpResponseBadRequest
from django.views.decorators.gzip import gzip_page
from .parse import generate_localized_tech

@gzip_page
def techs(request):
    # Fetch techs from specified version
    version = request.GET.get('version')

    # Load locale settings
    locale = request.GET.get('locale')

    print(locale, version)
    
    folder_path = os.path.join('data', version, 'cache')
    if not os.path.exists(folder_path):
        try:
            os.mkdir(folder_path)
        except FileNotFoundError:
            return HttpResponseBadRequest(content='Unexpected version: {}'.format(version))
    
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
            try:
                with open(os.path.join(folder_path, 'techs.json')) as data_file:
                    data = json.load(data_file)
            except FileNotFoundError:
                jsonified = generate_localized_tech("en_us", version)
                with open(os.path.join(folder_path, 'techs.json'), 'w') as write_file:
                    write_file.write(jsonified)
                data = json.loads(jsonified)

    #print(type(data))

    return JsonResponse(data, safe=False)
