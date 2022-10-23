import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'app/modules/splash/binding/splash_binding.dart';
import 'app/modules/splash/view/splash_view.dart';
import 'app/routes/app_pages.dart';
import 'app/service/global_service.dart';
import 'app/theme/theme.dart';

void main() async {
  await initialize();
  runApp(const MyApp());
}

Future<void> initialize() async {
  /// Widget Binding 초기화
  WidgetsFlutterBinding.ensureInitialized();

  /// .env 초기화
  await dotenv.load();

  /// Get Storage 초기화
  await GetStorage.init();

  /// Timeago 언어 초기화
  timeago.setLocaleMessages('ko', timeago.KoMessages());

  /// 가로모드 방지
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  /// 글로벌 서비스 초기화
  Get.put(GlobalService());
  // Get.put(FCMService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(411.4, 852.6),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) => GetMaterialApp(
          title: dotenv.env['APP_EN_NAME']!,
          initialRoute: '/splash',
          initialBinding: SplashBinding(),
          getPages: AppPages.routes,
          smartManagement: SmartManagement.full,
          home: const SplashView(),
          builder: (BuildContext context, Widget? child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          ),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ko'),
          ],
          debugShowCheckedModeBanner: false,
          theme: theme(),
          // darkTheme: darkTheme(context: context),
        ),
      );
}
