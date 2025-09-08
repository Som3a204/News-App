import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/core/routes/page_route_name.dart';
import 'package:news_app/core/theme/theme_manager.dart';
import 'package:news_app/modules/home/view_model/settings_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: MyApp()),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: provider.currentTheme,
      theme: ThemeManager.lightTheme,
      darkTheme: ThemeManager.darkTheme,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: PageRouteName.splash,
      locale: Locale(provider.currentLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
