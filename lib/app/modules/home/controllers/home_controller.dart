import 'package:get/get.dart';
import '../../../data/models/product_model.dart';

class HomeController extends GetxController {
  // List produk sebagai contoh
  var products = <Product>[
    Product(
      name: 'Mobile Legends',
      imageUrl:
          'https://i.pinimg.com/474x/5b/a3/d7/5ba3d73b381296e3b90bb963ad309798.jpg',
      diamondOptions: [100, 200, 500],
      diamondPrices: [1000.0, 2000.0, 5000.0],
    ),
    Product(
      name: 'PUBG',
      imageUrl:
          'https://i.pinimg.com/474x/30/45/25/304525cb6ae1696a61c4441f7850aace.jpg',
      diamondOptions: [100, 200, 500],
      diamondPrices: [1000.0, 2000.0, 5000.0],
    ),
    Product(
      name: 'Honor of Kings',
      imageUrl:
          'https://i.pinimg.com/474x/1c/ff/9a/1cff9a1ebb8677d02e5c0d96199b5384.jpg',
      diamondOptions: [100, 200, 500],
      diamondPrices: [1000.0, 2000.0, 5000.0],
    ),
    Product(
      name: 'Growtopia',
      imageUrl:
          'https://i.pinimg.com/474x/51/01/18/510118500a228b8165d78182bbc41fc3.jpg',
      diamondOptions: [100, 200, 500],
      diamondPrices: [1000.0, 2000.0, 5000.0],
    ),
    Product(
      name: 'Free Fire',
      imageUrl:
          'https://i.pinimg.com/474x/30/1a/c5/301ac5586bad7635b3ecfd7e6ab6a934.jpg',
      diamondOptions: [100, 200, 500],
      diamondPrices: [1000.0, 2000.0, 5000.0],
    ),
    Product(
      name: 'LOL: Wild Rift',
      imageUrl:
          'https://i.pinimg.com/474x/ea/ec/84/eaec84340629280f8675f0e7e57dea65.jpg',
      diamondOptions: [100, 200, 500],
      diamondPrices: [1000.0, 2000.0, 5000.0],
    ),
    Product(
      name: 'Valorant',
      imageUrl:
          'https://i.pinimg.com/474x/2a/c5/9f/2ac59fa5a3722e2cd8ddf9c430120016.jpg',
      diamondOptions: [100, 200, 500],
      diamondPrices: [1000.0, 2000.0, 5000.0],
    ),
    Product(
      name: 'Genshin Impact',
      imageUrl:
          'https://i.pinimg.com/736x/dd/d6/7a/ddd67a00297de983b9c275294f4e66b6.jpg',
      diamondOptions: [100, 200, 500],
      diamondPrices: [1000.0, 2000.0, 5000.0],
    ),
    Product(
      name: 'Steam',
      imageUrl:
          'https://i.pinimg.com/474x/10/94/40/10944047f47b58bc7175be92ff79b885.jpg',
      diamondOptions: [100, 200, 500],
      diamondPrices: [1000.0, 2000.0, 5000.0],
    ),
  ].obs;

  // Anda bisa menambahkan metode tambahan di sini jika diperlukan
}
