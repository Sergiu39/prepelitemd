import 'species.dart';

/// A flock (lot): a group of animals raised together, e.g. one cage of quail
/// or one batch of broilers.
class Flock {
  const Flock({
    required this.id,
    required this.name,
    required this.species,
    required this.purpose,
    required this.startDate,
    required this.ageAtStartDays,
    required this.initialCount,
    this.deaths = 0,
    this.sold = 0,
    this.eggsLast7Days = const [],
  });

  final String id;
  final String name;
  final Species species;
  final FlockPurpose purpose;
  final DateTime startDate;
  final int ageAtStartDays;
  final int initialCount;
  final int deaths;
  final int sold;

  /// Eggs collected per day, oldest first, today last. Empty for non-layers.
  final List<int> eggsLast7Days;

  int get currentCount => initialCount - deaths - sold;

  int ageInDays(DateTime today) =>
      ageAtStartDays + today.difference(startDate).inDays;

  int get eggsToday => eggsLast7Days.isEmpty ? 0 : eggsLast7Days.last;

  int get eggsThisWeek => eggsLast7Days.fold(0, (sum, e) => sum + e);
}
