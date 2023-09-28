// import 'dart:convert';
// import 'dart:ffi';

// import 'package:api_flutter/2get_api.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class FutureClass extends StatefulWidget {
//   const FutureClass({super.key});

//   @override
//   State<FutureClass> createState() => _FutureClassState();
// }

// class _FutureClassState extends State<FutureClass> {
//   final emailController = TextEditingController();
//   bool logging = false;
//   // Future postapi(var mobile,var email) async {
//   //   try {
//   //     var abc = await http.post(Uri.parse("uri"),
//   //     body: {
//   //       "mobile":mobile,
//   //       "email":email
//   //     }
//   //     );
//   //   } catch (e) {}
//   final paswordlController = TextEditingController();
//   // }
//   Future getpostApi(var mobile) async {
//     try {
//       final response = await http
//           .post(Uri.parse("https://hutoh.com/apis/merchant/Apis/Login"), body: {
//         "Email": "Email",
//         "mobile": mobile,
//       });

//       //     var data = jsonDecode(response.body);
//       //     if (data["satuse code "] == "200") {}
//       //     return true;
//       //   } else {
//       //     return false;
//       //   }
//       // }

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);

//         if (data['statusCode'] == '200') {
//           logging = true;
//         } else {
//           return false;
//         }
//       } else {
//         return false;
//       }
//     } catch (e) {}
//   }

  
//   //  }

//   //poast() async{}
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 100,
//             ),
//             TextFormField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 isCollapsed: true,
//                 contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
//                 hintText: "mobile",
//                 hintStyle:
//                     const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 suffixIcon: const Icon(
//                   Icons.email,
//                   size: 20,
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(11),
//                 ),
//               ),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Please Check email';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             TextFormField(
//               controller: paswordlController,
//               decoration: InputDecoration(
//                 isCollapsed: true,
//                 contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
//                 hintText: "   mobilell.",
//                 hintStyle:
//                     const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 suffixIcon: const Icon(
//                   Icons.email,
//                   size: 20,
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(11),
//                 ),
//               ),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Please Check email';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             // Center(
//             //     child: ElevatedButton(
//             //         onPressed: () {
//             //           getpostApi(emailController.text.trim())
//             //               .then((value) {
//             //                 if( logging == true){
//             //             Navigator.push(
//             //                 context,
//             //                 MaterialPageRoute(
//             //                   builder: (context) => GetApi2(),
//             //                 ));
//             //                 }else if( logging==false){
//             //                    print("False");
//             //                 }
//             //           });
//             //         },
//             //         child: Text("Login"))),
//             ElevatedButton(
//                 onPressed: () {
//                   getpostApi(emailController.text.trim()).then((value) {
//                     if (logging == true) {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => GetApi2()));
//                     } else if (logging == false) {
//                       print(false);
//                     }
//                   });
//                 },
//                 child: Text("login")),
           
//           ]),
//     );
//   }
// }







 