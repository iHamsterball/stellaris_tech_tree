import codecs
import json
import os
import re
import yaml
from django.http import JsonResponse, HttpResponseBadRequest
from django.views.decorators.gzip import gzip_page

from .parse import generate_localized_tech
from .versions import versions as version_dict

@gzip_page
def techs(request, fallback=False):
    # Fetch techs from specified version
    version = request.GET.get('version')

    # Load locale settings
    locale = 'en_us' if fallback else request.GET.get('locale')

    print(locale, version)

    folder_path = os.path.join('data', version, 'cache')
    if not os.path.exists(folder_path):
        try:
            os.mkdir(folder_path)
        except FileNotFoundError:
            return HttpResponseBadRequest(content='Unexpected version: {}'.format(version))

    file_path = os.path.join(folder_path, 'techs.json') if fallback else os.path.join(folder_path, locale + '.json')
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
            return techs(request, fallback=True)

    #print(type(data))
    return JsonResponse(data, safe=False)


def versions(request, fallback=False):
    version_dict['latest'] = next(iter(version_dict.values()))
    return JsonResponse(version_dict)