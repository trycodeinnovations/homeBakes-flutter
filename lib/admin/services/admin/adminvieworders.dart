import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:homebakes/admin/services/customers/paymentmodel.dart';
  List<Payment> orders = [];

Future fetchOrders() async{
// var email =FirebaseAuth.ins
// tance.currentUser!.email;
try {
   var update = FirebaseFirestore.instance.collection("payment");
  //  .where('email',isEqualTo: email);
    QuerySnapshot querySnapshot = await update.get();
    print(querySnapshot.docs.length);
     orders = querySnapshot.docs.map((doc) {
      return Payment(

        
          id: doc.id,
          // landmark:doc['landmark']??'',
          
          cakename: doc['cakename'],
          flavour: doc['flavour'],
          price: doc['price'],
          Quantity: doc['quantity'],
          isPaid: doc['paid'] == 'Paid',
          
        );
    }).toList();
   

// print(bakerprofilelist[0].place);
print(orders.length);


  
} catch (e) {
print("Error fetching orders: $e");
  print(e);
  
}

}
      
      
      
      
      
      
        // Assuming your 'payment' collection has fields that match the Payment model
  //       orders.add(Payment(
        
  //       ));
  //     }
  //   } catch (e) {
  //     
  //   }
    
  //   return orders;
  // }

