

import 'package:project1/hellpe/aip.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    Aip aip = Aip();
    List<dynamic> data = await aip.fetchData('https://fakestoreapi.com/products/categories');

    return data;
  }
  }

    

    