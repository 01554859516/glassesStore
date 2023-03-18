import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:suuuuuuuuuuuuuuuuuuu/provider/cart.dart';
import 'package:suuuuuuuuuuuuuuuuuuu/screen/products/checkout.dart';

class ProductAndPrice extends StatelessWidget {
  const ProductAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    final carttt = Provider.of<Cart>(context);
    return Row(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 219, 16, 206),
                shape: BoxShape.circle,
              ),
              child: Text(
                "${carttt.itemCount}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckOut(),
                  ),
                );
              },
              icon: const Icon(Icons.add_shopping_cart),
              color: const Color.fromARGB(179, 246, 245, 245),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(
            " \$  ${carttt.price}",
            style: const TextStyle(
              color: Color.fromARGB(179, 246, 245, 245),
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
