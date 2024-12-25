// import 'package:api_post/api_post.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// class ApiGet extends StatefulWidget {
//   const ApiGet({super.key});

//   @override
//   State<ApiGet> createState() => _ApiGetState();
// }

// class _ApiGetState extends State<ApiGet> {
//   List<dynamic> iphone = [];
//   bool isLoading = true;

//   Future<void> getData() async {
//     try {
//       Dio dio = Dio();
//       dynamic response = await dio.get("https://api.restful-api.dev/objects");
//       if (response.statusCode == 200) {
//         setState(() {
//           iphone = response.data;
//           isLoading = false;
//         });
//       }
//     } catch (e) {}
//   }

//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey,
//       appBar: AppBar(
//         backgroundColor: Colors.blueAccent,
//         title: const Text(
//           "Api Get",
//           style: TextStyle(
//             color: Colors.red,
//             fontWeight: FontWeight.normal,
//             letterSpacing: 3,
//           ),
//         ),
//         actions: [
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const Posts(),
//                 ),
//               );
//             },
//             child: const Text(
//               "api post view >",
//             ),
//           ),
//           const SizedBox(width: 5),
//         ],
//       ),
//       body: iphone.isEmpty
//           ? const Center(
//               child: CircularProgressIndicator(
//               color: Colors.white,
//             ))
//           : Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     width: double.infinity,
//                     height: 700,
//                     child: ListView.builder(
//                       itemCount: iphone.length,
//                       itemBuilder: (context, index) {
//                         return Container(
//                           margin: const EdgeInsets.all(5),
//                           width: double.infinity,
//                           height: 130,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(7),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 10,
//                               vertical: 5,
//                             ),
//                             child: Column(
//                               children: [
//                                 Align(
//                                   alignment: Alignment.centerLeft,
//                                   child: Text(
//                                     iphone[index]["id"] ?? "no id",
//                                     style: const TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 20,
//                                     ),
//                                   ),
//                                 ),
//                                 Align(
//                                   alignment: Alignment.centerRight,
//                                   child: Text(
//                                     iphone[index]["name"] ?? " no name",
//                                     style: const TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 20,
//                                     ),
//                                   ),
//                                 ),
//                                 Align(
//                                   alignment: Alignment.centerRight,
//                                   child: Text(
//                                     iphone[index]["data"]?["color"] ??
//                                         "no color",
//                                     style: const TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 20,
//                                     ),
//                                   ),
//                                 ),
//                                 Align(
//                                   alignment: Alignment.centerRight,
//                                   child: Text(
//                                     iphone[index]["data"]?["capacity"] ??
//                                         "no capacity",
//                                     style: const TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 20,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }
