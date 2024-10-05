import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import 'settings_page.dart'; // Tambahkan import ke SettingsPage

class ProfilePage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

   ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(13, 30, 43, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                child: Column(
                  children: [
                    Obx(() => ListTile(
                          leading: GestureDetector(
                            child: CircleAvatar(
                              backgroundImage: controller.profileImage != null
                                  ? FileImage(controller.profileImage!)
                                  : null,
                              backgroundColor: const Color.fromRGBO(13, 30, 43, 1),
                              child: controller.profileImage == null
                                  ? const Text('BS') // Placeholder
                                  : null,
                            ),
                          ),
                          title: Obx(() => Text(controller.userName.value)),
                          subtitle: const Text('Non Membership'),
                        )),

                    // Tambah tombol ke SettingsPage
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Pengaturan'),
                      onTap: () {
                        Get.to(() =>
                            SettingsPage()); // Navigasi ke halaman Settings
                      },
                    ),
                  ],
                ),
              ),
            ),
            // Bagian saldo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Saldo IDR', style: TextStyle(fontSize: 18)),
                            const SizedBox(height: 8),
                            Obx(() => Text(
                                  'Rp ${controller.balance.value},-',
                                  style: const TextStyle(
                                      fontSize: 24, color: Colors.orange),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Bagian pesanan
            Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Pesanan Saya', style: TextStyle(fontSize: 18)),
                      const SizedBox(height: 16),
                      _buildOrderItem('Belum Bayar', 0),
                      _buildOrderItem('Pending', 0),
                      _buildOrderItem('Success', 0),
                      _buildOrderItem('Expired', 0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderItem(String label, int count) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(count.toString()),
        ],
      ),
    );
  }
}
