import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController yearcontroller = TextEditingController();
  final TextEditingController pricecontroller = TextEditingController();
  final TextEditingController cPUmodelcontroller = TextEditingController();
  final TextEditingController harddisksizecontroller = TextEditingController();

  Future<void> createPhone() async {
    Dio dio = Dio();
    try {
      final response = await dio.post(
        "https://api.restful-api.dev/objects",
        data: {
          "name": namecontroller.text,
          "data": {
            "year": int.tryParse(yearcontroller.text) ?? 0,
            "price": double.tryParse(pricecontroller.text) ?? 0,
            "CPUmodel": cPUmodelcontroller.text,
            "hardDiskSize": harddisksizecontroller.text,
          }
        },
      );

      // ignore: avoid_print
      print('Name: ${namecontroller.text}');
      // ignore: avoid_print
      print('Year: ${yearcontroller.text}');
      // ignore: avoid_print
      print('Price: ${pricecontroller.text}');
      // ignore: avoid_print
      print('CPU Model: ${cPUmodelcontroller.text}');
      // ignore: avoid_print
      print('Hard Disk Size: ${harddisksizecontroller.text}');

      if (response.statusCode == 200)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "tuura luktoldu",
            ),
          ),
        );
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text("Api Post"),
        actions: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: createPhone,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: TextField(
                controller: namecontroller,
                decoration: const InputDecoration(
                  hintText: "name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              color: Colors.white,
              child: TextField(
                controller: yearcontroller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "year",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              color: Colors.white,
              child: TextField(
                controller: pricecontroller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "price",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              color: Colors.white,
              child: TextField(
                controller: cPUmodelcontroller,
                decoration: const InputDecoration(
                  hintText: "CPU model",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              color: Colors.white,
              child: TextField(
                controller: harddisksizecontroller,
                decoration: const InputDecoration(
                  hintText: "Hard disk size",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                createPhone();
              },
              child: const Text("send"),
            ),
          ],
        ),
      ),
    );
  }
}
