import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../routes/app_routes.dart'; // Pastikan rute diimpor

class GameListView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Game'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final product = controller.products[index];
            return ListTile(
              leading: Image.network(product.imageUrl),
              title: Text(product.name),
              onTap: () {
                // Navigasi ke halaman detail produk dengan membawa data produk
                Get.toNamed(Routes.PRODUCT_DETAIL, arguments: product);
              },
            );
          },
        );
      }),
    );
  }
}
