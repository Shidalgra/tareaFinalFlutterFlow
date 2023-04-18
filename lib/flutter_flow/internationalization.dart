import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en', 'ru', 'zh_Hant', 'fr', 'de'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
    String? ruText = '',
    String? zh_HantText = '',
    String? frText = '',
    String? deText = '',
  }) =>
      [esText, enText, ruText, zh_HantText, frText, deText][languageIndex] ??
      '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // LoginAndSignin
  {
    'hjrgjdrl': {
      'es': 'Ingresar',
      'de': 'Geraten in',
      'en': 'Get into',
      'fr': 'Entrer dans',
      'ru': 'Попасть в',
      'zh_Hant': '進入',
    },
    'ovkcpc9f': {
      'es': 'Correo electrónico',
      'de': 'Email',
      'en': 'Email',
      'fr': 'Courrier électronique',
      'ru': 'Электронная почта',
      'zh_Hant': '電子郵件',
    },
    '4i5ovmha': {
      'es': 'Contraseña',
      'de': 'Passwort',
      'en': 'Password',
      'fr': 'Mot de passe',
      'ru': 'Пароль',
      'zh_Hant': '密碼',
    },
    '8wqg3z36': {
      'es': 'Iniciar sesión',
      'de': 'Anmeldung',
      'en': 'Log in',
      'fr': 'Commencer la session',
      'ru': 'Авторизоваться',
      'zh_Hant': '登錄',
    },
    'uml5peqr': {
      'es': '¿olvido su contraseña?',
      'de': 'Haben Sie Ihr Passwort vergessen?',
      'en': 'Forgot your password?',
      'fr': 'Vous avez oublié votre mot de passe?',
      'ru': 'Забыли пароль?',
      'zh_Hant': '忘記密碼了嗎？',
    },
    'ppsv5kt5': {
      'es': 'Fecha:',
      'de': 'Datum:',
      'en': 'Date:',
      'fr': 'Date:',
      'ru': 'Дата:',
      'zh_Hant': '日期：',
    },
    'r7cg20w2': {
      'es': 'Tipo de cambio dolar:',
      'de': 'Dollar-Wechselkurs:',
      'en': 'Dollar exchange rate:',
      'fr': 'Taux de change du dollar :',
      'ru': 'Курс доллара:',
      'zh_Hant': '美元匯率：',
    },
    'zf2yt4mc': {
      'es': '\$',
      'de': '\$',
      'en': '\$',
      'fr': '\$',
      'ru': '\$',
      'zh_Hant': '\$',
    },
    '9aakscpo': {
      'es': 'acceso',
      'de': 'Zugang',
      'en': 'Login',
      'fr': 'accès',
      'ru': 'доступ',
      'zh_Hant': '使用權',
    },
  },
  // HomePage
  {
    'dtkrofk8': {
      'es': 'Page Title',
      'de': '',
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hant': '',
    },
    '2fb0r7nl': {
      'es': 'Home',
      'de': '',
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hant': '',
    },
  },
  // Miscellaneous
  {
    'psfgnklq': {
      'es': '',
      'de': '',
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hant': '',
    },
    'mh77fg0m': {
      'es': '',
      'de': '',
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hant': '',
    },
    '7gvaxesd': {
      'es': '',
      'de': '',
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hant': '',
    },
    '0kj9jdql': {
      'es': '',
      'de': '',
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hant': '',
    },
    'scz1ip1t': {
      'es': '',
      'de': '',
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hant': '',
    },
    'krfavxht': {
      'es': '',
      'de': '',
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hant': '',
    },
    'quxqu999': {
      'es': '',
      'de': '',
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hant': '',
    },
    'rzmdoxi1': {
      'es': '',
      'de': '',
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hant': '',
    },
    'leyjs9ky': {
      'es': '',
      'de': '',
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hant': '',
    },
    '0p8azrno': {
      'es': '',
      'de': '',
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hant': '',
    },
    'lmzrq6ns': {
      'es': '',
      'de': '',
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hant': '',
    },
    'p7jpw5pg': {
      'es': '',
      'de': '',
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hant': '',
    },
    'knz0ytvs': {
      'es': '',
      'de': '',
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hant': '',
    },
    'pafd8msk': {
      'es': '',
      'de': '',
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hant': '',
    },
    '1llpwa9w': {
      'es': '',
      'de': '',
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hant': '',
    },
    'fwf0k5f7': {
      'es': '',
      'de': '',
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hant': '',
    },
    'rwglzoxx': {
      'es': '',
      'de': '',
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hant': '',
    },
    'pa4qa4dc': {
      'es': '',
      'de': '',
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hant': '',
    },
    'fefrkpmb': {
      'es': '',
      'de': '',
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hant': '',
    },
    'awd51znb': {
      'es': '',
      'de': '',
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hant': '',
    },
    'dkhy15td': {
      'es': '',
      'de': '',
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hant': '',
    },
  },
].reduce((a, b) => a..addAll(b));
