import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'page/splash_page.dart';
import 'page/wishlist_provider.dart'; // นำเข้า WishlistProvider

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WishlistProvider(), // เพิ่ม Provider ที่นี่
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'MN MINI',
        ),
        home: const SafeArea(
          child: SplashPage(),
        ),
      ),
    );
  }
}
