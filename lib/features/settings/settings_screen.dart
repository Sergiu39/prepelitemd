import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/l10n_ext.dart';
import '../../core/locale_controller.dart';
import '../../l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, required this.localeController});

  final LocaleController localeController;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.navSettings)),
      body: ValueListenableBuilder<Locale?>(
        valueListenable: localeController,
        builder: (context, selected, _) => RadioGroup<String>(
          groupValue: selected?.languageCode ?? '',
          onChanged: (code) => localeController.setLocale(
            code == null || code.isEmpty ? null : Locale(code),
          ),
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: Text(l10n.settingsStartPage),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.go('/welcome'),
              ),
              const Divider(),
              ListTile(
                title: Text(
                  l10n.settingsLanguage,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              RadioListTile<String>(
                value: '',
                title: Text(l10n.languageSystem),
              ),
              for (final locale in AppLocalizations.supportedLocales)
                RadioListTile<String>(
                  value: locale.languageCode,
                  title: Text(
                    languageNames[locale.languageCode] ?? locale.languageCode,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
