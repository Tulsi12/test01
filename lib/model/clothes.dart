class Clothes {
  int id;
  String title;
  String subtitle;
  String price;
  String imageUrl;
  List<String> detailUrl;

  Clothes(this.id, this.title, this.subtitle, this.price, this.imageUrl,
      this.detailUrl);

  static List<Clothes> generateClothes() {
    return [
      Clothes(
          1,
          "Gucci oversize",
          "Hoodie",
          "\$79.99",
          'assets/images/arrival.jpg',
          ['assets/images/arrival.jpg', 'assets/images/detail2.jpg']),
      Clothes(
          2,
          "Man Coat",
          "Rain-Jacket",
          "\$39.99",
          'assets/images/arrival2.jpg',
          ['assets/images/arrival2.jpg', 'assets/images/detail3.jpg'])
    ];
  }
}
