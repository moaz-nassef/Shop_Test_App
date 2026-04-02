class Product_model {
  final String id;
  final String title;
  final String description;
  final String category;
  final String image;
  final double price;
  final Rating_model rating;
  Product_model({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.price,
    required this.rating,
  });

  factory Product_model.fromJson(Map<String, dynamic> jsonData) {
    final dynamic ratingField = jsonData['rating'];
    final double ratingValue;
    final int ratingCount;

    if (ratingField is num) {
      ratingValue = ratingField.toDouble();
      ratingCount =
          jsonData['stock'] != null ? (jsonData['stock'] as num).toInt() : 0;
    } else if (ratingField is Map<String, dynamic>) {
      ratingValue = (ratingField['rate'] as num?)?.toDouble() ?? 0.0;
      ratingCount =
          (ratingField['count'] as num?)?.toInt() ??
          (jsonData['stock'] != null ? (jsonData['stock'] as num).toInt() : 0);
    } else {
      ratingValue = 0.0;
      ratingCount =
          jsonData['stock'] != null ? (jsonData['stock'] as num).toInt() : 0;
    }

    final imageUrl =
        jsonData['thumbnail'] ??
        (jsonData['images'] is List && jsonData['images'].isNotEmpty
            ? jsonData['images'][0]
            : jsonData['image']);

    return Product_model(
      id: jsonData['id'].toString(),
      title: jsonData['title'] ?? '',
      description: jsonData['description'] ?? '',
      category: jsonData['category'] ?? '',
      image: imageUrl?.toString() ?? '',
      price: (jsonData['price'] as num?)?.toDouble() ?? 0.0,
      rating: Rating_model(rate: ratingValue, count: ratingCount),
    );
  }
}

class Rating_model {
  final double rate;
  final int count;

  Rating_model({required this.rate, required this.count});

  factory Rating_model.fromJson(Map<String, dynamic> jsonData) {
    return Rating_model(
      rate: (jsonData['rate'] as num).toDouble(),
      count: jsonData['count'],
    );
  }
}
