import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'language_manager.dart';

/// [AppLocalizations]: Özel Delegate (Temsilci) Sınıfımız
class AppLocalizations {
  /// Constructor (Kurucu)
  AppLocalizations(this.locale);

  /// Uygulamanın dili için
  final Locale locale;

  /// Dil dosyalarındaki metinler için
  late Map<String, String> _localizedStrings;

  /// MaterialApp'ın [localizationsDelegates] parametresinden
  /// [AppLocalizations] sınıfımızın delegate'ine erişim için
  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// BuildContext ile Lokalizasyona erişim için
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// Cihazın Locale'ine göre dil dosyalarımızın bulunduğu ("assets/languages")
  /// klasörü içinden "dilKodu_ülkeKodu.json" uzantılı dosyayı okunacak
  /// İçindekiler Map (key-value) yapısına parse edilecek ve
  /// [_localizedStrings] isimli değişkene atıyoruz
  Future<bool> load() async {
    //var jsonString = await rootBundle.loadString('assets/languages/${locale.languageCode}_${locale.countryCode}.json');
    //debugPrint('Dil dosyaları "assets/languages" dosya yolundan OKUNDU.');
    var jsonString = await rootBundle.loadString('${LanguageManager.instance.assetsPathLanguage}/${locale.languageCode}_${locale.countryCode}.json');
    debugPrint('Dil dosyaları "${LanguageManager.instance.assetsPathLanguage}" dosya yolundan OKUNDU.');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  /// Dil dosyalarındaki metinlere erişmek için kullanacağımız metot
  /// Map yapısındaki _localizedStrings içinden bu key'e karşılık gelen value'yu bize döndürülecek.
  String translate(String key) => _localizedStrings[key]!;
}

/// [AppLocalizations] isimli özel delegate sınıfımızı temsil edecek
/// [_AppLocalizationsDelegate] sınıfımız oluşturalım;
/// Bunu yapabilmek için önce bu sınıfımızı
/// [LocalizationsDelegate<AppLocalizations>]'ten extends etmemiz gerekiyor.

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  /// Constructor (Kurucu)
  const _AppLocalizationsDelegate();

  @override

  /// [isSupported]: Uygulama için desteklenen diller cihaz dilini destekliyor mu?
  bool isSupported(Locale locale) {
    /// ['en', 'tr']: Destek vereceğimiz dillere ait [languageCode]
    /// değerlerini List içinde belirttik.

    /// [.contains(locale.languageCode)]: Eğer cihazın dil kodu [languageCode]
    /// ile desteklenen dillerin dil kodları eşleşirse [true],
    /// eşleşmiyorsa [false] değeri dönecek
    //return ['en', 'tr'].contains(locale.languageCode);
    return LanguageManager.instance.supportedLanguagesCode.contains(locale.languageCode);
  }

  @override

  /// [load]: Dil dosyalarının yüklendiği yer
  Future<AppLocalizations> load(Locale locale) async {
    /// [AppLocalizations] sınıfından bir nesne oluşturduk.
    /// Bu nesne üzerinden load metodunu çağırdık.
    /// Böylece JSON uzantılı dil dosyalarımızın yüklenmesini sağladık.
    var localizations = AppLocalizations(locale);
    debugPrint('Dil dosyaları "${LanguageManager.instance.assetsPathLanguage}" dosya yolundan YÜKLENDİ.');
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) {
    /// [load] metodunun yeniden yüklenmesini istemediğimiz için false yaptık
    return false;
  }
}

/// Uygulamanın dil dosyalarına AppLocalizations üzerinden erişmek için
///  AppLocalizations.of(context).translate('keyDegeri')

extension AppLocalizationExtension on BuildContext {
  /// Uygulamanın dil dosyalarındaki metinlere BuildContext üzerinden erişmek için
  String translate(String key) => AppLocalizations.of(this)!.translate(key);
  // Kullanımı: context.translate('keyDegeri'),

  /// [locale]: Uygulamanın diline extension üzerinden erişmek için
  Locale get locale => AppLocalizations.of(this)!.locale;
  // Kullanımı: context.locale,
}
