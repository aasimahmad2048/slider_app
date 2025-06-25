import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slider_app/getx/app/modules/product/views/cart_view.dart';
import '../modules/product/views/product_view.dart';
import '../modules/product/views/product_details_view.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.PRODUCT,
      page: () => ProductView(),
      transition: Transition.zoom,
    ),
    GetPage(name: Routes.PRODUCT_DETAILS, page: () => ProductDetailsView()),
    GetPage(name: Routes.CART, page: () => CartView()),
    GetPage(name: Routes.UNKNOWNROUTE, page: () => UnknownPage()),
  ];
}

class UnknownPage extends StatelessWidget {
  const UnknownPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
