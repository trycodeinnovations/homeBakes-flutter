import 'package:flutter/material.dart';
import 'package:homebakes/admin/services/customers/customeraddtocartgetfun.dart';
import 'package:homebakes/admin/services/customers/customerscakegetfun.dart';
import 'package:homebakes/provider/cakeprovider.dart';
import 'package:homebakes/provider/customercakedatamodel.dart';
import 'package:provider/provider.dart';

class Customerhomepage extends StatelessWidget {
  const Customerhomepage({super.key});

  // Fetch customer data from Firebase
  Future<void> fetchCustomerData() async {
    await Customerget(); // Call Firebase function to fetch customer data
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    // Load data when the widget is built
    fetchCustomerData();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        backgroundColor: Colors.red.shade300,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, 'cartpage');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red.shade300,
              ),
              child: const Text(
                'Navigation Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.reviews, color: Colors.red.shade300),
              title: const Text('Reviews'),
              onTap: () {
                Navigator.pushNamed(context, 'addReviewScreen');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red.shade300),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushNamed(context, "login");
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.shade100.withOpacity(0.6),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
                border: Border.all(
                  color: Colors.red.shade300, // Border color
                  width: 2, // Border width
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/discount.jpg',
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Limited Time Offer!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red.shade600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Get 50% OFF on your favorite cakes. Shop Now!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.red.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.6,
                ),
                itemCount: Customerdata.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = Customerdata[index];
                  final isInCart = cartProvider.isInCart(CustomerCakeData(
                    customerid: item.id,
                    cakename: item.cakename,
                    flavour: item.flavour,
                    price: item.price,
                    images: item.images,
                  ));

                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Image.network(
                              item.images,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item.cakename,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.red.shade800,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Flavour: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red.shade600,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    item.flavour,
                                    style: TextStyle(color: Colors.red.shade400),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Price: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red.shade600,
                                  ),
                                ),
                                Text(
                                  item.price,
                                  style: TextStyle(
                                    color: Colors.red.shade600,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                addItemToCartfun(CustomerCakeData(
                                  customerid: item.id,
                                  cakename: item.cakename,
                                  flavour: item.flavour,
                                  price: item.price,
                                  images: item.images,
                                ));

                                if (isInCart) {
                                  cartProvider.removeFromCart(CustomerCakeData(
                                    customerid: item.id,
                                    cakename: item.cakename,
                                    flavour: item.flavour,
                                    price: item.price,
                                    images: item.images,
                                  ));
                                } else {
                                  cartProvider.addToCart(CustomerCakeData(
                                    customerid: item.id,
                                    cakename: item.cakename,
                                    flavour: item.flavour,
                                    price: item.price,
                                    images: item.images,
                                  ));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isInCart
                                    ? Colors.red.shade200
                                    : Colors.red.shade300,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                isInCart ? 'Remove from Cart' : 'Add to Cart',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
