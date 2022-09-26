import 'package:dish_network/Controller/Products/products_controller.dart';
import 'package:dish_network/Model/Data/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';
import '../details/details_screen.dart';

class HomeScreen extends StatelessWidget {
  Products products = Products();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trips'),
        leading: const Icon(Icons.menu),
      ),
      body: SafeArea(
        child: GetBuilder<ProductsController>(
          init: ProductsController(),
          builder: (controller) {
            return FutureBuilder<List<Products>>(
              future: controller.getProducts(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<Products> data = snapshot.data;
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Image.network(data[index].image.toString()),
                              Positioned(
                                left: 10,
                                top: 180,
                                child: InkWell(
                                  onTap: () {
                                    Get.to(DtailsScreen(
                                      title: data[index].name.toString(),
                                      image: data[index].image.toString(),
                                      createdAt:
                                          data[index].createdAt.toString(),
                                      updatedAt:
                                          data[index].updatedAt.toString(),
                                      time: data[index].status![index].time,
                                      status: data[index].status![index].status,
                                    ));
                                  },
                                  child: Text(data[index].name.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3),
                                ),
                              ),
                            ],
                          );
                        }),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          },
        ),
      ),
    );
  }
}
