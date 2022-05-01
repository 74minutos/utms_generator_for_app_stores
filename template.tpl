___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___


{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "UTMs Generator for App Stores",
  "categories": ["ATTRIBUTION", "ADVERTISING"],
  "description": "Template to generate links persisting utms when the users lands on both app stores (android and ios)",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "system",
    "macrosInSelect": true,
    "selectItems": [
      {
        "value": "ios",
        "displayValue": "iOS"
      },
      {
        "value": "android",
        "displayValue": "Android"
      }
    ],
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "displayName": "System"
  },
  {
    "type": "SELECT",
    "name": "analytics",
    "macrosInSelect": true,
    "selectItems": [
      {
        "value": "ga4",
        "displayValue": "GA4"
      },
      {
        "value": "universal",
        "displayValue": "Universal"
      }
    ],
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "displayName": "Analytics",
    "enablingConditions": [
      {
        "paramName": "system",
        "paramValue": "ios",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "ua_id",
    "displayName": "Universal Analytics Property ID",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "enablingConditions": [
      {
        "paramName": "analytics",
        "paramValue": "universal",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "ga4_id",
    "displayName": "GA4 Property ID (not measurement)",
    "simpleValueType": true,
    "enablingConditions": [
      {
        "paramName": "analytics",
        "paramValue": "ga4",
        "type": "EQUALS"
      }
    ],
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "app_id_ios",
    "displayName": "Bundle Identifier",
    "simpleValueType": true,
    "enablingConditions": [
      {
        "paramName": "system",
        "paramValue": "ios",
        "type": "EQUALS"
      }
    ],
    "help": "The final package that is used in your built .apk\u0027s manifest, e.g. com.example.application",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "app_id_android",
    "displayName": "APP ID",
    "simpleValueType": true,
    "enablingConditions": [
      {
        "paramName": "system",
        "paramValue": "android",
        "type": "EQUALS"
      }
    ],
    "help": "The final package that is used in your built .apk\u0027s manifest, e.g. com.example.application",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "redirect_url",
    "displayName": "Redirect URL",
    "simpleValueType": true,
    "help": "The URL to which the user will be redirected, e.g. https://itunes.apple.com/us/app/my-app/id123456789",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "SELECT",
    "name": "ad_network",
    "displayName": "Ad Network",
    "macrosInSelect": true,
    "selectItems": [
      {
        "value": "admob",
        "displayValue": "AdMob"
      },
      {
        "value": "aarki",
        "displayValue": "Aarki"
      },
      {
        "value": "adcolony",
        "displayValue": "AdColony"
      },
      {
        "value": "applovin",
        "displayValue": "AppLovin"
      },
      {
        "value": "conversant",
        "displayValue": "Conversant"
      },
      {
        "value": "fiksu",
        "displayValue": "Fiksu"
      },
      {
        "value": "inmobi",
        "displayValue": "InMobi"
      },
      {
        "value": "jampp",
        "displayValue": "Jampp"
      },
      {
        "value": "leadbolt",
        "displayValue": "Leadbolt"
      },
      {
        "value": "limei",
        "displayValue": "Limei"
      },
      {
        "value": "millenial_media",
        "displayValue": "Millenial Media"
      },
      {
        "value": "millenial_media_dsp",
        "displayValue": "Millenial Media DSP"
      },
      {
        "value": "mdotm",
        "displayValue": "MdotM"
      },
      {
        "value": "mobfox",
        "displayValue": "MobFox"
      },
      {
        "value": "nend",
        "displayValue": "nend"
      },
      {
        "value": "opera",
        "displayValue": "Opera"
      },
      {
        "value": "phunware",
        "displayValue": "Phunware"
      },
      {
        "value": "snakkads",
        "displayValue": "Snakk!ads"
      },
      {
        "value": "tapjoy",
        "displayValue": "Tapjoy"
      }
    ],
    "simpleValueType": true,
    "help": "The Ad Network your are using",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const getCookieValues = require('getCookieValues');

//Here we collect all the information that we need from the fields
const base_url = "https://click.google-analytics.com/redirect?";
const redirect_url = data.redirect_url;
const app_id_ios = data.app_id_ios;
const app_id_android = data.app_id_android;
const universal_id =  data.ua_id;
const ga4_id = data.ga4_id;
const ad_network = data.ad_network;

//To get this values we have to use the other template Campaign Data on Cookies
let source = getCookieValues('utm_source');
let medium = getCookieValues('utm_medium');
let campaign = getCookieValues('utm_campaign');

//Depending on the system (ios or android) and the analytics inside ios, we generate an url or another. The specifics are different for each one
switch(data.system){
  case 'ios':
    switch(data.analytics){
      case 'universal':
        var new_url = base_url + 'tid=' + universal_id + '&url=' + redirect_url + '&aid=' + app_id_ios + '&idfa={idfa}&cs=' + source + '&cm=' + medium + '&cn=' + campaign + '&anid=admob&hash=md5';
        break;
      case 'ga4':
        var new_url = base_url + 'tid=' + ga4_id + '&url=' + redirect_url + '&aid=' + app_id_ios + '&idfa={idfa}&cs=' + source + '&cm=' + medium + '&cn=' + campaign + '&anid=' + ad_network + '&hash=md5';
        break;
  }
    break;
  case 'android':
    var new_url = redirect_url + '&referrer=utm_source%3D' + source + '%26utm_medium%3D' + medium + '%26utm_campaign%3D' + campaign + '%26anid%3D' + ad_network;
    break;
}

return new_url;


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "get_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "cookieAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 30/4/2022 8:13:52
