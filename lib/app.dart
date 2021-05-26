import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'l10n/language_manager.dart';
import 'providers/language_provider.dart';
import 'view/settings_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Değişimini dinleyeceğimiz değişkene erişim için
    final watch = context.watch<LanguageProvider>();

    /// 2. Alterantif
    /// final watch = Provider.of<LanguageProvider>(context, listen: true);
    /// [listen: true]: Rebuild için

    return MaterialApp(
      title: 'Flutter Localization Dynamic',
      debugShowCheckedModeBanner: false,

      /// Desteklenen Diller
      supportedLocales: LanguageManager.instance.supportedLocales,

      /// [Delegate: Temsilci] listesi
      localizationsDelegates: LanguageManager.instance.localizationsDelegates,

      /// Uygulamanın başlatılacağı dil
      locale: watch.locale,

      home: const SettingsView(),
    );
  }
}
