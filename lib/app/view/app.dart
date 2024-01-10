import 'package:flutter/material.dart';
import 'package:jobsense/app/common/widgets/jobsense_blocbase.dart';
import 'package:jobsense/app/router/router.dart';
import 'package:jobsense/app/theme/apptheme.dart';
import 'package:jobsense/l10n/l10n.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AppRouter _router;

  @override
  void initState() {
    super.initState();
    _router = AppRouter();
  }

  @override
  Widget build(BuildContext context) {
    return JobsenseBlocBase(
      child: MaterialApp.router(
        theme: JobSenseTheme.light,
        darkTheme: JobSenseTheme.dark,
        themeMode: ThemeMode.light,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routeInformationParser: _router.defaultRouteParser(),
        routerDelegate: _router.delegate(),
      ),
    );
  }
}
