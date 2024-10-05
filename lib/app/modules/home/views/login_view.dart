import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ujastore/app/modules/home/controllers/profile_controller.dart';
import 'package:ujastore/app/modules/home/views/signup_view.dart';
import 'package:ujastore/app/modules/home/views/two_factorial_varification_page.dart';

class LoginView extends StatelessWidget {
  final ProfileController profileController = Get.find<ProfileController>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logika login
                _login(emailController.text, passwordController.text);
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => SignUpView()); // Arahkan ke halaman signup
              },
              child: const Text('Belum punya akun? Daftar'),
            ),
          ],
        ),
      ),
    );
  }

  void _login(String email, String password) {
    // Cek jika email dan password tidak kosong
    if (email.isNotEmpty && password.isNotEmpty) {
      profileController.isLoggedIn.value = true; // Set status login
      Get.snackbar('Login', 'Login berhasil untuk $email');
      Get.to(() =>
          TwoFactorVerificationPage()); // Navigasi ke halaman verifikasi 2 langkah
    } else {
      Get.snackbar('Login', 'Email dan Password tidak boleh kosong');
    }
  }
}
