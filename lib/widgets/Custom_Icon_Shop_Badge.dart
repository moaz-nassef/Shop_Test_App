import 'package:flutter/material.dart';


class CustomIconShopBadge extends StatelessWidget {
  const CustomIconShopBadge({super.key, required this.itemCount, required this.onPressed});
  final int itemCount;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: Colors.white.withOpacity(0.4),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
              size: 22,
            ),
          ),
        ),

        if (itemCount > 0)
          Positioned(
            right: -2,
            top: -4,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color.fromARGB(255, 255, 192, 192), Color.fromARGB(255, 105, 255, 85), Color.fromARGB(255, 255, 189, 189)],

                ),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1),
              ),
              constraints: const BoxConstraints(minWidth: 10, minHeight: 10),
              child: Text(
                '$itemCount',
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}