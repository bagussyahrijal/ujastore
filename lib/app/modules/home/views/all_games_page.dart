import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'product_detail_view.dart'; // Import ProductDetailView
import '../../../data/models/product_model.dart'; // Import model Product

class AllGamesPage extends StatelessWidget {
  final List<Product> games = [
    Product(
      name: 'Mobile Legends',
      imageUrl:
          'https://i.pinimg.com/474x/5b/a3/d7/5ba3d73b381296e3b90bb963ad309798.jpg',
      diamondOptions: [5, 10, 12, 19, 28, 33],
      diamondPrices: [1400.0, 3000.0, 3500.0, 5500.0, 8000.0, 9500.0],
    ),
    Product(
      name: 'PUBG',
      imageUrl:
          'https://i.pinimg.com/474x/30/45/25/304525cb6ae1696a61c4441f7850aace.jpg',
      diamondOptions: [8, 16, 23],
      diamondPrices: [1666.0, 3666.0, 4666.0],
    ),
    Product(
      name: 'Honor of Kings',
      imageUrl:
          'https://i.pinimg.com/474x/1c/ff/9a/1cff9a1ebb8677d02e5c0d96199b5384.jpg',
      diamondOptions: [5, 10, 12],
      diamondPrices: [1400.0, 3000.0, 3500.0],
    ),
    Product(
      name: 'Growtopia',
      imageUrl:
          'https://i.pinimg.com/474x/51/01/18/510118500a228b8165d78182bbc41fc3.jpg',
      diamondOptions: [5, 10, 12],
      diamondPrices: [1400.0, 3000.0, 3500.0],
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semua Game'),
        backgroundColor:
            Theme.of(context).primaryColor, // Warna dinamis dari tema
      ),
      body: Container(
        color: Theme.of(context)
            .scaffoldBackgroundColor, // Warna latar belakang dari tema
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: games.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 4),
                color: Theme.of(context).cardColor, // Warna kartu dari tema
                child: ListTile(
                  leading: ClipOval(
                    child: Image.network(
                      games[index].imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    games[index].name,
                    style: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.color), // Warna teks dari tema
                  ),
                  onTap: () {
                    Get.to(() => ProductDetailView(product: games[index]));
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
