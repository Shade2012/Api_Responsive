import 'package:api_alya/product_controller.dart';
import 'package:api_alya/tablethome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';



class MyHomePage extends StatelessWidget {
  final ProductController layoutController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () => layoutController.isMobileLayout.value
            ? HomePage()
            : Tablehome(),
      ),
    );
  }


}
