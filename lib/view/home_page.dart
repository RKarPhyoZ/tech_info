import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techinfo/controller/product_controller.dart';
import 'package:techinfo/model/category_model.dart';
import 'package:techinfo/util/common.dart';
import 'package:techinfo/util/extensions.dart';
import 'package:techinfo/view/product_list_page.dart';
import 'package:techinfo/view/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    ProductController product = Get.find();
    product.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home".tr),
          centerTitle: true,
        ),
        drawer: const CustomDrawer(),
        body: GetBuilder<ProductController>(builder: (controller) {
          return Padding(
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
                Expanded(
                  child: controller.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : RefreshIndicator(
                          onRefresh: () async {
                            controller.getCategories();
                          },
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: controller.categories.length,
                            itemBuilder: (context, index) =>
                                category(controller.categories[index].name),
                            separatorBuilder: (context, index) =>
                                20.heightBox(),
                          ),
                        ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget category(String name) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductListPage(name: name));
      },
      child: Container(
        width: double.infinity,
        height: 55,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(name),
      ),
    );
  }
}
