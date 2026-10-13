import 'package:flutter/material.dart';

import 'app.dart';
import 'core/app_prefs.dart';
import 'core/locale_controller.dart';
import 'data/farm_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await AppPrefs.load();
  runApp(
    PrepeliteApp(
      repository: MockFarmRepository(),
      localeController: LocaleController(prefs: prefs),
      prefs: prefs,
    ),
  );
}
