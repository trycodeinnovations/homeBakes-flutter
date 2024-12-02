class Payment {
 final String id;
  final String cakename;
  final String flavour;
  final String price;
  final int Quantity;
  final bool isPaid;
    //  final DateTime date; 

  Payment({
    required this.id,
    required this.cakename,
    required this.flavour,
    required this.price,
    required this.Quantity,
    required this.isPaid,
      // required this.date,
  });
}