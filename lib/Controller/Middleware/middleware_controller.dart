import 'package:dish_network/main.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';

class MyMiddleWare extends GetMiddleware {
  final checkUser = GetStorage();

  @override
  RouteSettings? redirect(String? route) {
    if (checkUser.read('login') != null) {
      return const RouteSettings(name: '/home');
    }
  }
}
