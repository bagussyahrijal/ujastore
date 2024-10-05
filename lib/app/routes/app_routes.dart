import 'package:get/get.dart';
import 'package:ujastore/app/data/models/product_model.dart';
import 'package:ujastore/app/modules/home/views/two_factorial_varification_page.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/product_detail_view.dart';
import '../modules/home/views/login_view.dart'; // Halaman login
import '../modules/home/views/signup_view.dart'; // Halaman signup
// Halaman verifikasi 2 langkah
import '../modules/home/views/settings_page.dart'; // Halaman pengaturan
// Halaman top up game

abstract class Routes {
  static const HOME = _Paths.HOME; // Rute untuk halaman utama
  static const TOP_UP_GAME =
      _Paths.TOP_UP_GAME; // Rute untuk halaman top up game
  static const PRODUCT_DETAIL =
      _Paths.PRODUCT_DETAIL; // Rute untuk halaman detail produk
  static const LOGIN = _Paths.LOGIN; // Rute untuk login
  static const SIGNUP = _Paths.SIGNUP; // Rute untuk signup
  static const TWO_FACTOR_VERIFICATION =
      _Paths.TWO_FACTOR_VERIFICATION; // Rute untuk verifikasi 2 langkah
  static const SETTINGS = _Paths.SETTINGS; // Rute untuk pengaturan
}

abstract class _Paths {
  static const HOME = '/home'; // Jalur untuk halaman utama
  static const TOP_UP_GAME = '/top-up-game'; // Jalur untuk halaman top up game
  static const PRODUCT_DETAIL =
      '/product-detail'; // Jalur untuk halaman detail produk
  static const LOGIN = '/login'; // Path untuk login
  static const SIGNUP = '/signup'; // Path untuk signup
  static const TWO_FACTOR_VERIFICATION =
      '/2fa'; // Path untuk verifikasi 2 langkah
  static const SETTINGS = '/settings'; // Path untuk pengaturan
}

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME, // Gunakan Routes.HOME
      page: () => const HomeView(),
    ),
    GetPage(
      name: Routes.PRODUCT_DETAIL, // Gunakan Routes.PRODUCT_DETAIL
      page: () {
        // Mengambil argumen product dari rute
        final product = Get.arguments as Product; // Cast argumen ke Product
        return ProductDetailView(product: product);
      },
    ),
    GetPage(
      name: Routes.LOGIN, // Gunakan Routes.LOGIN
      page: () => LoginView(),
    ),
    GetPage(
      name: Routes.SIGNUP, // Gunakan Routes.SIGNUP
      page: () => SignUpView(),
    ),
    GetPage(
      name: Routes
          .TWO_FACTOR_VERIFICATION, // Gunakan Routes.TWO_FACTOR_VERIFICATION
      page: () => TwoFactorVerificationPage(),
    ),
    GetPage(
      name: Routes.SETTINGS, // Gunakan Routes.SETTINGS
      page: () => SettingsPage(),
    ),
    GetPage(
      name: Routes.TOP_UP_GAME, // Gunakan Routes.TOP_UP_GAME
      page: () => TopUpGameView(), // Halaman untuk top up game
    ),
  ];
}

TopUpGameView() {}
