import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiKeys {
  static var stripePublicApiKey = dotenv.env['STRIPE_PUBLIC_API_KEY']!;
  static var stripeSecretApiKey = dotenv.env['STRIPE_SECRET_API_KEY']!;
}
