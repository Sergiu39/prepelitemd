import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/l10n_ext.dart';
import '../../data/farm_repository.dart';
import '../../models/species.dart';

/// One species module: the list of its flocks.
class SpeciesScreen extends StatelessWidget {
  const SpeciesScreen({
    super.key,
    required this.species,
    required this.repository,
  });

  final Species species;
  final FarmRepository repository;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final flocks = repository.flocks(species: species);
    final today = DateTime.now();

    return Scaffold(
      appBar: AppBar(title: Text(species.label(l10n))),
      body: flocks.isEmpty
          ? Center(child: Text(l10n.flocksEmpty))
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: flocks.length,
              itemBuilder: (context, i) {
                final flock = flocks[i];
                final details = [
                  flock.purpose.label(l10n),
                  l10n.ageDays(flock.ageInDays(today)),
                  if (species.laysEggs && flock.eggsLast7Days.isNotEmpty)
                    l10n.eggsTodayCount(flock.eggsToday),
                ];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Icon(species.icon)),
                    title: Text(flock.name),
                    subtitle: Text(details.join(' · ')),
                    trailing: Text(
                      '${flock.currentCount}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    onTap: () =>
                        context.go('/${species.name}/flock/${flock.id}'),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(l10n.comingSoon))),
        icon: const Icon(Icons.add),
        label: Text(l10n.addFlock),
      ),
    );
  }
}
