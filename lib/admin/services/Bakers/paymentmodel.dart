// bakerpaymentmodel.dart
class BakerPayment {
  final String id;
  
  final String cakename;
  final String flavour;
  final String price;
  final int quantity;
  final bool isPaid;

  BakerPayment({
    required this.id,
    required this.cakename,
    required this.flavour,
    required this.price,
    required this.quantity,
    required this.isPaid,
  });
}
