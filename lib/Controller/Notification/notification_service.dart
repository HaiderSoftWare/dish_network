import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';
import 'package:intl/intl.dart';

class NotificationService extends GetxController {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService._internal();

  Future<void> initNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid, iOS: null);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification({
    int? id,
    String? title,
    String? body,
    String? time,
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id!,
      title,
      body,
      tz.TZDateTime.from(
        DateFormat('yyyyy.MMMM.dd GGG hh:mm aaa').parse(time!),
        getLocation('America/Detroit'),
      ).add(const Duration(
        milliseconds: 100,
      )),
      const NotificationDetails(
        android: AndroidNotificationDetails('main_channel', 'Main Channel',
            channelDescription: "ashwin",
            importance: Importance.max,
            priority: Priority.max),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }
}
