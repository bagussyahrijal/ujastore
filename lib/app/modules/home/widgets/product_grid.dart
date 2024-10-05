import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart'; // Pastikan Routes diimpor
import '../controllers/home_controller.dart';

class ProductGrid extends StatelessWidget {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // Tambahkan ini
      physics: NeverScrollableScrollPhysics(), // Nonaktifkan scrolling GridView
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
      ),
      itemCount: controller.products.length,
      itemBuilder: (context, index) {
        final product = controller.products[index];
        return GestureDetector(
          onTap: () {
            // Navigasi ke halaman detail produk dengan membawa data produk
            Get.toNamed(Routes.PRODUCT_DETAIL, arguments: product);
          },
          child: Container(
            width: (Get.width / 3) - 15,
            height: ((Get.width / 3) - 15) * 1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(product.imageUrl),
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.black54, // Warna latar belakang untuk kontras
                  child: Column(
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      // Bagian harga dihapus
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
