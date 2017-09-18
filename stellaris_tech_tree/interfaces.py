import codecs
import json
import re
import yaml
from django.http import JsonResponse

# Debug
from pprint import pprint

def _localized_yaml(file_path):
    loc_data = { }

    not_yaml_lines = codecs.open(file_path, 'r', 'utf-8-sig').readlines()
    not_yaml = ''
    for line in not_yaml_lines:
        quote_instances = [i for i, char in enumerate(line)
                           if char == u'"']

        if len(quote_instances) >= 2:
            # Some lines have invalid data after terminal quote:
            last = quote_instances[-1]
            line = line[:last + 1] + '\n'

            if len(quote_instances) > 2:
                second = quote_instances[1]
                line = line[0:second] + line[second:last].replace(u'"', r'\"') + line[last:]

        not_yaml += line

    still_not_yaml = re.sub(r'£\w+  |§[A-Z!]', '', not_yaml)
    resembles_yaml = re.sub(r'(?<=\w):\d (?=")', ': ', still_not_yaml)
    actual_yaml = re.sub(r'^[ \t]+', '  ', resembles_yaml, flags=re.M)

    return actual_yaml

def _parse_category(category):
    return category.lower().replace(' ', '_')

def techs(request):
    # Fetch techs from specified version
    version = request.GET.get('version')

    # Load locale settings
    locale = request.GET.get('locale')
    locale_l = {'zh_hans': 'l_chinese_s',
                'zh_hant': 'l_chinese_t',
                'en_us'  : 'l_english',
                'de_de'  : 'l_german',
                'es_es'  : 'l_spanish',
                'fr_fr'  : 'l_french',
                'pl'     : 'l_polish',
                'pt_br'  : 'l_braz_por',
                'ru'     : 'l_russian'}

    # Load techs and locales
    with open('data/version/' + version + '/techs.json') as data_file:    
        data = json.load(data_file)
    lang = {}
    file_data = yaml.load(_localized_yaml('data/locale/' + locale + '.yml'))
    loc_map = file_data[locale_l[locale]]
    lang.update(loc_map)

    for tech in data:
        if tech['key'] in lang:
            tech['name'] = lang[tech['key']]
            tech['description'] = lang[tech['key']+'_desc']
            tech['category'] = lang[_parse_category(tech['category'])]
        else:
            pass
    # Debug
    #print(lang[_parse_category(tech['category'])])

    return JsonResponse(data, safe=False)
