import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/l10n_ext.dart';
import '../../models/flock.dart';

/// Detail page of one flock. Feed, health, production and money sections are
/// placeholders for now; they are built one by one per docs/SPEC.md.
class FlockDetailScreen extends StatelessWidget {
  const FlockDetailScreen({super.key, required this.flock});

  final Flock? flock;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final flock = this.flock;
    if (flock == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text(l10n.flockNotFound)),
      );
    }
    final locale = Localizations.localeOf(context).toLanguageTag();
    final date = DateFormat.yMMMd(locale).format(flock.startDate);

    final rows = [
      (l10n.fieldSpecies, flock.species.label(l10n)),
      (l10n.fieldPurpose, flock.purpose.label(l10n)),
      (l10n.fieldStartDate, date),
      (l10n.fieldAge, l10n.daysValue(flock.ageInDays(DateTime.now()))),
      (l10n.fieldInitialCount, '${flock.initialCount}'),
      (l10n.fieldDeaths, '${flock.deaths}'),
      (l10n.fieldSold, '${flock.sold}'),
      (l10n.fieldCurrentCount, '${flock.currentCount}'),
      if (flock.species.laysEggs && flock.eggsLast7Days.isNotEmpty)
        (l10n.dashboardEggsWeek, '${flock.eggsThisWeek}'),
    ];
    final sections = [
      (Icons.grass_outlined, l10n.sectionFeed),
      (Icons.vaccines_outlined, l10n.sectionHealth),
      (Icons.insights_outlined, l10n.sectionProduction),
      (Icons.payments_outlined, l10n.sectionMoney),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(flock.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Column(
              children: [
                for (final (label, value) in rows)
                  ListTile(
                    dense: true,
                    title: Text(label),
                    trailing: Text(value),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          for (final (icon, label) in sections)
            Card(
              child: ListTile(
                leading: Icon(icon),
                title: Text(label),
                subtitle: Text(l10n.comingSoon),
              ),
            ),
        ],
      ),
    );
  }
}
