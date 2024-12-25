// import 'package:api_post/api_get.dart';
import 'package:api_post/Api_get_car.dart';
// import 'package:api_post/api_post.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: ApiGet(),
      // home: Posts(),
      home: ApiGetCar(),
    );
  }
}
