import 'package:e_commerce/product_page.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/login_page.dart';
import 'package:e_commerce/cart_page.dart';
import 'package:e_commerce/plantdetail_page.dart';
import 'package:e_commerce/pay_page.dart';
import 'package:e_commerce/registrationPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:e_commerce/side_pannel.dart';
import 'package:e_commerce/OTP_screen.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:e_commerce/item_container.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'api_keys.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Stripe.publishableKey = ApiKeys.stripePublicApiKey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PlantDetailPage.id,
      routes: {
        LoginPage.id: (context) => const LoginPage(),
        ProductPage.id: (context) => const ProductPage(),
        CartPage.id: (context) => const CartPage(),
        PlantDetailPage.id: (context) => PlantDetailPage(),
        PayPage.id: (context) => const PayPage(),
        RegistrationPage.id: (context) => RegistrationPage(),
        SidePannel.id: (context) => const SidePannel(),
        OTPScreen.id: (context) => OTPScreen(),
        container.id: (context) => const container(),
      },
    );
  }
}
