import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prepelitemd/app.dart';
import 'package:prepelitemd/core/app_prefs.dart';
import 'package:prepelitemd/core/locale_controller.dart';
import 'package:prepelitemd/data/farm_repository.dart';
import 'package:prepelitemd/models/species.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Future<(LocaleController, AppPrefs)> pumpApp(
    WidgetTester tester, {
    Map<String, Object> saved = const {'language': 'en', 'lastSection': '/'},
  }) async {
    SharedPreferences.setMockInitialValues(saved);
    final prefs = await AppPrefs.load();
    final controller = LocaleController(prefs: prefs);
    await tester.pumpWidget(
      PrepeliteApp(
        repository: MockFarmRepository(),
        localeController: controller,
        prefs: prefs,
      ),
    );
    await tester.pumpAndSettle();
    return (controller, prefs);
  }

  testWidgets('returning user skips the start page', (tester) async {
    await pumpApp(tester, saved: {'language': 'ro', 'lastSection': '/'});
    expect(find.text('Panou'), findsWidgets);
    expect(find.text('Prepelițe'), findsWidgets);
    expect(find.text('Iepuri'), findsWidgets);
  });

  testWidgets('first run: start page, language, birds, quail', (tester) async {
    tester.view.physicalSize = const Size(1200, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    final (controller, prefs) = await pumpApp(tester, saved: {});
    expect(find.byKey(const ValueKey('lang-ro')), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('lang-ro')));
    await tester.pumpAndSettle();
    expect(prefs.languageCode, 'ro');
    expect(find.text('Păsări'), findsOneWidget);
    expect(find.text('Animale'), findsOneWidget);

    await tester.tap(find.text('Păsări'));
    await tester.pumpAndSettle();
    expect(find.text('Găini'), findsOneWidget);
    expect(find.text('Iepuri'), findsNothing);

    await tester.tap(find.text('Prepelițe'));
    await tester.pumpAndSettle();
    expect(find.text('Cușca 1'), findsOneWidget);
    expect(prefs.lastSection, '/quail');
  });

  testWidgets('opens quail module and a flock', (tester) async {
    await pumpApp(tester);
    await tester.tap(find.byIcon(Species.quail.icon).first);
    await tester.pumpAndSettle();
    expect(find.text('Cușca 1'), findsOneWidget);

    await tester.tap(find.text('Cușca 1'));
    await tester.pumpAndSettle();
    expect(find.text('Current count'), findsOneWidget);
    expect(find.text('116'), findsWidgets);
  });

  testWidgets('language switch changes the UI and is remembered', (
    tester,
  ) async {
    final (controller, prefs) = await pumpApp(tester);
    expect(find.text('Settings'), findsWidgets);
    controller.setLocale(const Locale('tr'));
    await tester.pumpAndSettle();
    expect(find.text('Ayarlar'), findsWidgets);
    expect(prefs.languageCode, 'tr');
  });

  test('flock counts are derived from deaths and sales', () {
    final flock = MockFarmRepository().flockById('c1')!;
    expect(flock.currentCount, 30 - 1 - 4);
    expect(flock.eggsToday, 21);
  });
}
