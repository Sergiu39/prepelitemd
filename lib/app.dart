import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import 'core/app_prefs.dart';
import 'core/locale_controller.dart';
import 'data/farm_repository.dart';
import 'features/dashboard/dashboard_screen.dart';
import 'features/settings/settings_screen.dart';
import 'features/shell/home_shell.dart';
import 'features/species/flock_detail_screen.dart';
import 'features/species/species_screen.dart';
import 'features/welcome/welcome_screen.dart';
import 'l10n/app_localizations.dart';
import 'models/species.dart';

class PrepeliteApp extends StatefulWidget {
  const PrepeliteApp({
    super.key,
    required this.repository,
    required this.localeController,
    this.prefs,
  });

  final FarmRepository repository;
  final LocaleController localeController;

  /// Remembers language and last section; `null` in tests that don't need it.
  final AppPrefs? prefs;

  @override
  State<PrepeliteApp> createState() => _PrepeliteAppState();
}

class _PrepeliteAppState extends State<PrepeliteApp> {
  late final GoRouter _router = GoRouter(
    // Returning users go straight to where they left off.
    initialLocation: widget.prefs?.lastSection ?? '/welcome',
    routes: [
      GoRoute(
        path: '/welcome',
        builder: (context, state) =>
            WelcomeScreen(localeController: widget.localeController),
        routes: [
          GoRoute(
            path: ':group',
            redirect: (context, state) =>
                SpeciesGroup.values.any(
                  (g) => g.name == state.pathParameters['group'],
                )
                ? null
                : '/welcome',
            builder: (context, state) => GroupScreen(
              group: SpeciesGroup.values.byName(state.pathParameters['group']!),
              onChosen: (context, species) {
                widget.prefs?.setLastSection('/${species.name}');
                context.go('/${species.name}');
              },
            ),
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) =>
            HomeShell(shell: shell, prefs: widget.prefs),
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
