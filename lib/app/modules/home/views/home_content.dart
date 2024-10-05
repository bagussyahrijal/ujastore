import 'package:flutter/material.dart';
import 'package:ujastore/app/modules/home/widgets/promo_banner.dart';
import '../widgets/product_grid.dart';

// Widget untuk halaman Home (termasuk PromoBanner dan ProductGrid)
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Tambahkan SingleChildScrollView di sini
      child: Padding(
        padding: const EdgeInsets.all(0.5),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const PromoBanner(
                text: 'Ini Nanti Container Buat Diskon Atau Event'),
            const PromoBanner(text: 'Ini Juga Sama'),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'List Game',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Grid produk
            ProductGrid(), // Hapus Expanded di sini
          ],
        ),
      ),
    );
  }
}
