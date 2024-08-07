import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techinfo/util/common.dart';
import 'package:techinfo/util/extensions.dart';
import 'package:techinfo/view/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          centerTitle: true,
        ),
        drawer: const CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Categories".tr,
                style: const TextStyle(fontSize: 24),
              ),
              10.heightBox(),
              Divider(
                color: Colors.black.withOpacity(0.5),
              ),
              30.heightBox(),
              category("Smartphones".tr),
              20.heightBox(),
              category("Laptops".tr),
            ],
          ),
        ),
      ),
    );
  }

  Widget category(String text) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(text),
      ),
    );
  }
}
