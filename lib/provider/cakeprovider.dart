import 'package:flutter/foundation.dart';
import 'package:homebakes/provider/customercakedatamodel.dart';

class CartProvider with ChangeNotifier {
  final List<CustomerCakeData> _cartItems = [];
  double gtotal = 0; // Grand total variable

  List<CustomerCakeData> get cartItems => _cartItems;

  void addToCart(CustomerCakeData item) {
    // Customerget();
    // addItemToCartfun(item.id);
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(CustomerCakeData item) {
    
    _cartItems.remove(item);
    grandtotal(); // Recalculate the grand total when an item is removed
    notifyListeners();
  }

  bool isInCart(CustomerCakeData item) {
    return _cartItems.contains(item);
  }

  void clearCart() {
    _cartItems.clear();
    grandtotal(); // Recalculate the grand total when the cart is cleared
    notifyListeners();
  }

  int get cartCount => _cartItems.length;

  double get totalPrice => _cartItems.fold(0, (total, item) => total + double.parse(item.price));

  // New grandtotal function
  void grandtotal() {
    gtotal = 0; // Reset the total

    for (int i = 0; i < _cartItems.length; i++) {
      // Assuming cart[i] has a count field representing the quantity of the item
      gtotal += double.parse(_cartItems[i].price) * _cartItems[i].count;
      print(_cartItems[i].count); // For debugging purposes
    }

    print(gtotal); // For debugging purposes
    notifyListeners(); // Notify listeners to update the UI with the new total
  }

  double get getGrandTotal => gtotal; // Getter for accessing the grand total

  // Method for incrementing the count of an item in the cart
  void countincrement(int index) {
    _cartItems[index].count++;
    grandtotal(); // Update the grand total after incrementing
    notifyListeners();
  }

  // Method for decrementing the count of an item in the cart
  void countdecreament(int index) {
    if (_cartItems[index].count > 1) {
      _cartItems[index].count--;
      grandtotal(); // Update the grand total after decrementing
      notifyListeners();
    }
  }

   Future<void> processPayment(bool paymentSuccess) async {
    if (paymentSuccess) {
      // Logic for successful payment
      // E.g., clear the cart or mark the order as completed
      // You can also update the database here if needed
      print("Payment was successful.");
      
      // Clear the cart (optional)
      cartItems.clear();
      
      // Notify listeners if you're using a UI that needs updating
      notifyListeners();
    } else {
      // Logic for failed payment
      print("Payment failed.");
      // You can show a message to the user or handle the error appropriately
    }
  }

}





      
     


  // Handle payment success
  void PaymentSuccess() {
    // Optionally, you could add more logic here, like showing a message to the user
    print("Payment processed successfully");
  }


