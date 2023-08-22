import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sip_app/routers/go_routers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Ship',
      routerConfig: goRouter,
      theme: ThemeData(fontFamily: 'NotoSansKR'),
      debugShowCheckedModeBanner: false,
      supportedLocales: [
        const Locale('ko', 'KR'), // Korean
        const Locale('en', 'US'), // English
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
        localeResolutionCallback: (Locale? locale, Iterable<Locale>? supportedLocales) {
          if (locale == null || supportedLocales == null || supportedLocales.isEmpty) {
            debugPrint("*language locale is null or supported locales are empty!!!");
            return supportedLocales?.first;
          }

          for (Locale supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode ||
                supportedLocale.countryCode == locale.countryCode) {
              debugPrint("*language ok $supportedLocale");
              Intl.defaultLocale = supportedLocale.toLanguageTag();
              return supportedLocale;
            }
          }

          debugPrint("*language to fallback ${supportedLocales.first}");
          return supportedLocales.first;
        },
    );
    // return ScreenUtilInit(
    //     designSize: const Size(360, 800),P
    //     minTextAdapt: true,
    //     splitScreenMode: true,
    //     builder: (context, child) {
    //       return MaterialApp(
    //           title: 'Flutter Demo',
    //           theme: ThemeData(fontFamily: "NotoSansKR"),
    //           themeMode: ThemeMode.system,
    //           home: RootView());
    //     });
  }
}
