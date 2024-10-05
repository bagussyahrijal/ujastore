// lib/modules/home/views/top_up_options.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopUpOptions extends StatelessWidget {
  final String gameName;

  const TopUpOptions(
      {super.key, required this.gameName,
      required List<int> diamondOptions,
      required List<double> diamondPrices});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> options;

    // Tentukan opsi top up berdasarkan nama game
    if (gameName == 'Mobile Legends') {
      options = [
        {
          'title': 'Weekly Diamond Pass (Misi Top Up 100)',
          'price': 'Rp 24.666'
        },
        {'title': '5 Diamonds (5 + 0 Bonus)', 'price': 'Rp 1.400'},
        {'title': '10 Diamonds (10 + 0 Bonus)', 'price': 'Rp 3.000'},
        {'title': '12 Diamonds (11 + 1 Bonus)', 'price': 'Rp 3.500'},
        {'title': '19 Diamonds (17 + 2 Bonus)', 'price': 'Rp 5.500'},
        {'title': '28 Diamonds (25 + 3 Bonus)', 'price': 'Rp 8.000'},
        {'title': '33 Diamonds (30 + 3 Bonus)', 'price': 'Rp 9.500'},
        {'title': '44 Diamonds (40 + 4 Bonus)', 'price': 'Rp 11.500'},
        {'title': '59 Diamonds (53 + 6 Bonus)', 'price': 'Rp 15.000'},
        {'title': '71 Diamonds (64 + 7 Bonus)', 'price': 'Rp 18.500'},
        {'title': '85 Diamonds (77 + 8 Bonus)', 'price': 'Rp 21.500'},
        {'title': '97 Diamonds (88 + 9 Bonus)', 'price': 'Rp 25.000'},
      ];
    } else if (gameName == 'PUBG') {
      options = [
        {'title': '8 UC', 'price': 'Rp 1.666'},
        {'title': '16 UC', 'price': 'Rp 3.666'},
        {'title': '23 UC', 'price': 'Rp 4.666'},
        {'title': '80+8 UC', 'price': 'Rp 14.666'},
      ];
    } else {
      options = [];
    }

    return options.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: options.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                child: InkWell(
                  onTap: () {
                    Get.snackbar(
                      'Item Dipilih',
                      'Anda memilih ${options[index]['title']} seharga ${options[index]['price']}',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          options[index]['title']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          options[index]['price']!,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        : const Center(child: Text('Tidak ada opsi top-up untuk game ini'));
  }
}
