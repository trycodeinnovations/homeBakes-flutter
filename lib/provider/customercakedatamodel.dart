class CustomerCakeData {
  final String customerid;
  final String cakename;
  final String flavour;
  final String price; // Assuming the price is a string in this case
  final String images;
   int count;
   

  CustomerCakeData({
    required this.customerid,
    required this.cakename,
    required this.flavour,
    required this.price,
    required this.images,
    this.count = 1,
  });
}