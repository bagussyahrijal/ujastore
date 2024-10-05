import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:ujastore/app/modules/home/views/two_factorial_varification_page.dart';
import '../controllers/profile_controller.dart'; // Pastikan ini benar
import 'package:ujastore/app/modules/home/views/login_view.dart'; // Import halaman login
import 'package:ujastore/app/modules/home/views/signup_view.dart'; // Import halaman signup

class SettingsPage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Isi teks dengan nama pengguna saat ini
    nameController.text = controller.userName.value;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
        backgroundColor: Colors.grey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Ganti Foto Profil
            Obx(() => GestureDetector(
                  onTap: () => _pickImage(controller),
                  child: CircleAvatar(
                    backgroundImage: controller.profileImage != null
                        ? FileImage(controller.profileImage!)
                        : null,
                    radius: 50,
                    child: controller.profileImage == null
                        ? Icon(Icons.camera_alt, size: 50) // Placeholder
                        : null,
                  ),
                )),
            SizedBox(height: 10),

            // Tombol Hapus Foto Profil (hanya muncul jika ada foto)
            Obx(() => controller.profileImage != null
                ? ElevatedButton(
                    onPressed: () {
                      controller.removeProfileImage(); // Hapus foto profil
                    },
                    child: Text('Hapus Foto Profil'),
                  )
                : SizedBox()), // Sembunyikan tombol jika tidak ada foto

            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nama Pengguna',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Update nama pengguna
                controller.setUserName(nameController.text);
                Get.snackbar('Berhasil', 'Nama pengguna telah diperbarui');
              },
              child: Text('Simpan Perubahan'),
            ),
            SizedBox(height: 20),

            // Sakelar untuk mengganti tema
            Obx(() => SwitchListTile(
                  title: Text('Mode Gelap'),
                  value: controller.isDarkMode.value,
                  onChanged: (value) {
                    controller.toggleTheme(value);
                  },
                )),

            SizedBox(height: 20),
            // Navigasi ke halaman login
            ElevatedButton(
              onPressed: () {
                Get.to(() => LoginView());
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            // Navigasi ke halaman signup
            ElevatedButton(
              onPressed: () {
                Get.to(() => SignUpView());
              },
              child: Text('Daftar'),
            ),
            SizedBox(height: 10),
            // Navigasi ke halaman verifikasi dua langkah
            ElevatedButton(
              onPressed: () {
                Get.to(() => TwoFactorVerificationPage());
              },
              child: Text('Verifikasi 2 Langkah'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ProfileController controller) async {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      controller
          .setImagePath(pickedFile.path); // Update path gambar di controller
    }
  }
}
