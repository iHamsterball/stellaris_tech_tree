# -*- coding: utf-8 -*-

from django.utils.translation import ugettext
import re
import yaml
import sys

localization_map = {}


def parse(modifier, loc_data):
    global localization_map
    localization_map = loc_data

    if len(modifier) == 1:
        modifier.append({'always': 'yes'})

    try:
        factor = next(iter(key for key in modifier
                           if list(key)[0] == 'factor'))['factor']
        adjustment = _localize_factor(factor)
    except StopIteration:
        add = next(iter(line for line in modifier
                        if list(line)[0] == 'add'))['add']
        adjustment = _localize_add(add)

    unparsed_conditions = [line for line in modifier
                           if list(line)[0] not in ['factor', 'add']]
    if len(unparsed_conditions) > 1:
        unparsed_conditions = [{'AND': unparsed_conditions}]

    conditions = [_parse_condition(condition)
                  for condition
                  in unparsed_conditions]

    yaml_output = yaml.dump({adjustment: conditions}, indent=4,
                            default_flow_style=False,
                            allow_unicode=True)
    pseudo_yaml = re.sub(r'(\xd7[\d.]+):\n\s*- ', r'(\1)',
                         yaml_output).replace('- ', u'• ')
    return pseudo_yaml


def _alt_key(key):
    yield key
    yield 'bypass_{}'.format(key).upper()
    yield '{}_base'.format(key).lower()
    yield '{}_name'.format(key).lower()


def _localize(arg):
    localized = None
    key = arg if isinstance(arg, str) else arg.group(1)
    for alt_key in _alt_key(key):
        try:
            localized = localization_map[alt_key]
            break
        except KeyError:
            continue
        except Exception as e:
            print(e.with_traceback)
    if not localized:
        print('Unprocessed weight modifier {}: {}'.format(key, localized))
    else:
        while '$' in localized:
            localized = re.sub(r'\$([\w|+=]+)\$', _localize, localized)
        if '@' in localized:
            localized = _localize(localized.replace('@', ''))
            print(key, localized)
        if '_' in localized:
            print('Unprocessed weight modifier {}: {}'.format(key, localized))
    return localized


def _parse_condition(condition):
    key = next(iter(condition))
    value = condition[key]
    try:
        return globals()['_localize_' + key.lower()](value)
    except KeyError:
        print('Error missing localization function {}, value: {}'.format(
            '_localize_' + key.lower(), value))
        return ''


def _expert(expert):
    return {
        'Physics': ugettext('Physics'),
        'Society': ugettext('Society'),
        'Engineering': ugettext('Engineering'),
    }.get(expert, 'Shouldn\'t be here')


def _localize_factor(factor):
    # TODO: Temporary workaround, highly probably malfunctioned on next update.
    # Version 2.3
    factor = factor if not isinstance(factor, str) else 1.5
    return u'\xD7{}'.format(factor)


def _localize_add(add):
    sign = '' if add == 0 else '+' if add > 0 else '-'
    return '{}{}'.format(sign, add)


def _localize_has_ethic(value):
    ethic = _localize(value)
    return ugettext('Has {} Ethic').format(ethic)


def _localize_has_not_ethic(value):
    ethic = _localize(value)
    return ugettext('Does NOT have {} Ethic').format(ethic)


def _localize_has_civic(value):
    civic = _localize(value)
    return ugettext('Has {} Government Civic').format(civic)


def _localize_has_valid_civic(value):
    civic = _localize(value)
    return ugettext('Has {} Government Civic').format(civic)


def _localize_has_not_valid_civic(value):
    civic = _localize(value)
    return ugettext('Does NOT have {} Government Civic').format(civic)


def _localize_has_ascension_perk(value):
    perk = _localize(value)
    return ugettext('Has {} Ascension Perk').format(perk)


def _localize_has_megastructure(value):
    megastructure = _localize(value)
    return ugettext('Has Megatructure {}').format(megastructure)


def _localize_has_policy_flag(value):
    try:
        policy_flag = _localize(value)
    except (KeyError):
        policy_flag = _localize(value+'_name')
    return ugettext('Has {} Policy').format(policy_flag)


def _localize_has_trait(value):
    trait = _localize(value)
    return ugettext('Has {} Trait').format(trait)


def _localize_pop_has_trait(value):
    trait = _localize(value)
    return ugettext('Pop in empire has {} trait').format(trait)


def _localize_has_authority(value):
    authority = _localize(value)
    return ugettext('Has {} Authority').format(authority)


def _localize_host_has_dlc(dlc):
    # dlc = _localize(value)
    return ugettext('Host does has the {} DLC').format(dlc)


def _localize_host_has_not_dlc(dlc):
    # dlc = _localize(value)
    return ugettext('Host does NOT have the {} DLC').format(dlc)


def _localize_has_technology(value):
    try:
        technology = _localize(value)
    except KeyError:
        technology = value

    return ugettext('Has {} Technology').format(technology)


def _localize_has_not_technology(value):
    try:
        technology = _localize(value)
    except KeyError:
        technology = value

    return ugettext('Does NOT have {} Technology').format(technology)


def _localize_has_modifier(value):
    modifier = _localize(value)
    return ugettext('Has the {} modifier').format(modifier)


def _localize_has_not_modifier(value):
    modifier = _localize(value)
    return ugettext('Does NOT have the {} modifier').format(modifier)


def _localize_is_country_type(value):
    return ugettext('Is of the {} country type').format(ugettext(value))


def _localize_ideal_planet_class(value):
    return ugettext('Is ideal class').format(value)


def _localize_is_planet_class(value):
    planet_class = _localize(value)
    return ugettext('Is {}').format(planet_class)


def _localize_has_government(value):
    government = _localize(value)
    return ugettext('Has {}').format(government)


def _localize_is_colony(value):
    return ugettext('Is a Colony') if value == 'yes' \
        else ugettext('Is NOT a Colony')


def _localize_allows_slavery(value):
    return ugettext('Allows Slavery') if value == 'yes' \
        else ugettext('Does NOT allow Slavery')


def _localize_has_federation(value):
    return ugettext('Is in a Federation') if value == 'yes' \
        else ugettext('Is NOT in a Federation')


def _localize_num_owned_planets(value):
    operator, value = _operator_and_value(value)
    return ugettext('Number of owned planets is {} {}').format(operator, value)


def _localize_count_owned_pops(value):
    operator, value = _operator_and_value(value[1]['count'])
    return ugettext('Number of enslaved planets {} {}').format(operator, value)


def _localize_num_communications(value):
    operator, value = _operator_and_value(value)
    return ugettext('Number of owned planets is {} {}').format(operator, value)


def _localize_has_communications(value):
    return ugettext('Has communications with your Empire')


def _localize_is_ai(value):
    return ugettext('Is AI controlled') if value == 'yes' else ugettext('Is NOT AI controlled')


def _localize_is_same_species(value):
    localized_value = 'Dominant' \
                      if value.lower() == 'root' \
        else _localize(value)
    return ugettext('Is of the {} Species').format(localized_value)


def _localize_is_species(value):
    localized_value = 'Dominant' \
                      if value.lower() == 'root' \
        else _localize(value)
    article = 'an' if localized_value[0].lower() in 'aeiou' else 'a'

    return ugettext('Is {} {}').format(article, localized_value)


def _localize_is_species_class(value):
    localized_value = _localize(value)
    article = 'an' if localized_value[0].lower() in 'aeiou' else 'a'

    return ugettext('Is {} {}').format(article, localized_value)


def _localize_is_enslaved(value):
    return ugettext('Pop is enslaved') if value == 'yes' else ugettext('Pop is NOT enslaved')


def _localize_years_passed(value):
    operator, value = _operator_and_value(value)
    return ugettext('Number of years since game start is {} {}').format(operator, value)


def _localize_not_years_passed(value):
    operator, value = _operator_and_value(value)
    return ugettext('Number of years since game start is NOT {} {}').format(operator, value)


def _localize_has_country_flag(value):
    return ugettext('Has {} country flag').format(value)


def _localize_has_not_country_flag(value):
    return ugettext('Does NOT have {} country flag').format(value)


def _localize_research_leader(values, negated=False):
    leader = ugettext('Research Leader ({})').format(
        _expert(values[0]['area'].title()))
    if negated:
        leader = ugettext('NOT ') + leader

    localized_conditions = []
    for condition in values[1:]:
        key = list(condition)[0]
        value = condition[key]
        localized_condition = {
            'has_trait': lambda: _localize_has_expertise(value),
            'has_level': lambda: _localize_has_level(value),
            'OR': lambda: _localize_or(values)
        }[key]()
        localized_conditions.append(localized_condition)

    return {leader: localized_conditions}


def _localize_not_research_leader(values):
    return _localize_research_leader(values, negated=True)


def _localize_has_level(value):
    operator, level = _operator_and_value(value)
    return ugettext('Skill level is {} {}').format(operator, level)


def _localize_has_expertise(value):
    expertise = _localize(value)
    if expertise.find(':') != -1 or expertise.find('：') != -1:
        colon_loc = 1 + expertise.find(':') + expertise.find('：')
        truncated = expertise.replace(expertise[0:colon_loc+1], '')
        condition = ugettext('Is {} Expert').format(truncated)
    else:
        condition = ugettext('Is {}').format(expertise)

    return condition


def _localize_area(value):
    # WTF is this?
    # Version 1.3 and earlier
    return ugettext('physics') if value == 'physics' else ''


def _localize_any_system_within_border(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('Any System within Borders'): parsed_values}


def _localize_not_any_system_within_border(values):
    # Version 1.3 and earlier
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('NOT Any System within Borders'): parsed_values}


def _localize_is_in_cluster(value):
    return ugettext('Is in a {} Cluster').format(value)


def _localize_any_country(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('Any Country'): parsed_values}


def _localize_any_relation(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('Any Relation'): parsed_values}


def _localize_any_owned_pop(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('Any empire Pop'): parsed_values}


def _localize_not_any_owned_pop(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('NOT any owned Pop'): parsed_values}


def _localize_any_pop(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('Any Pop'): parsed_values}


def _localize_any_owned_planet(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('Any owned Planet'): parsed_values}


def _localize_any_planet(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('Any Planet'): parsed_values}


def _localize_not_any_owned_planet(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('NOT any owned Planet'): parsed_values}


def _localize_any_planet_within_border(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('Any Planet within Borders'): parsed_values}


def _localize_any_system_planet(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('Any System Planet'): parsed_values}


def _localize_any_tile(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('Any Tile'): parsed_values}


def _localize_has_blocker(value):
    blocker = _localize(value)
    return ugettext('Has {} Tile Blocker').format(blocker)


def _localize_any_neighbor_country(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('Any Neighbor Country'): parsed_values}


def _localize_has_resource(value):
    resource, amount = value[0]['type'], value[1]['amount']
    operator, amount = _operator_and_value(amount)
    localized_resource = _localize(resource)
    return ugettext('Has {} {} {}').format(operator, amount, localized_resource)


def _localize_has_not_resource(value):
    resource, amount = value[0]['type'], value[1]['amount']
    operator, amount = _operator_and_value(amount)
    localized_resource = _localize(resource)
    return ugettext('Does NOT have {} {} {}').format(operator, amount, localized_resource)


def _localize_has_any_megastructure_in_empire(value):
    return ugettext('Has any megastructure in empire') if value == 'yes' else ugettext('Does NOT have any megastructure in empire')


def _localize_is_ftl_restricted(value):
    return ugettext('Is FTL restricted') if value == 'yes' else ugettext('Is NOT FTL restricted')


def _localize_has_not_authority(value):
    localized_machine_intelligence = _localize(value)
    return ugettext('{} has NOT authority').format(localized_machine_intelligence)


def _localize_has_not_policy_flag(value):
    # Version 1.3 and earlier
    return ugettext('{} Slavery for all species').format(_localize(value))


def _localize_not_is_same_species(value):
    # ROOT
    # I don't know what's this, I didn't play launch version before
    # Version 1.0 only
    return ugettext('Is NOT same species with ROOT species')


def _localize_has_building(value):
    # Alpha Mod
    return ugettext('Has building {}').format(_localize(value))


def _localize_empire_has_not_sr_dark_matter(value):
    # Alpha Mod
    return ugettext('Does NOT have any dark matter in empire') if value == 'yes' else ugettext('Has any dark matter in empire')


def _localize_has_not_tradition(value):
    # Alpha Mod
    return ugettext('Does NOT have {} tradition').format(_localize(value))


def _localize_is_playable_country(value):
    # New Ship Classes Mod
    return ugettext('Is playable country') if value == 'yes' else ugettext('Is NOT playable country')


def _localize_mid_game_years_passed(value):
    # New Ship Classes 2 Mod
    operator, value = _operator_and_value(value)
    return ugettext('Number of years since mid game is {} {}').format(operator, value)


def _localize_is_nomadic_empire(value):
    # Star Trek: New Horizons Mod
    return ugettext('Is Nomadic Empire') if value == 'yes' else ugettext('Is NOT Nomadic Empire')


def _localize_tos_era_or_higher(value):
    # Star Trek: New Horizons Mod
    return ugettext('TOS era or higher') if value == 'yes' else ugettext('NOT TOS era or higher')


def _localize_tmp_era_or_higher(value):
    # Star Trek: New Horizons Mod
    return ugettext('TMP era or higher') if value == 'yes' else ugettext('NOT TMP era or higher')


def _localize_has_non_standard_ships(value):
    # Star Trek: New Horizons Mod
    return ugettext('Has non-standard ships') if value == 'yes' else ugettext('Does NOT have standard ships')


def _localize_is_borg_empire(value):
    # Star Trek: New Horizons Mod
    return ugettext('Is borg empire') if value == 'yes' else ugettext('Is NOT borg empire')


def _localize_has_unique_fighter_variant(value):
    # Star Trek: New Horizons Mod
    return ugettext('Has unique fighter variant') if value == 'yes' else ugettext('Does NOT have fighter variant')


def _localize_is_temporal_masters(value):
    # Star Trek: New Horizons Mod
    return ugettext('Is temporal masters') if value == 'yes' else ugettext('Is NOT teporal masters')


def _localize_uses_polaron_torp(value):
    # Star Trek: New Horizons Mod
    return ugettext('Uses polaron torp') if value == 'yes' else ugettext('Does NOT use polaron torp')


def _localize_uses_quantum_torp(value):
    # Star Trek: New Horizons Mod
    return ugettext('Uses quantum torp') if value == 'yes' else ugettext('Does NOT use quantum torp')


def _localize_uses_photonic_torpedo(value):
    # Star Trek: New Horizons Mod
    return ugettext('Uses photonic torpedo') if value == 'yes' else ugettext('Does NOT use photonic torpedo')


def _localize_uses_plasma_torpedo(value):
    # Star Trek: New Horizons Mod
    return ugettext('Uses plasma torpedo') if value == 'yes' else ugettext('Does NOT use plasma torpedo')


def _localize_uses_warp_cores(value):
    # Star Trek: New Horizons Mod
    return ugettext('Uses warp cores') if value == 'yes' else ugettext('Does NOT use warp cores')


def _localize_uses_cloaks(value):
    # Star Trek: New Horizons Mod
    return ugettext('Uses cloaks') if value == 'yes' else ugettext('Does NOT use cloaks')


def _localize_uses_phaser_weapons_any(value):
    # Star Trek: New Horizons Mod
    return ugettext('Uses any kind of phaser weapons') if value == 'yes' else ugettext('Does NOT use any kind of phaser weapons')


def _localize_uses_disruptor_weapons_any(value):
    # Star Trek: New Horizons Mod
    return ugettext('Uses any kind of disruptor weapons') if value == 'yes' else ugettext('Does NOT use any kind of disruptor weapons')


def _localize_uses_antiproton_weapons_any(value):
    # Star Trek: New Horizons Mod
    return ugettext('Uses any kind of antiproton weapons') if value == 'yes' else ugettext('Does NOT use any kind of antiproton weapons')


def _localize_uses_tetryon_weapons_any(value):
    # Star Trek: New Horizons Mod
    return ugettext('Uses any kind of tetryon weapons') if value == 'yes' else ugettext('Does NOT use any kind of tetryon weapons')


def _localize_has_no_factions(value):
    # Star Trek: New Horizons Mod
    return ugettext('Does NOT have any factions') if value == 'yes' else ugettext('Has any factions')


def _localize_is_machine_cybernetic_empire(value):
    # Star Trek: New Horizons Mod
    return ugettext('Is machine cybernetic empire') if value == 'yes' else ugettext('Is NOT machine cybernetic empire')


def _localize_has_espionage_agency(value):
    # Star Trek: New Horizons Mod
    return ugettext('Has espionage agency') if value == 'yes' else ugettext('Does NOT have espionage agency')


def _localize_can_not_use_cloning(value):
    # Star Trek: New Horizons Mod
    return ugettext('Can NOT use cloning') if value == 'yes' else ugettext('Can use cloning')


def _localize_is_non_humanoid(value):
    # Star Trek: New Horizons Mod
    return ugettext('Is non-humanoid') if value == 'yes' else ugettext('Is humanoid')


def _localize_is_master_geneticist(value):
    # Star Trek: New Horizons Mod
    return ugettext('Is master geneticist') if value == 'yes' else ugettext('Is NOT master geneticist')


def _localize_empire_can_not_study_gagarin(value):
    # Star Trek: New Horizons Mod
    return ugettext('Empire can NOT study gagarin') if value == 'yes' else ugettext('Empire can study gagarin')


def _localize_empire_can_study_psionic_techs(value):
    # Star Trek: New Horizons Mod
    return ugettext('Empire can NOT study psionic techs') if value == 'yes' else ugettext('Empire can study psionic techs')


def _localize_is_terran_empire(value):
    # Star Trek: New Horizons Mod
    return ugettext('Is terran empire') if value == 'yes' else ugettext('Is NOT terran empire')


def _localize_terran_empire_met_kelpien(value):
    # Star Trek: New Horizons Mod
    return ugettext('Has terran empire met kelpien') if value == 'yes' else ugettext('Has NOT terran empire met kelpien')


def _localize_empire_met_borg(value):
    # Star Trek: New Horizons Mod
    return ugettext('Empire has met borg') if value == 'yes' else ugettext('Empire has NOT met borg')


def _localize_is_united_earth(value):
    # Star Trek: New Horizons Mod
    return ugettext('Is united earth') if value == 'yes' else ugettext('Is NOT united earth')


def _localize_is_non_standard_colonization(value):
    # Star Trek: New Horizons Mod
    return ugettext('Is non-standard colonization') if value == 'yes' else ugettext('Is standard colonization')


def _localize_has_not_government(value):
    return ugettext('Does NOT have {}').format(_localize(value))


def _localize_has_not_civic(value):
    return ugettext('Does NOT have {} civic').format(_localize(value))


def _localize_has_tradition(value):
    return ugettext('Has {} tradition').format(_localize(value))


def _localize_is_sapient(value):
    return ugettext('This Species is pre-sapient') if value == 'yes' \
        else ugettext('This Species is NOT pre-sapient')


def _localize_has_not_seen_any_bypass(value):
    return ugettext('Has NOT encountered a {}').format(_localize(value))


def _localize_has_seen_any_bypass(value):
    return ugettext('Has encountered a {}').format(_localize(value))


def _localize_not_owns_any_bypass(value):
    return ugettext('Does NOT control any system with a {}').format(_localize(value))


def _localize_owns_any_bypass(value):
    return ugettext('Controls a system with a {}').format(_localize(value))


def _localize_federation(value):
    federation_perk = _localize(value[0]['has_federation_perk'])
    technology = _localize(value[1]['any_member'][0]['has_technology'])
    return [ugettext('Has {} Federation Perk').format(federation_perk),
            ugettext('Any member has {} technology').format(technology)]


def _localize_is_galactic_community_member(value):
    return ugettext('Is galactic community member') if value == 'yes' \
        else ugettext('Is NOT galactic community member')


def _localize_has_origin(value):
    return ugettext('Has origin {}').format(_localize(value))


def _localize_is_pacifist(value):
    return ugettext('Is some degree of Pacifist') if value == 'yes' \
        else ugettext('Is NOT some degree of Pacifist')


def _localize_is_militarist(value):
    return ugettext('Is some degree of Militarist') if value == 'yes' \
        else ugettext('Is NOT some degree of Militarist')


def _localize_is_materialist(value):
    return ugettext('Is some degree of Materialist') if value == 'yes' \
        else ugettext('Is NOT some degree of Materialist')


def _localize_is_spiritualist(value):
    return ugettext('Is some degree of Spiritualist') if value == 'yes' \
        else ugettext('Is NOT some degree of Spiritualist')


def _localize_is_xenophile(value):
    return ugettext('Is some degree of Xenophile') if value == 'yes' \
        else ugettext('Is NOT some degree of Xenophile')


def _localize_is_xenophobe(value):
    return ugettext('Is some degree of Xenophobe') if value == 'yes' \
        else ugettext('Is NOT some degree of Xenophobe')


def _localize_is_egalitarian(value):
    return ugettext('Is some degree of Egalitarian') if value == 'yes' \
        else ugettext('Is NOT some degree of Egalitarian')


def _localize_is_authoritarian(value):
    return ugettext('Is some degree of Authoritarian') if value == 'yes' \
        else ugettext('Is NOT some degree of Authoritarian')


def _localize_count_starbase_sizes(value):
    starbase_size = _localize(value[0]['starbase_size'])
    operator, value = _operator_and_value(value[1]['count'])
    return ugettext('Number of Starbase {} is {} {}').format(starbase_size, operator, value)


def _localize_is_machine_empire(value):
    return ugettext('Is machine empire') if value == 'yes' else ugettext('Is NOT machine empire')


def _localize_is_lithoid_empire(value):
    return ugettext('Is lithoid empire') if value == 'yes' else ugettext('Is NOT lithoid empire')


def _localize_num_districts(value):
    district_type_key = value[0].get('type')
    district_type = _localize(district_type_key)
    operator, value = _operator_and_value(value[1].get('value'))
    return ugettext('Number of {} districts is {} {}').format(district_type, operator, value)


def _localize_has_deposit(value):
    deposit = _localize(value)
    return ugettext('Has deposit {}').format(deposit)


def _localize_has_not_ancrel(value):
    return ugettext('Does NOT have any ancrel') if value == 'yes' else ugettext('Has ancrel')


def _localize_always(value):
    return ugettext('Always') if value == 'yes' else ugettext('Never')


def _localize_and(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('All of the following'): parsed_values}


def _localize_or(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('Any of the following'): parsed_values}


def _localize_nor(values):
    parsed_values = [_parse_condition(value) for value in values]
    return {ugettext('None of the following'): parsed_values}


def _localize_not(value):
    key = list(value[0])[0]
    nested_value = value[0][key]

    if key == 'OR':
        # Redirect to localization of NOR:
        negation = _parse_condition({'NOR': nested_value})
    else:
        negated_key = key.replace('has_', 'has_not_') if 'has_' in key \
            else 'not_' + key
        negated_condition = {negated_key: value[0][key]}
        negation = _parse_condition(negated_condition)

    return negation


def _operator_and_value(data):
    if type(data) is int:
        operator = ugettext('equal to')
        value = data
    elif type(data) is dict:
        operator = {
            '>': ugettext('greater than'),
            '<': ugettext('less than'),
            '>=': ugettext('greater than or equal to'),
            '<=': ugettext('less than or equal to')
        }[list(data)[0]]
        value = next(iter(data.values()))

    return operator, value
