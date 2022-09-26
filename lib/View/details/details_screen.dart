import 'package:dish_network/View/home/home_screen.dart';
import 'package:dish_network/View/widgets/costum_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Notification/notification_service.dart';
import '../../Controller/Status/updata_starus.controller.dart';
import '../../main.dart';

class DtailsScreen extends StatelessWidget {
  String? title;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? time;
  bool? status;

  DtailsScreen(
      {super.key,
      this.title,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.time,
      this.status});

  UpdataStatusController controller =
      Get.put(UpdataStatusController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(image!),
            Text(
              'Created_at : $createdAt',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Updated_at : $updatedAt',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              ' Time of Tripe : $time',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              ' Status of Tripe : $status',
              style: Theme.of(context).textTheme.headline4,
            ),
            Costum_button(
              title: 'Accept',
              onPressed: () {
                NotificationService().showNotification(
                  id: 1,
                  title: title,
                  body: "It's time for trip",
                  time: time,
                );
                Get.defaultDialog(
                    title: "Accept Successfuly",
                    middleText:
                        'You will receive a notification \n at the time of flight',
                    backgroundColor: Colors.white,
                    titleStyle: Theme.of(context).textTheme.headline6,
                    middleTextStyle: Theme.of(context).textTheme.headline6,
                    confirm: InkWell(
                      onTap: () {
                        Get.to(HomeScreen());
                      },
                      child: Text(
                        'Confirm',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    cancel: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Text('Cancel'),
                    ),
                    radius: 10);
              },
            ),
          ],
        ),
      ),
    );
  }
}
