import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techinfo/controller/product_controller.dart';
import 'package:techinfo/service/local_storage_service.dart';
import 'package:techinfo/view/home_page.dart';

import 'util/app_localization.dart';

void main() {
  Get.put(ProductController());
  LocalStorageServices.initLocalStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tech Info',
      fallbackLocale: const Locale('en', 'US'),
      translationsKeys: AppLocalization.translationsKeys,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey.withOpacity(0.1),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
      ),
      home: const HomePage(),
    );
  }
}
