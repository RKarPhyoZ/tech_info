import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techinfo/controller/product_controller.dart';
import 'package:techinfo/model/product_model.dart';
import 'package:techinfo/util/common.dart';
import 'package:techinfo/util/extensions.dart';
import 'package:techinfo/view/product_detail_page.dart';

class ProductListPage extends StatefulWidget {
  final String name;
  const ProductListPage({super.key, required this.name});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  void initState() {
    super.initState();
    getProductList();
  }

  getProductList() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ProductController product = Get.find();
      product.getProducts(widget.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GetBuilder<ProductController>(
            builder: (controller) {
              if (controller.isLoadingProduct) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (controller.products.isEmpty) {
                return Center(
                  child: Text("No Data".tr),
                );
              }
              return RefreshIndicator(
                onRefresh: () async {
                  getProductList();
                },
                child: ListView.separated(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return product(controller.products[index]);
                  },
                  separatorBuilder: (context, index) => 20.heightBox(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget product(ProductModel product) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailPage(product: product));
      },
      child: Container(
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                ),
                child: CachedNetworkImage(
                  imageUrl: product.thumbnail,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Center(
                    child: Text("Error".tr),
                  ),
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
            20.widthBox(),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.heightBox(),
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  5.heightBox(),
                  Text(
                    product.description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  10.heightBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
