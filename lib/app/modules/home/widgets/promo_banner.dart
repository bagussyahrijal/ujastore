import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  final String text; // Parameter untuk teks banner

  const PromoBanner({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // Mendapatkan lebar layar
    double bannerWidth = screenWidth * 0.9; // Menghitung 90% dari lebar layar

    return Container(
      alignment: Alignment.center,
      width: bannerWidth, // Mengatur lebar sesuai perhitungan
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue, // Ganti dengan warna atau gambar sesuai kebutuhan
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
