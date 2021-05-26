import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../widgets/item_tile.dart';
import '../widgets/change_language_dialog.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate('general_settings'),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.language,
            ),
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (context) => ChangeLanguageDialog(),
              );
            },
          ),
        ],
      ),

      /// [body] parametresinde birden fazla elaman vermek ve kaydırma özelliği
      /// kazandırmak için ListView widgeti kullandık.
      body: ListView(
        children: [
          ItemTile(
            title: context.translate('account'),
          ),
          ItemTile(
            title: context.translate('country'),
          ),
          ItemTile(
            title: context.translate('data_usage'),
          ),
          ItemTile(
            title: context.translate('display_and_sound'),
          ),
          ItemTile(
            title: context.translate('english'),
          ),
          ItemTile(
            title: context.translate('notifactions'),
          ),
          ItemTile(
            title: context.translate('permissions'),
          ),
          ItemTile(
            title: context.translate('phone_language'),
          ),
          ItemTile(
            title: context.translate('privacy'),
          ),
          ItemTile(
            title: context.translate('turkish'),
          ),
        ],
      ),
    );
  }
}
