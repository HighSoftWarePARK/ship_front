import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sip_app/routers/go_routers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
//앱 실행
void main() async {
WidgetsFlutterBinding.ensureInitialized(); // 앱 초기화를 기다리도록 설정

KakaoSdk.init(nativeAppKey: 'c5f620fd6e4288fae50a90fcace53fec');

  runApp(ProviderScope(child: MyApp()));
  //runApp이 최초로 불러온 위젯
  //MyApp은 위젯 트리에서 최상단에 위치하는 위젯이며 스크린 레이아웃을 최초로 빌드하는 역할
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Ship',// 앱 타이틀
      routerConfig: goRouter, // 라우터 설정
      theme: ThemeData(fontFamily: 'NotoSansKR'),//앱 테마 설정
      debugShowCheckedModeBanner: false,//디버그 배너 숨김
      supportedLocales: [
        const Locale('ko', 'KR'), // Korean
        const Locale('en', 'US'), // English
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],// 로컬라이제이션을 위한 델리게이트 설정
        localeResolutionCallback: (Locale? locale, Iterable<Locale>? supportedLocales) {
          if (locale == null || supportedLocales == null || supportedLocales.isEmpty) {
            debugPrint("*language locale is null or supported locales are empty!!!");
            return supportedLocales?.first;
          }

          for (Locale supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode ||
                supportedLocale.countryCode == locale.countryCode) {
              debugPrint("*language ok $supportedLocale");
              Intl.defaultLocale = supportedLocale.toLanguageTag();// 로컬라이제이션을 위한 기본 로케일 설정
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
