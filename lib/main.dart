import 'package:flutter/material.dart';
import 'package:the_phone_shop/constants/theme.dart';
import 'package:the_phone_shop/pages/cart_page.dart';
import 'package:the_phone_shop/pages/home_page.dart';
import 'package:the_phone_shop/pages/login.dart';
import 'package:the_phone_shop/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: "/login",
        debugShowCheckedModeBanner: false,
        theme: MyFullTheme.light(context),
        darkTheme: MyFullTheme.dark(context),
        themeMode: ThemeMode.system,
        routes: {
          MyRoutes.homeRoute: (context) => const HomePage(),
          MyRoutes.loginRoute: (context) => const LoginPage(),
          MyRoutes.cartRoute: (context) => const CartPage()
        });
  }
}
