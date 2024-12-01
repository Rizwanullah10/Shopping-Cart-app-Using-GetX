import 'package:get/get.dart';

class CartController extends GetxController {
  // A reactive map to store products and their quantities
  var cartItems = <String, int>{}.obs;

  void addToCart(String product) {
    if (cartItems.containsKey(product)) {
      cartItems[product] = cartItems[product]! + 1;
    } else {
      cartItems[product] = 1;
    }
  }

  void removeFromCart(String product) {
    if (cartItems.containsKey(product) && cartItems[product]! > 1) {
      cartItems[product] = cartItems[product]! - 1;
    } else {
      cartItems.remove(product);
    }
  }

  int get totalItems {
    return cartItems.values.fold(0, (sum, quantity) => sum + quantity);
  }
}
