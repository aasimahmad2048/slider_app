import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product_model.dart';
import '../controllers/cart_controller.dart';

class ProductDetailsView extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel product = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/cart');
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(product.name, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Text('\$${product.price}', style: const TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                cartController.addToCart(product);
                // Get.snackbar(
                //   "Added to cart",
                //   '${product.name} added to your cart',
                // );
              },
              child: Text("Add to cart"),
            ),
          ],
        ),
      ),
    );
  }
}
