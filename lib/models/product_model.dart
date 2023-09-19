class ProductModel {
  final String id;
  final String title;
  final String price;
  final String category;
  final String description;
  final String image;

  ProductModel(this.id, this.title, this.price, this.category, this.description,
      this.image);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        json['id'].toString(),
        json['title'],
        json['price'].toString(),
        json['category'],
        json['description'],
        json['image']);
  }
}
