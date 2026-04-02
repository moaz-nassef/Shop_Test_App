import 'package:project1/hellpe/aip.dart';
import 'package:project1/models/product_model.dart';

class GetAllProductsService {
  Future<List<Product_model>> GetAllProducts() async {
    Aip aip = Aip();
    const backend = 'https://dummyjson.com/products';
    dynamic data = await aip.fetchData(backend);

    if (data is Map && data.containsKey('products')) {
      data = data['products'];
    }

    if (data is! List) {
      throw Exception(
        'Unexpected data format in GetAllProducts: ${data.runtimeType}',
      );
    }

    return data
        .cast<Map<String, dynamic>>()
        .map((item) => Product_model.fromJson(item))
        .toList();
  }
}
