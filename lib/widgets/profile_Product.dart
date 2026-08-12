// 📁 lib/widgets/profile_product.dart
// 📌 Product detail page with glass morphism effects and animations
// 🔗 Dependencies: flutter/material.dart, product_model.dart, product_image_section.dart, product_info_section.dart, product_action_bar.dart

import 'package:flutter/material.dart';
import 'package:project1/models/product_model.dart';
import 'product_image_section.dart';
import 'product_info_section.dart';
import 'product_action_bar.dart';

class ProfileProduct extends StatefulWidget {
  const ProfileProduct({super.key, required this.product});

  static const String id = "ProfileProduct";

  final Product_model product;

  @override
  State<ProfileProduct> createState() => _ProfileProductState();
}

class _ProfileProductState extends State<ProfileProduct> {
  bool isFavorite = false;
  int selectedColorIndex = 0;
  bool isLoading = false;

  void _handleAddToCart() {
    setState(() => isLoading = true);
    // Simulate API call
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() => isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Added to cart!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    });
  }

  void _handleBuyNow() {
    setState(() => isLoading = true);
    // Simulate API call
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() => isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Proceeding to checkout...'),
            backgroundColor: Colors.blue,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFF3E0), Color(0xFFFFE0B2), Color(0xFFFFCC80)],
          ),
        ),
        child: Stack(
          children: [
            // Main Content
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Section with Glass Buttons
                  ProductImageSection(
                    imageUrl: widget.product.image,
                    price: widget.product.price,
                    rating: widget.product.rating.rate,
                    onBackTap: () => Navigator.pop(context),
                    onMoreTap: () {
                      // TODO: Show more options
                    },
                  ),

                  const SizedBox(height: 24),

                  // Product Info Section
                  ProductInfoSection(
                    title: widget.product.title,
                    subtitle: widget.product.category,
                    description: widget.product.description,
                    availableColors: const [
                      Color(0xFF000000),
                      Color(0xFFE0E0E0),
                      Color(0xFF2196F3),
                      Color(0xFFFF6B6B),
                    ],
                    selectedColorIndex: selectedColorIndex,
                    onColorSelected: (index) {
                      setState(() => selectedColorIndex = index);
                    },
                  ),
                ],
              ),
            ),

            // Bottom Action Buttons - Glass Effect
            ProductActionBar(
              onAddToCart: _handleAddToCart,
              onBuyNow: _handleBuyNow,
              isLoading: isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
