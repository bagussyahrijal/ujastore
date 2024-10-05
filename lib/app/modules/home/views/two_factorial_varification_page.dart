import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TwoFactorVerificationPage extends StatelessWidget {
  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verifikasi 2 Langkah'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: codeController,
              decoration:
                  InputDecoration(labelText: 'Masukkan Kode Verifikasi'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logika verifikasi kode
                // Simulasi verifikasi berhasil
                Get.snackbar('Sukses', 'Verifikasi berhasil!');
                Get.back(); // Kembali ke halaman profil atau pengaturan
              },
              child: Text('Verifikasi'),
            ),
          ],
        ),
      ),
    );
  }
}
