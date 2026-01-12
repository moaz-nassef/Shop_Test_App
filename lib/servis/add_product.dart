import 'package:project1/hellpe/aip.dart';
import 'package:project1/models/product_model.dart';

class AddProduct {
  Future<Product_model> addNewProduct({required String title, required String price, required String description, required String image, required String category}) async{

    final response = await Aip().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category
      },
      token: null,
    );

    if (response != null) {
      return Product_model.fromJson(response);
    } else {
      throw Exception('Failed to add product');
    }
  }

}