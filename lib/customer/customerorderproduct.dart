// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';


// class Shopping extends StatelessWidget {
//    Shopping ({super.key});
//   final data=shopping;

//   @override
//   Widget build(BuildContext context) {
//     // var shoppro=Provider.of<CartProvider>(context,);
//     print('object');
//     return Scaffold(
//       body: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,mainAxisSpacing: 40, crossAxisSpacing: 9,childAspectRatio: 0.5
//         ),
//         itemCount: shopping.length,
//         itemBuilder: (BuildContext context, int index) {
//           return 
//           Column(
//             children: [
//               Container(
//                 height: 200,
//                 width: 200,
//                 color: const Color.fromARGB(255, 248, 224, 2),
//                 child: 
//                 Column(
//                   children: [
//                     SizedBox(
//                       height: 100,width: 100,
//                       child: Image.network(data[index].image),),
//                     // Text("name"),
                    
//                 Column(
//                   children: [
//                     Text(data[index].title.substring(0,6)),
//                    Text(data[index].price.toString()),
//                   ],
//                 ),
                
//                 Consumer<CartProvider>(builder: (context, value, child) => 
//                    ElevatedButton(onPressed: () {
//                     // shoppingNNewapi();
//                     value.addcart(data[index]);
//                     Navigator.pushNamed(context, "add to cart");
//                   }, child: const Text("Add to Cart")),
//                 ) ],
                
//                 ),
                
//                 ),
             
//             ],
//           );
          
//         },
//       ),
//     );
//   }
// }

// List<Fakestoredata>shopping=[];