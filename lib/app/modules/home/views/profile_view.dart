import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import 'settings_page.dart'; // Tambahkan import ke SettingsPage

class ProfilePage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor, // Warna latar belakang
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Card(
                color: Theme.of(context).cardColor, // Warna kartu
                child: Column(
                  children: [
                    Obx(() => ListTile(
                          leading: GestureDetector(
                            child: CircleAvatar(
                              backgroundImage: controller.profileImage != null
                                  ? FileImage(controller.profileImage!)
                                  : null,
                              child: controller.profileImage == null
                                  ? Text('BS',
                                      style: TextStyle(
                                          color: Colors.white)) // Placeholder
                                  : null,
                              backgroundColor: Theme.of(context)
                                  .primaryColor, // Warna latar belakang avatar
                            ),
                          ),
                          title: Obx(() => Text(controller.userName.value,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.color))), // Menggunakan bodyLarge
                          subtitle: Text('Non Membership',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.color)), // Menggunakan bodyLarge
                        )),

                    // Tambah tombol ke SettingsPage
                    ListTile(
                      leading: Icon(Icons.settings,
                          color:
                              Theme.of(context).iconTheme.color), // Warna ikon
                      title: Text('Pengaturan',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.color)), // Menggunakan bodyLarge
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
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                color: Theme.of(context).cardColor, // Warna kartu
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Saldo IDR',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color)), // Menggunakan bodyLarge
                            SizedBox(height: 8),
                            Obx(() => Text(
                                  'Rp ${controller.balance.value},-',
                                  style: TextStyle(
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
              padding: EdgeInsets.all(16),
              child: Card(
                color: Theme.of(context).cardColor, // Warna kartu
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pesanan Saya',
                          style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.color)), // Menggunakan bodyLarge
                      SizedBox(height: 16),
                      _buildOrderItem('Belum Bayar', 0, context),
                      _buildOrderItem('Pending', 0, context),
                      _buildOrderItem('Success', 0, context),
                      _buildOrderItem('Expired', 0, context),
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

  Widget _buildOrderItem(String label, int count, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.color)), // Menggunakan bodyLarge
          Text(count.toString(),
              style: TextStyle(
                  color: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.color)), // Menggunakan bodyLarge
        ],
      ),
    );
  }
}
