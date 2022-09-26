import 'package:dish_network/Controller/Auth/login_controller.dart';
import 'package:dish_network/View/widgets/costum_button.dart';
import 'package:dish_network/View/widgets/costum_field.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginController controller = Get.put(LoginController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Dish Network',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Costum_feild(
                  labelText: 'Phone', controller: controller.phoneController),
              Costum_feild(
                  labelText: 'Password',
                  controller: controller.passwordController),
              Costum_button(
                  title: 'Login',
                  onPressed: () {
                    controller.getData();
                    controller.checkUser();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
