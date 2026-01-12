import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project1/models/product_model.dart';

class ProfileProduct extends StatefulWidget {
   ProfileProduct({super.key, required this.product});

  static const String id = "ProfileProduct";
  
  
  final Product_model product;
  
  @override
  State<ProfileProduct> createState() => _ProfileProductState();
  
}

class _ProfileProductState extends State<ProfileProduct> {

  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    print(widget.product.title);
    print(widget.product.price);
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFF3E0),
              Color(0xFFFFE0B2),
              Color(0xFFFFCC80),
            ],
          ),
        ),
        child: Stack(
          children: [
            // ✅ Main Content
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ✅ Image Section with Glass Buttons
                  Stack(
                    children: [
                      // Main Image
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                        child: 
                        Image.network(
                          widget.product.image,
                          height: screenHeight * 0.4,
                          width: 250,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: screenHeight * 0.5,
                              color: Colors.grey[300],
                              child: Icon(Icons.image, size: 100, color: Colors.grey[500]),
                            );
                          },
                        ),
                      ),

                      // Gradient Overlay
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.3),
                                Colors.black.withOpacity(0.6),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Top Buttons
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GlassIcon(
                                icon: Icons.arrow_back_ios_new_rounded,
                                onTap: () => Navigator.pop(context),
                              ),
                              GlassIcon(
                                icon: Icons.more_vert_rounded,
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ),

                      // ✅ Price Tag - Glass Effect
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: GlassContainer(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            child: Row(
                              children: [
                                Text(
                                  '\$${widget.product.price.toStringAsFixed(0)}',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 8,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'USD',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // ✅ Rating Badge
                      Positioned(
                        bottom: 20,
                        right: 20,
                        child: GlassContainer(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            child: Row(
                              children: [
                                Icon(Icons.star, color: Color(0xFFFFC107), size: 20),
                                SizedBox(width: 6),
                                Text(
                                  '4.8',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24),

                  // ✅ Product Info Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Name & Favorite
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Smart Watch',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[900],
                                      letterSpacing: -0.5,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Series 8 Pro Max',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isFavorite = !isFavorite;
                                });
                              },
                              child: GlassContainer(
                                borderRadius: 16,
                                child: Container(
                                  padding: EdgeInsets.all(14),
                                  child: Icon(
                                    isFavorite ? Icons.favorite : Icons.favorite_border,
                                    color: isFavorite ? Colors.red : Colors.grey[700],
                                    size: 26,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 24),

                        // ✅ Colors Section
                        Text(
                          'الألوان المتاحة',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[900],
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            ColorOption(color: Color(0xFF000000), isSelected: true),
                            SizedBox(width: 12),
                            ColorOption(color: Color(0xFFE0E0E0)),
                            SizedBox(width: 12),
                            ColorOption(color: Color(0xFF2196F3)),
                            SizedBox(width: 12),
                            ColorOption(color: Color(0xFFFF6B6B)),
                          ],
                        ),

                        SizedBox(height: 24),

                        // ✅ Description
                        Text(
                          'الوصف',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[900],
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'ساعة ذكية متطورة مع شاشة AMOLED عالية الدقة، مقاومة للماء، وبطارية تدوم 48 ساعة. تتبع صحتك ولياقتك البدنية بدقة عالية مع أكثر من 100 وضع رياضي.',
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.6,
                            color: Colors.grey[700],
                          ),
                        ),

                        SizedBox(height: 24),

                        // ✅ Features - Glass Cards
                        Row(
                          children: [
                            Expanded(
                              child: FeatureCard(
                                icon: Icons.water_drop_outlined,
                                title: 'مقاوم للماء',
                                subtitle: '50م',
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: FeatureCard(
                                icon: Icons.battery_charging_full_rounded,
                                title: 'البطارية',
                                subtitle: '48 ساعة',
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 120),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ✅ Bottom Action Buttons - Glass Effect
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      border: Border(
                        top: BorderSide(
                          color: Colors.white.withOpacity(0.5),
                          width: 1.5,
                        ),
                      ),
                    ),
                    child: SafeArea(
                      top: false,
                      child: Row(
                        children: [
                          // Add to Cart Button
                          GlassContainer(
                            borderRadius: 18,
                            child: Container(
                              padding: EdgeInsets.all(18),
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.grey[800],
                                size: 26,
                              ),
                            ),
                          ),

                          SizedBox(width: 16),

                          // Buy Now Button
                          Expanded(
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xFFFF6B6B), Color(0xFFFF8E53)],
                                ),
                                borderRadius: BorderRadius.circular(18),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFFF6B6B).withOpacity(0.4),
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                child: Text(
                                  'اشتر الآن - Buy Now',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ Glass Icon Widget
class GlassIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const GlassIcon({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.25),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withOpacity(0.4),
                width: 1.5,
              ),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
        ),
      ),
    );
  }
}

// ✅ Glass Container Widget
class GlassContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;

  const GlassContainer({
    super.key,
    required this.child,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.25),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: Colors.white.withOpacity(0.4),
              width: 1.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

// ✅ Color Option Widget
class ColorOption extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const ColorOption({
    super.key,
    required this.color,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(
          color: isSelected ? Colors.orange[700]! : Colors.grey[300]!,
          width: isSelected ? 3 : 2,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: isSelected
          ? Icon(Icons.check, color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white)
          : null,
    );
  }
}

// ✅ Feature Card Widget
class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      borderRadius: 16,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, size: 32, color: Colors.orange[700]),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey[900],
              ),
            ),
            SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}