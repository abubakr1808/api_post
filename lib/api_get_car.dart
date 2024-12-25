// ignore: file_names
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiGetCar extends StatefulWidget {
  const ApiGetCar({super.key});

  @override
  State<ApiGetCar> createState() => _ApiGetCarState();
}

class _ApiGetCarState extends State<ApiGetCar> {
  Map< String, dynamic> car = {};
  bool isLoading = true;

  Future<void> getData() async {
      Dio dio = Dio();
    try {
      final response = await dio
          .get("https://www.carqueryapi.com/api/0.3/?cmd=getTrims&make=toyota");
      if (response.statusCode == 200 || response.statusCode == 201) {
        setState(() {
          car = response.data;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // ignore: avoid_print
      log('$e');
      print("hato chiqdi:");
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          "Car Api Get",
          style: TextStyle(
            color: Colors.yellow,
          ),
        ),
      ),
      body: car.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : ListView.builder(
              itemCount: car.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.cyan,
                  ),
                  child: Column(
                    children: [
                      Text(
                        car[index]["model_id"] ?? "no model_id",
                        style: const TextStyle(
                          color: Colors.pink,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        car[index]["model_trim"] ?? "no model_trim",
                        style: const TextStyle(
                          color: Colors.pink,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        car[index]["model_body"] ?? "no  model_body !!!",
                        style: const TextStyle(
                          color: Colors.pink,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        car[index]["model_engine_fuel"] ?? "model_engine_fuel",
                        style: const TextStyle(
                          color: Colors.pink,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        car[index]["make_country"] ?? "  no make_country",
                        style: const TextStyle(
                          color: Colors.pink,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
