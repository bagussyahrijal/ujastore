import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:ujastore/app/modules/home/views/two_factorial_varification_page.dart';
import '../controllers/profile_controller.dart'; // Pastikan ini benar
import 'package:ujastore/app/modules/home/views/login_view.dart'; // Import halaman login
import 'package:ujastore/app/modules/home/views/signup_view.dart'; // Import halaman signup
// Import halaman verifikasi dua langkah

class SettingsPage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());
  final TextEditingController nameController = TextEditingController();

  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Isi teks dengan nama pengguna saat ini
    nameController.text = controller.userName.value;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
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
                        ? const Icon(Icons.camera_alt, size: 50) // Placeholder
                        : null,
                  ),
                )),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Nama Pengguna',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Update nama pengguna
                controller.setUserName(nameController.text);
                Get.snackbar('Berhasil', 'Nama pengguna telah diperbarui');
              },
              child: const Text('Simpan Perubahan'),
            ),
            const SizedBox(height: 20),
            // Navigasi ke halaman login
            ElevatedButton(
              onPressed: () {
                Get.to(() => LoginView());
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            // Navigasi ke halaman signup
            ElevatedButton(
              onPressed: () {
                Get.to(() => SignUpView());
              },
              child: const Text('Daftar'),
            ),
            const SizedBox(height: 10),
            // Navigasi ke halaman verifikasi dua langkah
            ElevatedButton(
              onPressed: () {
                Get.to(() => TwoFactorVerificationPage());
              },
              child: const Text('Verifikasi 2 Langkah'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ProfileController controller) async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      controller
          .setImagePath(pickedFile.path); // Update path gambar di controller
    }
  }
}
