import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

class ProfileController extends GetxController {
  var imagePath = ''.obs;
  var balance = 0.obs; // Variabel saldo
  var userName = 'Bagus Syahrijal'.obs; // Variabel untuk nama pengguna
  var isLoggedIn = false.obs; // Variabel untuk status login
  var isDarkMode = false.obs; // Variabel untuk mode tema

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
    if (email.isNotEmpty && password.isNotEmpty) {
      Get.snackbar('Daftar', 'Pendaftaran berhasil untuk $email');
    } else {
      Get.snackbar('Daftar', 'Email dan password tidak boleh kosong');
    }
  }

  // Fungsi untuk verifikasi dua langkah
  void verifyTwoFactor(String code) {
    if (code == '123456') {
      Get.snackbar('Verifikasi', 'Verifikasi berhasil');
    } else {
      Get.snackbar('Verifikasi', 'Kode verifikasi salah');
    }
  }

  // Fungsi untuk menghapus foto profil
  void removeProfileImage() {
    imagePath.value = ''; // Reset gambar profil
  }

  // Fungsi untuk mengganti tema
  void toggleTheme(bool isDark) {
    isDarkMode.value = isDark; // Set nilai mode tema
    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light); // Ubah tema
  }
}
