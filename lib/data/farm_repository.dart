import '../models/flock.dart';
import '../models/species.dart';

/// Source of farm data. The mock version below is used until Supabase is
/// connected; screens only talk to this interface, so swapping it later does
/// not touch the UI.
abstract class FarmRepository {
  List<Flock> flocks({Species? species});
  Flock? flockById(String id);
}

class MockFarmRepository implements FarmRepository {
  MockFarmRepository({DateTime? today}) : _today = today ?? DateTime.now() {
    _flocks = _buildDemoFlocks();
  }

  final DateTime _today;
  late final List<Flock> _flocks;

  DateTime _daysAgo(int days) =>
      DateTime(_today.year, _today.month, _today.day - days);

  List<Flock> _buildDemoFlocks() => [
    Flock(
      id: 'q1',
      name: 'Cușca 1',
      species: Species.quail,
      purpose: FlockPurpose.eggs,
      startDate: _daysAgo(60),
      ageAtStartDays: 35,
      initialCount: 120,
      deaths: 4,
      eggsLast7Days: const [92, 95, 90, 97, 94, 96, 98],
    ),
    Flock(
      id: 'q2',
      name: 'Cușca 2',
      species: Species.quail,
      purpose: FlockPurpose.eggs,
      startDate: _daysAgo(20),
      ageAtStartDays: 30,
      initialCount: 80,
      deaths: 2,
      eggsLast7Days: const [20, 28, 35, 41, 47, 52, 55],
    ),
    Flock(
      id: 'q3',
      name: 'Lot carne',
      species: Species.quail,
      purpose: FlockPurpose.meat,
      startDate: _daysAgo(25),
      ageAtStartDays: 1,
      initialCount: 200,
      deaths: 11,
    ),
    Flock(
      id: 'c1',
      name: 'Ouătoare',
      species: Species.chicken,
      purpose: FlockPurpose.eggs,
      startDate: _daysAgo(150),
      ageAtStartDays: 120,
      initialCount: 30,
      deaths: 1,
      sold: 4,
      eggsLast7Days: const [21, 22, 20, 23, 19, 22, 21],
    ),
    Flock(
      id: 'c2',
      name: 'Broiler seria 3',
      species: Species.chicken,
      purpose: FlockPurpose.meat,
      startDate: _daysAgo(28),
      ageAtStartDays: 1,
      initialCount: 50,
      deaths: 2,
    ),
    Flock(
      id: 'r1',
      name: 'Reproducție',
      species: Species.rabbit,
      purpose: FlockPurpose.breeding,
      startDate: _daysAgo(300),
      ageAtStartDays: 150,
      initialCount: 9,
    ),
    Flock(
      id: 'r2',
      name: 'Tineret îngrășare',
      species: Species.rabbit,
      purpose: FlockPurpose.meat,
      startDate: _daysAgo(40),
      ageAtStartDays: 35,
      initialCount: 24,
      deaths: 1,
    ),
  ];

  @override
  List<Flock> flocks({Species? species}) => species == null
      ? List.unmodifiable(_flocks)
      : _flocks.where((f) => f.species == species).toList();

  @override
  Flock? flockById(String id) {
    for (final f in _flocks) {
      if (f.id == id) return f;
    }
    return null;
  }
}
