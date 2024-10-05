class Product {
  final String name;
  final String imageUrl;
  final List<int> diamondOptions; // Pilihan diamond
  final List<double> diamondPrices; // Harga diamond dalam rupiah

  Product({
    required this.name,
    required this.imageUrl,
    required this.diamondOptions,
    required this.diamondPrices,
  });
}
