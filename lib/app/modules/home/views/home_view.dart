// ignore_for_file: must_be_immutable, unnecessary_import

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:take_home_test_pi/app/modules/home/widgets/product_card.dart';
import 'package:take_home_test_pi/app/modules/home/widgets/product_smimmer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  HomeController productController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            width: double.infinity,
            height: 180,
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    minRadius: 30,
                    backgroundImage: AssetImage('assets/images/avatar.jpeg'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Harri Hidayat',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Obx(
                          () => Text(
                            productController.location.value,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () => Get.toNamed('/profile'),
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text(
                          'View Profile',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Obx(
                  () => GridView.builder(
                    shrinkWrap: true,
                    controller: productController.controller,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            mainAxisExtent: 300),
                    itemCount: productController.items.length + 2,
                    itemBuilder: (context, index) {
                      if (index < productController.items.length) {
                        return ProductCard(
                          model: productController.items[index],
                        );
                      } else {
                        return Center(
                          child: productController.hasMore.value
                              ? const ProductShimmer()
                              : const Text('No More Data'),
                        );
                      }
                    },
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
