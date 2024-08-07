import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techinfo/controller/product_controller.dart';
import 'package:techinfo/view/home_page.dart';

void main() {
  Get.put(ProductController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tech Info',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
