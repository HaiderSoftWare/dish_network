import 'package:dio/dio.dart';
import 'package:dish_network/Controller/Auth/login_controller.dart';
import 'package:dish_network/path_api.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UpdataStatusController extends GetxController {
  Dio dio = Dio();
  LoginController controller = Get.put(LoginController());

  Future<Response> updataStatus(String name, String time, bool status) async {
    try {
      final Response response = await dio.put(
        upDataStatusUrl,
        data: {
          'name': name,
          'time': time,
          'status': status,
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${controller.token}',
        }),
      );
      return response.data;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
