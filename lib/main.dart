import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:homebakes/Adminpage/adminhomepage.dart';
import 'package:homebakes/customer/add%20reviews&ratings.dart';
import 'package:homebakes/customer/customercart.dart';

import 'package:homebakes/customer/customercartpage.dart.dart';
import 'package:homebakes/customer/customerchecckout.dart';
import 'package:homebakes/customer/customerdataprovider.dart';
import 'package:homebakes/customer/customerpayment.dart';
import 'package:homebakes/customer/customerprofile.dart';

import 'package:homebakes/baker/bakerhomepage.dart';
import 'package:homebakes/baker/bakerprofile.dart';
import 'package:homebakes/bakerregistration.dart';
import 'package:homebakes/customer/customerregistration.dart';
import 'package:homebakes/customer/customersettings.dart';
import 'package:homebakes/firebase_options.dart';
import 'package:homebakes/login.dart';
import 'package:homebakes/provider/cakeprovider.dart';
import 'package:provider/provider.dart';


void main()async {
   WidgetsFlutterBinding.ensureInitialized();
   
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartProvider>(
          create: (context) => CartProvider(),
         ),
          
        ChangeNotifierProvider(create: (_) => CustomerProvider()),
        // Add other providers if necessary
    
        //     ChangeNotifierProvider<CakeProvider>(
        //   create: (context) =>CakeProvider(),
        // ),

      ],
    child:  MaterialApp(
     routes: {"login":(context)=>LoginScreen(),
     "bakesregistration":(context)=>BakesRegistration(),
     "customerregistration":(context)=>customerRegistration(),
     "bakerhomepage":(context)=>Bakerhomepage(),
     "adminhomepage":(context)=>Adminhomepage(),
      
     "customerhomepage":(context)=>const Customerhomepage(),
     
       "bakerprofile":(context)=>const Bakerprofile(),
        "customerprofile":(context)=>const customerprofile(),

      "paymentscreen":(context)=>const PaymentScreen(),
     "cartpage":(context)=>const CartPage(),
     "checkoutpage":(context)=>const CheckoutPage(),
      "addReviewScreen":(context)=>AddReviewScreen(),
       "settingscustomer":(context)=>const Settingscustomer(),
      
      
    //  " bakerViewOrdersGrid":(context)=>BakerViewOrdersGrid(),
    //  "adminPaymentScreen":(context)=>AdminPaymentScreen(),
      // "AdminViewPendingBakerDetails":(context)=>AdminViewPendingBakerDetails(),
     
     
     
     
     
     },
     
      initialRoute: "login",
      debugShowCheckedModeBanner: false,
    ));
  }
}

