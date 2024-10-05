import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart'; // Pastikan path ini benar

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ujastore.id',
      theme: ThemeData(
        brightness: Brightness.light, // Tema terang
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Tema gelap
        primarySwatch: Colors.blueGrey,
      ),
      themeMode: ThemeMode.system, // Ini akan mengikuti pengaturan sistem
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
