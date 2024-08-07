import 'package:get/get.dart';
import 'package:techinfo/model/category_model.dart';
import 'package:techinfo/model/product_model.dart';
import 'package:techinfo/service/api_services.dart';
import 'package:techinfo/util/common.dart';

class ProductController extends GetxController {
  List<CategoryModel> categories = [];
  bool isLoading = false;

  List<ProductModel> products = [];
  bool isLoadingProduct = false;
  int dotPositoin = 0;
  getCategories() async {
    try {
      isLoading = true;
      update();
      await ApiServices().request(
        method: "GET",
        endPoint: ApiEndPoints.categories,
        onSuccess: (data) {
          for (var category in data) {
            categories.add(CategoryModel.fromJson(category));
            update();
          }
        },
        onFailure: (error) {
          Utils.errorAlert(error.toString());
        },
      );
    } catch (e) {
      superPrint(e);
    }
    isLoading = false;
    update();
  }

  getProducts(String name) async {
    try {
      isLoadingProduct = true;
      products.clear();
      update();
      await ApiServices().request(
        method: "GET",
        endPoint: "${ApiEndPoints.category}/$name",
        onSuccess: (data) {
          Iterable itr = data["products"];
          for (var product in itr) {
            products.add(ProductModel.fromJson(product));
            update();
          }
        },
        onFailure: (error) {
          Utils.errorAlert(error.toString());
        },
      );
    } catch (e) {
      superPrint(e);
    }
    isLoadingProduct = false;
    update();
  }
}
