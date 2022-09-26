import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'Controller/Notification/notification_service.dart';
import 'View/Route/route_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  await GetStorage.init();
  runApp(RouteScreen());
}
