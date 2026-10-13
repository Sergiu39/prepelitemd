import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prepelitemd/app.dart';
import 'package:prepelitemd/core/locale_controller.dart';
import 'package:prepelitemd/data/farm_repository.dart';
import 'package:prepelitemd/models/species.dart';

void main() {
  Future<LocaleController> pumpApp(WidgetTester tester, Locale locale) async {
    final controller = LocaleController()..setLocale(locale);
    await tester.pumpWidget(
      PrepeliteApp(
        repository: MockFarmRepository(),
        localeController: controller,
      ),
    );
    await tester.pumpAndSettle();
    return controller;
  }

  testWidgets('dashboard shows modules in Romanian', (tester) async {
    await pumpApp(tester, const Locale('ro'));
    expect(find.text('Panou'), findsWidgets);
    expect(find.text('Prepelițe'), findsWidgets);
    expect(find.text('Iepuri'), findsWidgets);
  });

  testWidgets('opens quail module and a flock', (tester) async {
    await pumpApp(tester, const Locale('en'));
    await tester.tap(find.byIcon(Species.quail.icon).first);
    await tester.pumpAndSettle();
    expect(find.text('Cușca 1'), findsOneWidget);

    await tester.tap(find.text('Cușca 1'));
    await tester.pumpAndSettle();
    expect(find.text('Current count'), findsOneWidget);
    expect(find.text('116'), findsWidgets);
  });

  testWidgets('language switch changes the UI', (tester) async {
    final controller = await pumpApp(tester, const Locale('en'));
    expect(find.text('Settings'), findsWidgets);
    controller.setLocale(const Locale('tr'));
    await tester.pumpAndSettle();
    expect(find.text('Ayarlar'), findsWidgets);
  });

  test('flock counts are derived from deaths and sales', () {
    final flock = MockFarmRepository().flockById('c1')!;
    expect(flock.currentCount, 30 - 1 - 4);
    expect(flock.eggsToday, 21);
  });
}
