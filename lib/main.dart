import 'package:flutter/material.dart';
import 'package:project1/models/product_model.dart';
import 'package:project1/screens/home_page.dart';
import 'package:project1/tesst.dart';
import 'package:project1/test1.dart';
import 'package:project1/widgets/profile_Product.dart';
import 'package:project1/widgets/updata_product_Padge.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:'/' ,   
     
      routes: {
        '/': (context) => const HomePage(),
        'test1': (context) => const HomePageTest(),
        UpdateProductBadge.id: (context) =>  UpdateProductBadge(),
        "test": (context) => const HomePage_Tsest(),
       // "profile": (context) => const ProfileProduct(),
        // ProfileProduct.id: (context) =>  ProfileProduct(product: ),
      },
    );
  }
}
