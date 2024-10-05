// lib/modules/home/views/product_detail_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/product_model.dart'; // Import model Product

class ProductDetailView extends StatelessWidget {
  final Product product; // Menggunakan Product

  // Constructor untuk menerima data produk
  ProductDetailView({super.key, required this.product});

  final TextEditingController userIdController = TextEditingController();
  final TextEditingController serverIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name), // Menggunakan nama produk
        backgroundColor: const Color.fromARGB(255, 16, 16, 16),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(product.imageUrl), // Menggunakan gambar produk
              const SizedBox(height: 20),
              Text(
                product.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text('Pilih Top Up:', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              _buildTopUpOptions(product.name),
              // Input fields for user ID and server ID based on the game name
              if (product.name == 'Mobile Legends') ...[
                const SizedBox(height: 20),
                const Text('ID User:', style: TextStyle(fontSize: 16)),
                TextField(
                  controller: userIdController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan ID User Anda',
                  ),
                ),
                const SizedBox(height: 10),
                const Text('ID Server:', style: TextStyle(fontSize: 16)),
                TextField(
                  controller: serverIdController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan ID Server Anda',
                  ),
                ),
              ],
              if (product.name == 'PUBG') ...[
                const SizedBox(height: 20),
                const Text('ID User:', style: TextStyle(fontSize: 16)),
                TextField(
                  controller: userIdController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan ID User Anda',
                  ),
                ),
              ],
              if (product.name == 'Honor of Kings') ...[
                const SizedBox(height: 20),
                const Text('ID User:', style: TextStyle(fontSize: 16)),
                TextField(
                  controller: userIdController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan ID User Anda',
                  ),
                ),
              ],
              if (product.name == 'Growtopia') ...[
                const SizedBox(height: 20),
                const Text('GrowID:', style: TextStyle(fontSize: 16)),
                TextField(
                  controller: userIdController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan GrowID Anda',
                  ),
                ),
              ],
              if (product.name == 'Free Fire') ...[
                const SizedBox(height: 20),
                const Text('ID User:', style: TextStyle(fontSize: 16)),
                TextField(
                  controller: userIdController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan ID User Anda',
                  ),
                ),
              ],
              if (product.name == 'LOL: Wild Rift') ...[
                const SizedBox(height: 20),
                const Text('ID User:', style: TextStyle(fontSize: 16)),
                TextField(
                  controller: userIdController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan ID User Anda',
                  ),
                ),
              ],
              if (product.name == 'Valorant') ...[
                const SizedBox(height: 20),
                const Text('ID User:', style: TextStyle(fontSize: 16)),
                TextField(
                  controller: userIdController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan ID User Anda',
                  ),
                ),
              ],
              if (product.name == 'Genshin Impact') ...[
                const SizedBox(height: 20),
                const Text('ID User:', style: TextStyle(fontSize: 16)),
                TextField(
                  controller: userIdController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan ID User Anda',
                  ),
                ),
              ],

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Validasi input sebelum melanjutkan
                  if (userIdController.text.isEmpty ||
                      (product.name == 'Mobile Legends' &&
                          serverIdController.text.isEmpty)) {
                    Get.snackbar(
                      'Error',
                      'ID User dan ID Server harus diisi',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  } else {
                    Get.snackbar(
                      'Berhasil',
                      'Diamond berhasil dipilih untuk User ID: ${userIdController.text}',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
                child: const Text('Konfirmasi Pembelian'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopUpOptions(String gameName) {
    List<Map<String, String>> options;

    // Tentukan opsi top up berdasarkan nama game
    if (gameName == 'Mobile Legends') {
      options = [
        {'title': '5 Diamonds', 'price': 'Rp 1.400'},
        {'title': '10 Diamonds', 'price': 'Rp 3.000'},
        {'title': '12 Diamonds', 'price': 'Rp 3.500'},
        {'title': '19 Diamonds', 'price': 'Rp 5.500'},
        {'title': '28 Diamonds', 'price': 'Rp 8.000'},
        {'title': '33 Diamonds', 'price': 'Rp 9.500'},
      ];
    } else if (gameName == 'PUBG') {
      options = [
        {'title': '60 UC', 'price': 'Rp 14.000'},
        {'title': '120 UC', 'price': 'Rp 28.000'},
        {'title': '325 UC', 'price': 'Rp 71.000'},
        {'title': '660 UC', 'price': 'Rp 142.500'},
        {'title': '1320 UC', 'price': 'Rp 285.000'},
        {'title': '1800 UC', 'price': 'Rp 356.000'},
      ];
    } else if (gameName == 'Honor of Kings') {
      options = [
        {'title': '8 Tokens', 'price': 'Rp 1.666'},
        {'title': '16 Tokens', 'price': 'Rp 3.666'},
        {'title': '23 Tokens', 'price': 'Rp 4.666'},
        {'title': '80+8 Tokens', 'price': 'Rp 14.666'},
        {'title': '240+17 Tokens', 'price': 'Rp 41.666'},
        {'title': '400+32 Tokens', 'price': 'Rp 131.666'},
      ];
    } else if (gameName == 'Growtopia') {
      options = [
        {'title': '5 DL', 'price': 'Rp 19.500'},
        {'title': '10 DL', 'price': 'Rp 39.000'},
        {'title': '20 DL', 'price': 'Rp 78.000'},
        {'title': '25 DL', 'price': 'Rp 97.500'},
        {'title': '30 DL', 'price': 'Rp 117.000'},
        {'title': '50 DL', 'price': 'Rp 195.000'},
      ];
    } else if (gameName == 'Free Fire') {
      options = [
        {'title': '12 Diamonds', 'price': 'Rp 2.000'},
        {'title': '50 Diamonds', 'price': 'Rp 8.000'},
        {'title': '70 Diamonds', 'price': 'Rp 10.000'},
        {'title': '100 Diamonds', 'price': 'Rp 15.000'},
        {'title': '140 Diamonds', 'price': 'Rp 19.000'},
        {'title': '355 Diamonds', 'price': 'Rp 47.000'},
      ];
    } else if (gameName == 'LOL: Wild Rift') {
      options = [
        {'title': '425 Wild Cores', 'price': 'Rp 60.000'},
        {'title': '1000 Wild Cores', 'price': 'Rp 125.000'},
        {'title': '1850 Wild Cores', 'price': 'Rp 220.000'},
        {'title': '3275 Wild Cores', 'price': 'Rp 375.000'},
        {'title': '4800 Wild Cores', 'price': 'Rp 535.000'},
        {'title': '6210 Wild Cores', 'price': 'Rp 750.000'},
      ];
    } else if (gameName == 'Valorant') {
      options = [
        {'title': '475 Points', 'price': 'Rp 55.000'},
        {'title': '950 Points', 'price': 'Rp 105.000'},
        {'title': '1475 Points', 'price': 'Rp 160.000'},
        {'title': '2050 Points', 'price': 'Rp 210.000'},
        {'title': '2525 Points', 'price': 'Rp 260.000'},
        {'title': '3050 Points', 'price': 'Rp 310.000'},
      ];
    } else if (gameName == 'Genshin Impact') {
      options = [
        {'title': 'Blessing of the Welkin Moon', 'price': 'Rp 60.000'},
        {'title': '60 Genesis Crystals', 'price': 'Rp 12.000'},
        {'title': '330 Genesis Crystals', 'price': 'Rp 64.000'},
        {'title': '1090 Genesis Crystals', 'price': 'Rp 192.000'},
        {'title': '3880 Genesis Crystals', 'price': 'Rp 640.000'},
        {'title': '8080 Genesis Crystals', 'price': 'Rp 1.280.000'},
      ];
    } else if (gameName == 'Steam') {
      options = [
        {'title': 'IDR 12.000 Wallet Code', 'price': 'Rp 12.960'},
        {'title': 'IDR 45.000 Wallet Code', 'price': 'Rp 48.600'},
        {'title': 'IDR 60.000 Wallet Code', 'price': 'Rp 64.800'},
        {'title': 'IDR 90.000 Wallet Code', 'price': 'Rp 97.200'},
        {'title': 'IDR 120.000 Wallet Code', 'price': 'Rp 129.600'},
        {'title': 'IDR 250.000 Wallet Code', 'price': 'Rp 270.000'},
      ];
    } else {
      options = [];
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: options.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: InkWell(
            onTap: () {
              Get.snackbar(
                'Item Dipilih',
                'Anda memilih ${options[index]['title']} seharga ${options[index]['price']}',
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    options[index]['title']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    options[index]['price']!,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
