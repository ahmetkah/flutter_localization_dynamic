import 'dart:ui';

import 'package:flutter/material.dart';

/// [1. Adım]
/// Sınıfı ChangeNotifier'ten extends et..
class LanguageProvider extends ChangeNotifier {
  var _locale = Locale(window.locale.languageCode, window.locale.countryCode);

  /// Getter: Dili [OKU/GETİR]
  Locale get locale => _locale;

  /// Setter: Dili [DEĞİŞTİR/YENİ DEĞER ATA]
  set setLocale(Locale newLocale) {
    /// Girilen ile Mevcut değer aynı ise [DEĞİŞİKLİK YAPMA]
    /// yani notifyListeners çalışmasın
    if (newLocale == _locale) {
      debugPrint('Girizlen "$newLocale" değeri mevcut "$_locale" değeri ile aynı.');
      return;
    }

    /// Değiştirilen yeni Locale değerini değişkene [ATA]
    _locale = newLocale;
    debugPrint('Dil "$_locale" olarak değiştirildi');

    /// Dil değişikliğini [BİLDİR]
    /// [state]'in güncellenmesi için
    /// [notifyListeners()] metodunu çağırdık.
    notifyListeners();
  }
}
