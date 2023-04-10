import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'app/routes/app_pages.dart';
import 'app/service/auth_service.dart';
import 'app/service/firebase_auth_service.dart';
import 'app/service/firebase_cloud_messaging_service.dart';
import 'app/service/global_service.dart';
import 'app/service/location_service.dart';
import 'app/service/permission_service.dart';
import 'app/service/utils_service.dart';
import 'app/theme/theme.dart';
import 'app/utils/http_utils.dart';

void main() async {
  await initialize();
  runApp(const MyApp());
}

Future<void> initialize() async {
  // Widget Binding 초기화
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    SchedulerBinding.instance.scheduleWarmUpFrame();
  });

  /// Firebase 초기화
  await Firebase.initializeApp();

  // Http 초기화 (디버그 모드일 경우)
  if (kDebugMode) {
    HttpOverrides.global = MyHttpOverrides();
  }

  // .env 초기화
  await dotenv.load();

  // Get Storage 초기화
  await GetStorage.init();

  // Timeago 언어 초기화
  timeago.setLocaleMessages('ko', timeago.KoMessages());

  // 가로모드 방지
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Status 텍스트 색상
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
    ),
  );

  // Kakao 초기화
  KakaoSdk.init(nativeAppKey: dotenv.env['APP_KAKAO_NATIVE_APP_KEY']);

  // 글로벌 서비스
  Get.put(GlobalService(), permanent: true);

  // FCM 서비스
  // Get.put(FirebaseCloudMessagingService(), permanent: true);
  Get.put(FirebaseCloudMessagingService(), permanent: true);

  // 인증 서비스
  Get.put(AuthService(), permanent: true);

  /// 위치 서비스
  Get.put(LocationService(), permanent: true);

  // 퍼미션 서비스
  Get.put(PermissionService(), permanent: true);

  // 파이어베이스 인증 서비스
  // Get.put(FirebaseAuthService(), permanent: true);
  Get.lazyPut(() => FirebaseAuthService());

  // 유틸 서비스
  Get.put(UtilsService(), permanent: true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final heroController = HeroController();

    debugInvertOversizedImages = true;

    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: dotenv.env['APP_EN_NAME']!,
          initialRoute: '/splash',
          getPages: AppPages.routes,
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ko', 'KR'),
          ],
          locale: const Locale('ko'),
          debugShowCheckedModeBanner: false,
          // transitionDuration: const Duration(milliseconds: 500),
          navigatorObservers: [
            heroController,
          ],
          theme: theme(),
          // darkTheme: darkTheme(context: context),
        );
      },
    );
  }
}
