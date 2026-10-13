import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import 'core/locale_controller.dart';
import 'data/farm_repository.dart';
import 'features/dashboard/dashboard_screen.dart';
import 'features/settings/settings_screen.dart';
import 'features/shell/home_shell.dart';
import 'features/species/flock_detail_screen.dart';
import 'features/species/species_screen.dart';
import 'l10n/app_localizations.dart';
import 'models/species.dart';

class PrepeliteApp extends StatefulWidget {
  const PrepeliteApp({
    super.key,
    required this.repository,
    required this.localeController,
  });

  final FarmRepository repository;
  final LocaleController localeController;

  @override
  State<PrepeliteApp> createState() => _PrepeliteAppState();
}

class _PrepeliteAppState extends State<PrepeliteApp> {
  late final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => HomeShell(shell: shell),
        branches: [
          _branch('/', DashboardScreen(repository: widget.repository)),
          for (final species in Species.values)
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/${species.name}',
                  builder: (context, state) => SpeciesScreen(
                    species: species,
                    repository: widget.repository,
                  ),
                  routes: [
                    GoRoute(
                      path: 'flock/:id',
                      builder: (context, state) => FlockDetailScreen(
                        flock: widget.repository.flockById(
                          state.pathParameters['id']!,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          _branch(
            '/settings',
            SettingsScreen(localeController: widget.localeController),
          ),
        ],
      ),
    ],
  );

  StatefulShellBranch _branch(String path, Widget screen) =>
      StatefulShellBranch(
        routes: [GoRoute(path: path, builder: (context, state) => screen)],
      );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale?>(
      valueListenable: widget.localeController,
      builder: (context, locale, _) => MaterialApp.router(
        onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
        debugShowCheckedModeBanner: false,
        locale: locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: ThemeData(
          colorSchemeSeed: const Color(0xFF6B8E23),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorSchemeSeed: const Color(0xFF6B8E23),
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        routerConfig: _router,
      ),
    );
  }
}
