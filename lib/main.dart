import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'product_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Cart with GetX',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: ProductListPage(),
    );
  }
}
