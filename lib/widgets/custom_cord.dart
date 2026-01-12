import 'package:flutter/material.dart';
import 'package:project1/models/product_model.dart';
import 'package:project1/widgets/Custom_Icon_Shop_Badge.dart';
import 'package:project1/widgets/profile_Product.dart';

class customCard extends StatefulWidget {
  const customCard({super.key, required this.product, required this.cartItemsNotifier});
  final Product_model product;
  // map notifier: productId -> quantity
  final ValueNotifier<Map<String, int>> cartItemsNotifier;

  @override
  State<customCard> createState() => _customCardState();
}

class _customCardState extends State<customCard> {
  bool isFavorite = false;

  @override
    bool isAddInCart = false;
    bool isInCart = false;
    
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => ProfileProduct(product: widget.product),
  ),
);
},

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          clipBehavior: Clip.none,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                blurRadius: 15,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Container
              Expanded(
                flex: 3,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: 50,
                      top: 20,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Image.network(
                          widget.product.image,
                          height: 165,
                          width: 150,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Icon(Icons.image, color: Colors.grey[400]),
                            );
                          },
                        ),
                      ),
                    ),
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Color.fromARGB(255, 214, 214, 214), width: .8),
                      ),
                    ),
                  ],
                ),
              ),

              // Text Information + buttons
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.title.split(" ").take(1).join(" "),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "\$${widget.product.price}",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[700],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 1),

                    // Use ValueListenableBuilder to show per-product count and update it
                    ValueListenableBuilder<Map<String, int>>(
                      valueListenable: widget.cartItemsNotifier,
                      builder: (context, cartMap, _) {
                        final id = widget.product.id;
                        final count = cartMap[id] ?? 0;

                        void increment() {
                          final newMap = Map<String, int>.from(widget.cartItemsNotifier.value);
                          newMap[id] = (newMap[id] ?? 0) + 1;
                          widget.cartItemsNotifier.value = newMap;
                        }

                        return Row(
                          children: [
                            // Show custom badge widget when count > 0, otherwise show add icon
                            if (count > 0)
                              CustomIconShopBadge(
                                itemCount: count,
                                onPressed: increment,
                              )
                            else
                              IconButton(
                                onPressed: increment,
                                icon: const Icon(Icons.add_shopping_cart),
                                color: const Color.fromARGB(255, 50, 65, 50),
                              ),
                          ],
                        );
                      },
                    ),

                    // favorite button
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      icon: isFavorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


