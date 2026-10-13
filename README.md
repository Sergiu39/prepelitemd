# prepeliteMD

Aplicație de gestionare a fermei: prepelițe, pui de găină, iepuri (și altele, pe rând).
Farm management app for small and mid-size poultry and rabbit farms.

- Specificația versiunii 1: [docs/SPEC.md](docs/SPEC.md)
- Platforme: Android, iOS, web (Flutter)
- Limbi: ro, ru, uk, en, es, fr, tr

## Structura codului

```
lib/
  main.dart                 pornirea aplicației
  app.dart                  temă, limbi, navigare (go_router)
  l10n/app_*.arb            textele în cele 7 limbi
  models/                   specii, loturi
  data/farm_repository.dart sursa datelor (acum: date de probă; mai târziu: Supabase)
  features/
    shell/                  meniul de jos / lateral
    dashboard/              panoul principal
    species/                modulul unei specii: lista de loturi și detaliul lotului
    settings/               setări (limba)
```

## Pentru dezvoltatori

```
flutter pub get
flutter run -d chrome      # sau un emulator Android / iOS
flutter analyze && flutter test
```

Textele noi se adaugă în `lib/l10n/app_en.arb` și în celelalte 6 fișiere `.arb`;
`flutter gen-l10n` (sau orice `flutter run`) regenerează `app_localizations*.dart`.
