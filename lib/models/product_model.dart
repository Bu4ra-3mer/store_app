class ProductModel {
  final dynamic id;
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;
  final RatingModel rating;

  ProductModel({
    required this.category,
    required this.description,
    required this.id,
    required this.image,
    required this.price,
    required this.title,
    required this.rating,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      rating: RatingModel.fromJson(json['rating']),
      description: json['description'],
      id:json['id'],
      category: json['category'],
      image: json['image'],
      price: json['price'],
      title: json['title'],
    );
  }
}

class RatingModel {
  final double rate;
  final int count;
  RatingModel({required this.count, required this.rate});
  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(count: json['count'], rate: json['rate']);
  }
}
