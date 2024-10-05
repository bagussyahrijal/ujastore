import 'package:get/get.dart';
import 'package:ujastore/app/data/models/product_model.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/product_detail_view.dart';
import 'app_routes.dart'; // Pastikan import app_routes.dart

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME, // Gunakan Routes.HOME
      page: () => HomeView(),
    ),
    GetPage(
        name: Routes.PRODUCT_DETAIL, // Gunakan Routes.PRODUCT_DETAIL
        page: () {
          // Mengambil argumen product dari rute
          final product = Get.arguments as Product; // Cast argumen ke Product
          return ProductDetailView(product: product);
        })
  ];
}
