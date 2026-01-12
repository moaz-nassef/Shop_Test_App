import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project1/models/product_model.dart';
import 'package:project1/servis/updata_product.dart';
import 'package:project1/tesst.dart';
import 'package:project1/widgets/custom_text_field.dart';

class UpdateProductBadge extends StatefulWidget {
  UpdateProductBadge({super.key});
  static const String id = "UpdateProductBadge";

  @override
  State<UpdateProductBadge> createState() => _UpdateProductBadgeState();
}

class _UpdateProductBadgeState extends State<UpdateProductBadge> {
  bool obscurePassword = true;

  String imageUrl = '';

  String title = '';

  double price = 0.0;

  String description = '';

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Product_model? product =
        ModalRoute.of(context)!.settings.arguments as Product_model;

    String titleProduct = product!.title;
    String priceProduct = product.price.toString();
    String descriptionProduct = product.description;
    String imageUrlProduct = product.image;
    bool isLoading = false;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            'Update Product Badge',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomTextField(
                  hintText: 'Enter product Name ',
                  onChanged: (value) {
                    // Handle text change
                    title = value;
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomTextField(
                  hintText: 'Enter product Price ',
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    // Handle text change
                    price = double.parse(value);
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomTextField(
                  hintText: 'Enter product Description ',
                  onChanged: (value) {
                    // Handle text change
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomTextField(
                  hintText: 'Enter product Image URL ',
                  onChanged: (value) {
                    // Handle text change
                    imageUrl = value;
                  },
                ),
              ),
              SizedBox(height: 32.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF667EEA),
                        Color.fromARGB(255, 249, 251, 255),
                        Color(0xFF764BA2),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF667EEA).withOpacity(0.4),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      isLoading = true;
                      setState(() {});
                      // Handle button press
                      try {
                        method_updeta(titleProduct, priceProduct, descriptionProduct, imageUrlProduct, product);
                      } on Exception catch (e) {
                        print('Error updating product: ${e.toString()}');
                        // TODO
                      }
                      isLoading = false;
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void method_updeta(String titleProduct, String priceProduct, String descriptionProduct, String imageUrlProduct, Product_model product) {
    
    UpdateProductService().updateProduct(
      title: title == null ? titleProduct : title,
      price: price == null ? priceProduct : price.toString(),
      description:
          description == null
              ? descriptionProduct
              : description,
      image: imageUrl == null ? imageUrlProduct : imageUrl,
      category: product!.category,
    );
    print('Update successful');
  }
}


