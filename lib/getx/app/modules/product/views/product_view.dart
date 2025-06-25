import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slider_app/getx/app/modules/product/views/cart_view.dart';
import '../controllers/product_controller.dart';

class ProductView extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [
          IconButton(
            onPressed: () {
              //Navigating to CartView  widget
              Get.to(CartView());
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            final product = productController.products[index];

            return ListTile(
              title: Text(product.name),
              subtitle: Text('\$${product.price.toString()}'),
              onTap: () {
                Get.toNamed('/product-details', arguments: product);
              },
            );
          },
        );
      }),
    );
  }
}
