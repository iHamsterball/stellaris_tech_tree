'use strict';

let config = {
  container: '#tech-tree',
  rootOrientation: 'WEST', // NORTH || EAST || WEST || SOUTH
  nodeAlign: 'TOP',
  // levelSeparation: 30,
  hideRootNode: true,
  siblingSeparation: 20,
  subTeeSeparation:  20,
  scrollbar: 'fancy',
  connectors: { type: 'step' },
  node: {
    HTMLclass: 'tech',
    collapsable: false
  },
  callback: {
    onTreeLoaded: function() {
      $(document).tooltip({
        items: 'p.description, p.weight-modifiers[title], p.feature-unlocks[title]',
        content: function() {
          let $button = $(this);
          if ( $button.is('p.feature-unlocks') ) {
            let unlocks = $button.attr('title').split(', ');
            var $content = unlocks.map(
              function(unlock) {
                return $('<li>').html(
                  unlock.replace(/\[\[(\w+)\]\]/,
                                 '<img class="resource" src="/stellar_static/img/resources/$1.png" />')
                ); }
            ).reduce(
              function($ul, $unlock) {
                return $ul.append($unlock);
              },
              $('<ul>')
            );
          }
          else {
            var $content = $('<span>')
                .addClass($button.attr('class'))
                .html($button.attr('title'));
          }

          return $('<div class="tooltip-header">')
            .html($button.data('header'))
            .add($content);
        },
      });
    }
  }
};
let rootNode = {HTMLid: 'root', data: {tier: 0}};
let locale_map = {
  'zh-hans': 'zh_hans',
  'zh-hant': 'zh_hant',
  'pl': 'pl',
  'de': 'de_de',
  'en': 'en_us',
  'es': 'es_es',
  'fr': 'fr_fr',
  'pt-br': 'pt_br',
  'ru': 'ru'
};
let tree;

function loadTech(version) {
  if (typeof tree != "undefined") {
    tree.destroy();
  }
  generateTechTree(locale_map[document.querySelector('option[selected]').value], version);
  lazyLoadImg(100);
}

function generateTechTree(locale, version) {
  $.getJSON('techs?locale=' + locale + '&version=' + version, 'techs.json', function(techData) {
    let techs = techData.filter(function(tech) {
      return Object.keys(tech)[0].search(/^@\w+$/) == -1;
    }).map(function(tech) {
      let key = tech.key;
      let tier = tech.tier > 0
          ? ' (' + gettext("TIER") + ' ' + tech.tier + ')'
          : ' (' + gettext("STARTING") + ')';
      let costClass = tech.area + '-research';
      let cost = tech.tier > 0
          ? gettext("COST") + ': <span class="' + costClass + '">' + tech.cost + '</span>'
          : null;
      let weight = tech.tier > 0
          ? gettext("WEIGHT") + ': ' + tech.base_weight
          : null;
      let category = tech.category + tier;
      let iconClass = 'icon'
          + (tech.is_dangerous ? ' dangerous' : '')
          + (!tech.is_dangerous && tech.is_rare ? ' rare' : '');

      let $extraDataDiv = function() {
        let $descBtn = $('<p>');
        let description = tech.prerequisites_loc.length > 0
            ? tech.description + '</br></br>' + gettext('PREREQUISITES') + tech.prerequisites_loc.join(', ')
            : tech.description + '</br></br>' + gettext('PREREQUISITES') + gettext('NONE');
        description += tech.is_not_reverse_engineerable ? '</br><font color="red">' + gettext('IS_NOT_REVERSE_ENGINEERABLE') + '</font>' : '';
        $descBtn.addClass('description');
        $descBtn.attr('title', description);
        $descBtn.attr('data-header', gettext("DESCRIPTION"));
        $descBtn.html('…');
        let weightModifiers = tech.weight_modifiers.length > 0
            ? tech.weight_modifiers.join('')
            : null;
        let featureUnlocks = tech.feature_unlocks.length > 0
            ? tech.feature_unlocks.join(', ')
            : null;

        let $modifiersBtn = $('<p>');
        $modifiersBtn.addClass('weight-modifiers');
        if ( weightModifiers !== null ) {
          $modifiersBtn.attr('title', weightModifiers);
          $modifiersBtn.attr('data-header', gettext("WEIGHT_MODIFIERS"));
        }
        else {
          $modifiersBtn.addClass('disabled');
        }
        $modifiersBtn.html('⚄');

        let $unlocksBtn = $('<p>');
        $unlocksBtn.addClass('feature-unlocks');
        if ( featureUnlocks !== null ) {
          $unlocksBtn.attr('title', featureUnlocks);
          $unlocksBtn.attr('data-header', gettext("RESEARCH_EFFECT"));
        }
        else {
          $unlocksBtn.addClass('disabled');
        }
        $unlocksBtn.html('🎁');

        let $extraDataDiv = $('<div class="extra-data">');
        $extraDataDiv.append($descBtn);
        $extraDataDiv.append($modifiersBtn);
        $extraDataDiv.append($unlocksBtn);
        return $extraDataDiv;
      }();

      return {
        HTMLid: key,
        HTMLclass: tech.area,
        data: tech,
        innerHTML: '<div class="' + iconClass + '" img-url="/stellar_static/version/' + version + '/img/' + key + '.png"></div>'
          + '<p class="node-name" title="' + tech.name + '">'
          + tech.name
          + '</p>'
          + '<p class="node-title">' + category + '</p>'
          + '<p class="node-desc">' + ( tech.start_tech || tech.tier == 0 ? '<br />' : [cost, weight].join(', ')) + '</p>'
          + $extraDataDiv[0].outerHTML
      };
    });

    techs = techs.map(function(tech) {
      let key = tech.data.key;
      let prerequisite = tech.data.prerequisites[0] || null;

      if ( tech.data.tier === 0 || prerequisite === null) {
        tech.parent = rootNode;
      }
      else {
        let parentKey = prerequisite;
        tech.parent = parentKey.match('-pseudoParent')
          ? { HTMLid: tech.HTMLid + '-pseudoParent',
              parent: rootNode,
              pseudo: true,
              data: {tier: 0} }
          : techs.filter(function(candidate) {
            return candidate.HTMLid === parentKey;
          })[0];
      }

      let tierDifference = tech.data.tier - tech.parent.data.tier;
      let nestedTech = tech;
      while ( tierDifference > 1 && nestedTech.parent != rootNode ) {
        var pseudo = {
          HTMLid: nestedTech.HTMLid + '-pseudoParent',
          parent: nestedTech.parent, pseudo: true,
          data: { tier: nestedTech.data.tier - 1 }
        };
        tierDifference--;
        nestedTech.parent = pseudo;
        nestedTech = pseudo;
      }

      return tech;
    });

    for ( let i = 0; i < techs.length; i++ ) {
      let tech = techs[i]
      while ( tech.parent.pseudo ) {
        techs.push(tech.parent);
        tech = tech.parent;
      }
    }

    tree = new Treant([config, rootNode].concat(techs));
  })
  .done(function() {
    console.log('success')
    setBanner('banner-success', gettext('Load complete.'));
    //setTimeout(hideBanner(), 200000);
  })
  .fail(function( xhr, textStatus, error ) {
    console.log(xhr.status);
    let errmsg;
    switch ( textStatus ) {
      case 'error':
        errmsg = gettext('An error occured. ');
        break;
      case 'timeout':
        errmsg = gettext('Connection timeout. ');
        break;
      case 'parsererror':
        errmsg = gettext('Parser error. ');
        break;
      default:
        errmsg = gettext('Unhandled error. ');
    }
    errmsg += error;
    console.log(errmsg);
    setBanner('banner-error', errmsg);
  });
}

function loadImg() {
  [].map.call(document.querySelectorAll('div[img-url]'), function(div) {
    return div;
  }).reverse().forEach(function(tech) {
    let img = new Image();
    img.onload = function(){
      tech.style.backgroundImage = "url(" + img.src + ")";
      tech.removeAttribute('img-url');
    }
    img.src = tech.getAttribute('img-url');
  });
}
function lazyLoadImg(time) {
  if(document.querySelector('div[img-url]')!=null) {
    loadImg();
  } else {
    setTimeout(function() {
      lazyLoadImg(time);
    }, time);
  }
}

//Banner actions
function showBanner() {
  document.getElementById('banner').parentNode.classList.remove('hidden');
  console.log('Banner showed')
}
function hideBanner() {
  document.getElementById('banner').parentNode.classList.add('hidden');
  console.log('Banner hid')
}
function setBanner(mode, msg) {
  hideBanner();
  let banner = document.getElementById('banner');
  let cur = banner.classList[1];
  banner.classList.remove(cur);
  banner.classList.add(mode);
  banner.childNodes[1].innerHTML = msg;
  showBanner();
}