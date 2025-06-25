import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slider_app/getx/app/modules/product/controllers/cart_controller.dart';

class CartView extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),

      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: CartController.cartItems.length,
                itemBuilder: (context, int index) {
                  final item = CartController.cartItems[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('\$${item.price.toString()}'),
                    trailing: IconButton(
                      onPressed: () => {cartController.removeFromCard(item)},
                      icon: Icon(Icons.remove_circle_outline),
                    ),
                  );
                },
              );
            }),
          ),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                style: TextStyle(fontSize: 24),
                'Total:\$${cartController.totalAmount.value.toStringAsFixed(2)}',
              ),
            );
          }),
        ],
      ),
    );
  }
}
