class Product {
  final String name;
  final String imageUrl;
  final String description;
  final List<int> diamondOptions; // Opsi diamond
  final List<double> diamondPrices; // Harga diamond dalam rupiah

  Product({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.diamondOptions,
    required this.diamondPrices,
  });
}
