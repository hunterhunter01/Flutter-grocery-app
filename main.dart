import 'package:flutter/material.dart';
import 'package:flutter_application_1/hive/cart_manager.dart';
import 'package:flutter_application_1/login_screen.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CartManagerAdapter());
  await Hive.openBox<CartManager>('cart');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}
