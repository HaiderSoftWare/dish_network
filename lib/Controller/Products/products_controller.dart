import 'package:dio/dio.dart';
import 'package:dish_network/Controller/Auth/login_controller.dart';
import 'package:dish_network/Model/Data/products.dart';
import 'package:dish_network/path_api.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  Dio dio = Dio();
  LoginController controller = Get.put(LoginController());
  Future<List<Products>> getProducts() async {
    try {
      final response = await dio.get(
        productsUrl,
        options: Options(headers: {
          'Authorization': 'Bearer ${controller.token}',
        }),
      );
      List<Products> listData = [];
      for (var i in response.data) {
        listData.add(Products.fromJson(i));
      }

      return listData;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
