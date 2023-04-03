// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

// 파이어베이스 클라우드 메시징 서비스
class FirebaseCloudMessagingService extends GetxService {
  static FirebaseCloudMessagingService get to => Get.find();

  /// AndroidNotificationChannel
  /// id: 임의 ID
  /// name: 설정에 보일 채널명
  /// description: 설정에 보일 채널 설명
  /// importance: Android 알림에 사용 가능한 중요도 수준 (Android 8.0 이상)
  /// playSound(default: true): 알림 사운드 설정
  /// sound: 알림 사운드 여부
  /// enableVibration(default: true): 지정된 채널에 연결되어 있으며 처음 채널을 만든 후에는 변경할 수 없습니다.
  /// vibrationPattern: 진동 패턴
  /// showBadge(default: true): 이 채널에 게시된 알림을 실행기에서 애플리케이션 아이콘 배지로 표시할 수 있는지 여부
  /// enableLights(default: false):
  /// ledColor:
  late AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
    playSound: true,
    showBadge: true,
    enableLights: true,
  );
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  InitializationSettings initializationSettings = const InitializationSettings(
    android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    iOS: DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    ),
  );

  Rx<RemoteMessage> message = const RemoteMessage().obs;

  @override
  Future<void> onInit() async {
    /// Android Notification Plugin
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// 권한 셋팅
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    /// 옵션 설정
    await handleSetForegroundNotificationPresentationOptions();

    /// FCM 토큰 저장
    await handleGetStorage();

    /// 포그라운드 메세지 처리
    await handleOnForegroundMessageSettings(
      initializationSettings: initializationSettings,
      flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin,
      channel: channel,
    );

    // 백그라운드 메세지 처리
    await handleOnBackgroundMessageSettings();

    super.onInit();
  }
}

/// 옵션 설정
Future<void> handleSetForegroundNotificationPresentationOptions() async {
  // `settings`의 경우 `IOS`의 경우 권한화면이 나오기 전에 권한 요청이 간다.
  final NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  Logger().d('''
  [FCM] IOS TEST 권한동의
  alert : ${settings.alert}
  announcement: ${settings.announcement}
  badge: ${settings.badge}
  carPlay: ${settings.carPlay}
  criticalAlert: ${settings.criticalAlert}
  authorizationStatus: ${settings.authorizationStatus}
  lockScreen: ${settings.lockScreen}
  notificationCenter: ${settings.notificationCenter}
  showPreviews: ${settings.showPreviews}
  timeSensitive: ${settings.timeSensitive}
  sound: ${settings.sound}''');

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
}

/// FCM 토큰 저장
Future<void> handleGetStorage() async {
  final String? token = await FirebaseMessaging.instance.getToken();
  GetStorage().write('fcm_token', token);
  GetStorage().write('fcm_column', 'mb_10');
  Logger().d('''
[FCM] FCM 토큰
TOKEN : $token''');
}

/// 포그라운드 메세지 처리
Future<void> handleOnForegroundMessageSettings({
  required InitializationSettings initializationSettings,
  required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  required AndroidNotificationChannel channel,
}) async {
  FirebaseMessaging.onMessage.listen(
    (RemoteMessage message) async {
      final AndroidNotification? android = message.notification?.android;
      Logger().d('''
[Android]
android : $android
channelId : ${android?.channelId}
clickAction : ${android?.clickAction}
color : ${android?.color}
count : ${android?.count}
imageUrl : ${android?.imageUrl}
link : ${android?.link}
priority : ${android?.priority}
smallIcon : ${android?.smallIcon}
sound : ${android?.sound}
tag : ${android?.tag}
ticker : ${android?.ticker}
visibility : ${android?.visibility}
''');

      // 메세지가 온 경우에만 체크
      if (message.notification != null) {
        FirebaseCloudMessagingService.to.message.value = message;

        if (Platform.isAndroid) {
          // 메세지 출력 부분
          await flutterLocalNotificationsPlugin.show(
            message.notification!.hashCode,
            message.notification!.title,
            message.notification!.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description.toString(),
                icon: '@mipmap/ic_launcher',
                importance: Importance.high,
              ),
              iOS: const DarwinNotificationDetails(),
            ),
          );
        }

        // 포그라운드 상태에서 메세지가 호출되었을때
        await handleOnForegroundMessage(message: message);

        // 포그라운드 상태에서 알림 메세지를 사용자가 눌렀을때
        // onDidReceiveBackgroundNotificationResponse 옵션 사용시 top-level 오류 발생함
        flutterLocalNotificationsPlugin.initialize(
          initializationSettings,
          onDidReceiveNotificationResponse: (details) {
            // ignore: unnecessary_null_comparison
            if (details != null) {
              handleOnForegroundMessageOpenedApp();
            }
          },
        );
      }
    },
  );
}

/// 백그라운드 메세지 처리
Future<void> handleOnBackgroundMessageSettings() async {
  /// 백그라운드일때 메세지가 오면 호출
  FirebaseMessaging.onBackgroundMessage(handleOnBackgroundMessage);

  /// 백그라운드 상태에서 알림 메세지를 사용자가 눌렀을때
  FirebaseMessaging.onMessageOpenedApp.listen((message) async =>
      await handleOnBackgroundMessageOpenedApp(message: message));
}

// 백 포그라운드 메세지 ====================
// senderId: 업스트림 발신자 위치의 ID입니다.
// category: 이 알림이 할당된 iOS 카테고리입니다.
// collapseKey: 메시지가 전송된 축소 키입니다. 동일한 키로 기존 메시지를 재정의하는 데 사용됩니다.
// contentAvailable(default: false): iOS APN 메시지가 백그라운드 업데이트 알림으로 구성되었는지 여부입니다.
// data(const <String, dynamic>{}): 메시지와 함께 전송된 추가 데이터입니다.
// from: 주제 이름 또는 메시지 식별자입니다.
// messageId: 모든 메시지에 할당된 고유 ID입니다.
// messageType: 메시지 유형입니다.
// mutableContent(false):
// notification: 메시지의 iOS APN mutable-content 속성이 앱이 앱 확장을 통해 알림을 수정할 수 있도록 설정되었는지 여부입니다.
// sentTime: 메시지가 전송된 시간으로 [DateTime]으로 표시됩니다.
// threadId: 알림 그룹화에 사용되는 iOS 앱 고유 식별자입니다.
// ttl: 메시지의 TTL(초)입니다.

/// 포그라운드 상태에서 메세지가 호출되었을때
Future<void> handleOnForegroundMessage({
  required RemoteMessage message,
}) async {
  // if (message.notification != null) {
  Logger().d(
      '[FCM] 앱 포그라운드 상태 메세지 : ${FirebaseCloudMessagingService.to.message.value.messageId}');
  // }

  return;
}

/// 포그라운드 상태에서 알림 메세지를 사용자가 눌렀을때
Future<void> handleOnForegroundMessageOpenedApp() async {
  Logger().d(
      '[FCM] 앱 포그라운드 알림 메세지 클릭 : ${FirebaseCloudMessagingService.to.message.value.data}');
  // await MainController.to
  //     .handleWebViewControllerLoadURL(message: FirebaseCloudMessageingService.to.message.value);
}

/// 백그라운드 메세지
Future<void> handleOnBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    Logger().d('[FCM] 앱 백그라운드 상태 메세지 : ${message.messageId}');
  }

  return;
}

/// 백그라운드 상태에서 알림 메세지를 사용자가 눌렀을때
Future<void> handleOnBackgroundMessageOpenedApp({
  required RemoteMessage message,
}) async {
  if (message.notification != null) {
    Logger().d('[FCM] 앱 백그라운드에서 알림 메세지 클릭 : ${message.data}');
    // await MainController.to.handleWebViewControllerLoadURL(message: message);
  }
}
