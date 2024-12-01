import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_controller.dart';
import 'cart_page.dart';

class ProductListPage extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  final List<String> products = [
    'Apples',
    'Bananas',
    'Oranges',
    'Grapes',
    'Mangoes',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shop ",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 5.0,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, size: 30),
            onPressed: () {
              Get.to(() => CartPage());
            },
          ),
          Obx(() => Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 14,
                    child: Text(
                      '${cartController.totalItems}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 8,
              color: Colors.teal.shade50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade900,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      cartController.addToCart(product);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal, // Corrected parameter name
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
