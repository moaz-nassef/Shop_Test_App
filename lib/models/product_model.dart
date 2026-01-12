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
    return Product_model(
      id: jsonData['id'].toString(),
      title: jsonData['title'],
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      price: (jsonData['price'] as num).toDouble(),
      rating: Rating_model.fromJson(jsonData['rating']),
    );
  }
}



class Rating_model {
  final double rate;
  final int count;

  Rating_model({
    required this.rate,
    required this.count,
  });

  factory Rating_model.fromJson(Map<String, dynamic> jsonData) {
    return Rating_model(
      rate: (jsonData['rate'] as num).toDouble(),
      count: jsonData['count'],
    );
  }
}




