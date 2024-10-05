import 'package:get/get.dart';
import 'dart:io';

class ProfileController extends GetxController {
  var imagePath = ''.obs;
  var balance = 0.obs; // Variabel saldo
  var userName = 'Bagus Syahrijal'.obs; // Variabel untuk nama pengguna
  var isLoggedIn = false.obs; // Variabel untuk status login

  // Set path gambar
  void setImagePath(String path) {
    imagePath.value = path;
  }

  // Dapatkan gambar profil dari path
  File? get profileImage =>
      imagePath.value.isNotEmpty ? File(imagePath.value) : null;

  // Set nama pengguna
  void setUserName(String name) {
    userName.value = name;
  }

  // Fungsi untuk login
  void login(String email, String password) {
    // Implementasi logika login
    if (email.isNotEmpty && password.isNotEmpty) {
      userName.value = email; // Atur nama pengguna
      isLoggedIn.value = true; // Ubah status login
      Get.snackbar('Login', 'Login berhasil untuk $email');
    } else {
      Get.snackbar('Login', 'Email dan password tidak boleh kosong');
    }
  }

  // Fungsi untuk signup
  void signUp(String email, String password) {
    // Implementasi logika signup
    if (email.isNotEmpty && password.isNotEmpty) {
      Get.snackbar('Daftar', 'Pendaftaran berhasil untuk $email');
    } else {
      Get.snackbar('Daftar', 'Email dan password tidak boleh kosong');
    }
  }

  // Fungsi untuk verifikasi dua langkah
  void verifyTwoFactor(String code) {
    // Implementasi logika verifikasi
    if (code == '123456') {
      // Misalkan kode verifikasi
      Get.snackbar('Verifikasi', 'Verifikasi berhasil');
    } else {
      Get.snackbar('Verifikasi', 'Kode verifikasi salah');
    }
  }
}
