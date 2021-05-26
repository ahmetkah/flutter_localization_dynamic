import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localizations.dart';

class LanguageManager {
  /// [_instance] (private static variable)
  static LanguageManager? _instance;

  /// [instance] (public static method):
  static LanguageManager get instance {
    /// [_instance] null ise
    /// yani önceden oluşturulmuş bir nesne yoksa yeni bir nesne oluşturulacak.
    _instance ??= LanguageManager._init();

    /// [_instance] null değilse
    /// yani önceden oluşturulmuşsa var olan nesne döndürülecek.
    return _instance!;
  }

  /// [_init()] (private constructor method):
  LanguageManager._init();

  /// Dil dosyalarımızın bulunduğu [dosya yolu]
  final assetsPathLanguage = 'assets/languages';

  /// Desteklenecek Amerikan İngilizcesi dili için oluşturulan [Locale] nesnesi
  final enLocale = Locale('en', 'US');

  /// Desteklenecek Türkçe dili için oluşturulan [Locale] nesnesi
  final trLocale = Locale('tr', 'TR'); // Türkçe

  /// Desteklenen dillere için oluşturulan [Locale] nesnesi listesi
  List<Locale> get supportedLocales => [
        enLocale,
        trLocale,
      ];

  /// Desteklenen dillere ait [Dil Kodları]
  List<String> get supportedLanguagesCode => [
        enLocale.languageCode,
        trLocale.languageCode,
      ];

  List<LocalizationsDelegate> get localizationsDelegates => [
        /// Uygulama için kendi oluşturduğumuz delegate
        AppLocalizations.delegate,

        /// Material widget kütüphanesi için delegate
        GlobalMaterialLocalizations.delegate,

        /// Widgetlar için Locale değerine göre metin yönünü belirler
        /// [TextDirection.ltr] Metin Yönü - Soldan sağa (left to right) (Varsayılan)
        /// [TextDirection.rtl] Metin Yönü - Sağdan sola(right to left)
        GlobalWidgetsLocalizations.delegate,

        /// Cupertino widget kütüphanesi için delegate
        GlobalCupertinoLocalizations.delegate,
      ];
}
