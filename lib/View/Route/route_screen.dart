import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Middleware/middleware_controller.dart';
import '../home/home_screen.dart';
import '../login/login_screen.dart';

class RouteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onInit: () => MyMiddleWare(),
      getPages: [
        GetPage(
          name: '/',
          page: () => LoginScreen(),
          middlewares: [
            MyMiddleWare(),
          ],
        ),
        GetPage(
          name: '/home',
          page: () => HomeScreen(),
        ),
      ],
      theme: ThemeData(
        primaryColor: Colors.blue,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.normal,
            color: Theme.of(context).primaryColor,
          ),
          headline2: const TextStyle(fontSize: 18, color: Colors.white),
          headline3: const TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
          headline4: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
          headline5: const TextStyle(
            color: Colors.blue,
            fontSize: 16,
          ),
          headline6: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 17),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
