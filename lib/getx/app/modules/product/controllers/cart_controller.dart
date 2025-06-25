import 'package:get/get.dart';
import 'package:slider_app/getx/app/modules/product/models/product_model.dart';

class CartController extends GetxController {
  static RxList<ProductModel> cartItems = <ProductModel>[].obs;
  var totalAmount = 0.0.obs;

  SnackbarController addToCart(ProductModel product) {
    if (cartItems.contains(product)) {
      return Get.snackbar("Alert", "Item already exists in cart");
    }
    cartItems.add(product);
    calculateTotal();
    return Get.snackbar("Alert", "Item added successflly");
  }

  void calculateTotal() {
    totalAmount.value = cartItems.fold(0, (sum, item) => sum + item.price);
  }

  void removeFromCard(ProductModel product) {
    cartItems.remove(product);
    calculateTotal();
  }
}
