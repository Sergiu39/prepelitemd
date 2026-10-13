import 'package:flutter/material.dart';

import 'app.dart';
import 'core/locale_controller.dart';
import 'data/farm_repository.dart';

void main() {
  runApp(
    PrepeliteApp(
      repository: MockFarmRepository(),
      localeController: LocaleController(),
    ),
  );
}
