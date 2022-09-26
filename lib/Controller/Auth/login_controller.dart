import 'package:dio/dio.dart';
import 'package:dish_network/Model/Login/login.dart';
import 'package:dish_network/path_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timezone/data/latest.dart' as tz;

class LoginController extends GetxController {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  String? token;

  String? nameUser;
  final saveToken = GetStorage();

  Dio dio = Dio();
  Future<Login> getData() async {
    try {
      final Response response = await dio.post(loginUrl,
          options: Options(headers: {
            'Accept': 'application/json',
          }),
          data: {
            'phone': phoneController.text,
            'password': passwordController.text,
          });

      token = response.data['access_token'];

      return Login.fromJson(response.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  checkUser() {
    if (token != null) {
      Get.offNamed('/home');
      saveToken.write('login', 'done');
    }
  }

  @override
  void onInit() {
    tz.initializeTimeZones();
    super.onInit();
  }
}
