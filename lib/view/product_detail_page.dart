import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techinfo/controller/product_controller.dart';
import 'package:techinfo/model/product_model.dart';
import 'package:techinfo/util/common.dart';
import 'package:techinfo/util/extensions.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SuperScaffold(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            product.title,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            GetBuilder<ProductController>(builder: (controller) {
              superPrint(product.images.length, title: "Length");
              superPrint(controller.dotPositoin, title: "Pos");
              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      autoPlay: true,
                      height: 250,
                      autoPlayAnimationDuration: const Duration(seconds: 5),
                      onPageChanged: (index, reason) {
                        controller.dotPositoin = index;
                        controller.update();
                      },
                    ),
                    itemCount: product.images.length,
                    itemBuilder: (context, index, realIndex) {
                      return SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl: product.images[index],
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => Center(
                            child: Text("Error".tr),
                          ),
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );
                    },
                  ),
                  DotsIndicator(
                    dotsCount: product.images.length,
                    position: controller.dotPositoin,
                    decorator: const DotsDecorator(
                      color: Colors.black87,
                      activeColor: Colors.redAccent,
                    ),
                  )
                ],
              );
            }),
            10.heightBox(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.description,
                  ),
                  10.heightBox(),
                  Text("Price : ${product.price}"),
                  10.heightBox(),
                  Text("Stock : ${product.stock}"),
                  10.heightBox(),
                  Text("Rating : ${product.rating}"),
                  10.heightBox(),
                  Text("ReturnPolicy : ${product.returnPolicy}"),
                  10.heightBox(),
                  Text("WarrantyInformation : ${product.warrantyInformation}"),
                  10.heightBox(),
                  Text("Brand : ${product.brand}"),
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
