import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/l10n_ext.dart';
import '../../core/locale_controller.dart';
import '../../l10n/app_localizations.dart';
import '../../models/species.dart';

/// First page a new user sees: language picker with flags, then two big
/// choices, Birds or Animals.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.localeController});

  final LocaleController localeController;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final current = Localizations.localeOf(context).languageCode;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                const SizedBox(height: 16),
                Text(
                  l10n.appTitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.displaySmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.welcomeSubtitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 32),
                Text(
                  l10n.chooseLanguage,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelLarge,
                ),
                const SizedBox(height: 12),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final locale in AppLocalizations.supportedLocales)
                      ChoiceChip(
                        key: ValueKey('lang-${locale.languageCode}'),
                        selected: locale.languageCode == current,
                        showCheckmark: false,
                        avatar: CountryFlag.fromCountryCode(
                          languageFlags[locale.languageCode]!,
                          theme: const ImageTheme(
                            width: 24,
                            height: 16,
                            shape: RoundedRectangle(3),
                          ),
                        ),
                        label: Text(languageNames[locale.languageCode]!),
                        onSelected: (_) => localeController.setLocale(locale),
                      ),
                  ],
                ),
                const SizedBox(height: 40),
                Text(
                  l10n.chooseGroup,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                _BigChoices(
                  children: [
                    for (final group in SpeciesGroup.values)
                      BigChoiceCard(
                        icon: group.icon,
                        title: group.label(l10n),
                        subtitle: group.hint(l10n),
                        onTap: () => context.go('/welcome/${group.name}'),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Second step: the species inside the chosen group.
class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key, required this.group, required this.onChosen});

  final SpeciesGroup group;
  final void Function(BuildContext context, Species species) onChosen;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(group.label(l10n)),
        leading: BackButton(onPressed: () => context.go('/welcome')),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Text(
                l10n.chooseSpecies,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              _BigChoices(
                children: [
                  for (final species in group.species)
                    BigChoiceCard(
                      icon: species.icon,
                      title: species.label(l10n),
                      onTap: () => onChosen(context, species),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Side by side on wide screens, stacked on phones.
class _BigChoices extends StatelessWidget {
  const _BigChoices({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 520) {
          return Column(
            children: [
              for (final child in children)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: SizedBox(height: 160, child: child),
                ),
            ],
          );
        }
        return SizedBox(
          height: 220,
          child: Row(
            children: [
              for (final (i, child) in children.indexed) ...[
                if (i > 0) const SizedBox(width: 16),
                Expanded(child: child),
              ],
            ],
          ),
        );
      },
    );
  }
}

class BigChoiceCard extends StatelessWidget {
  const BigChoiceCard({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return Card(
      color: scheme.primaryContainer,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 56, color: scheme.onPrimaryContainer),
              const SizedBox(height: 12),
              Text(
                title,
                style: text.headlineSmall?.copyWith(
                  color: scheme.onPrimaryContainer,
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: text.bodyMedium?.copyWith(
                    color: scheme.onPrimaryContainer,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
