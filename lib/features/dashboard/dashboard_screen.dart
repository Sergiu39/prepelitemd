import 'package:flutter/material.dart';

import '../../core/l10n_ext.dart';
import '../../data/farm_repository.dart';
import '../../models/species.dart';
import '../shared/demo_banner.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, required this.repository});

  final FarmRepository repository;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final flocks = repository.flocks();
    final eggsToday = flocks.fold(0, (sum, f) => sum + f.eggsToday);
    final eggsWeek = flocks.fold(0, (sum, f) => sum + f.eggsThisWeek);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.appTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const DemoBanner(),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _StatCard(
                icon: Icons.egg_outlined,
                label: l10n.dashboardEggsToday,
                value: '$eggsToday',
              ),
              _StatCard(
                icon: Icons.calendar_view_week_outlined,
                label: l10n.dashboardEggsWeek,
                value: '$eggsWeek',
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            l10n.dashboardAliveAnimals,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          for (final species in Species.values)
            Card(
              child: ListTile(
                leading: Icon(species.icon),
                title: Text(species.label(l10n)),
                subtitle: Text(
                  l10n.activeFlocks(repository.flocks(species: species).length),
                ),
                trailing: Text(
                  '${repository.flocks(species: species).fold(0, (sum, f) => sum + f.currentCount)}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon),
              const SizedBox(height: 8),
              Text(value, style: Theme.of(context).textTheme.headlineMedium),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}
