
import 'package:project1/hellpe/aip.dart';
import 'package:project1/models/product_model.dart';



class GetAllCategoryService {

final String category;
  GetAllCategoryService({required this.category});
  Future<List<Product_model>> GetAllProducts() async {
    Aip aip = Aip();
    List<dynamic> data = await aip.fetchData('https://fakestoreapi.com/products/category/$category');
    List<Product_model> productsList = data.map((item) => Product_model.fromJson(item)).toList();
    return productsList;
  }
}