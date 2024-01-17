import 'package:api_alya/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Tablehome extends StatelessWidget {
  final productController = Get.put(ProductController());
  Tablehome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Makeup for tablet'),
      ),
      body: Obx(() => productController.isLoading.value?Center(
        child: CircularProgressIndicator(),
      ) : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // You can adjust the cross-axis count based on your design
          crossAxisSpacing: 8.0, // Adjust the spacing between grid items
          mainAxisSpacing: 8.0, // Adjust the spacing between rows/columns in the grid
        ),
        itemCount: productController.productresponsemodel.length,
        itemBuilder: (BuildContext context, int index) {
          final product = productController.productresponsemodel[index];
          return Container(
            margin: EdgeInsets.all(15),
            child: Container(
              width: 200,
              height: 150,
              child: Card( // Wrap the content in a Card for a nicer visual appearance
                child: InkWell( // Add InkWell for tap interaction if needed
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        product.imageLink,
                        height: 150, // Set the desired height of the image
                        width: 300, // Take the full width of the card
                        fit: BoxFit.cover, // Adjust the image fit
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      )
      ),
    );
  }
}
