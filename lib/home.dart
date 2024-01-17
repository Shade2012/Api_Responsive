import 'package:api_alya/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomePage extends StatelessWidget {
  final productController = Get.put(ProductController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Makeup For Handphone'),
      ),
      body: Obx(() => productController.isLoading.value?Center(
        child: CircularProgressIndicator(),
      ) : ListView.builder(
        itemCount: productController.productresponsemodel.length,
        itemBuilder: (BuildContext context, int index){
          final product = productController.productresponsemodel[index];
          return Container(
            margin: EdgeInsets.all(15),
            child: ListTile(

              //leading: Image.network(productController.productresponsemodel[index].imageLink),
              // juga bisa seperti ini tetapi yang bawah lebih singkat
              leading: Image.network(product.imageLink),
              title: Text(product.name),

            ),
          );
        },
      )),
    );
  }
}
