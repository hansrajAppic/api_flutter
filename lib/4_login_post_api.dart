import 'dart:convert';
import 'dart:developer';

import 'package:api_flutter/2get_api.dart';
import 'package:api_flutter/5_signup_post_api.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../main.dart';

class DemoLoginInsta extends StatefulWidget {
  const DemoLoginInsta({super.key});

  @override
  State<DemoLoginInsta> createState() => _DemoLoginInstaState();
}

class _DemoLoginInstaState extends State<DemoLoginInsta> {
  // bool visible = false ;

// Future<http.Response?> postMainLoginApi({required String email, required Object password})async{
//     http.Response? response;
//     try{ Map<String, String> headers = {
//         "Content-type": "application/json",
//       };

//        final response = await http.post(Uri.parse("https://reqres.in/")
//       ,body:json.encode( {
//         "email":email,
//         "password":password
//       }),headers: headers);

//       if(response.statusCode == 200) {
//         print('Response status: ${response.statusCode}');
//         print('Response body: ${response.body}');
//         return response;
//       }
//     }catch (e){
//       print("Exception_POST:.....$e");
//     }
//     return response;
//   }

  bool logging = false;
  Future registerApi(
    String mobile,
  ) async {
    try {
      var response = await http
          .post(Uri.parse("https://hutoh.com/apis/merchant/Apis/Login"), body: {
        'mobile': mobile,
        "countryCode": '91',
        "deviceId": '1234',
        "type": '1',
        "logintype": '1'
      });
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['statusCode'] == '200') {
          // logging = true;
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {}
  }

  String dropdownvalue = 'English(United States)';
  var items = [
    "English(United States)",
    "Hindi",
    "Marathi",
    "Inonesia",
    "french",
    "filipino",
    "nederlend"
  ];
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: DropdownButton(
                          value: dropdownvalue,
                          underline: Container(),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 90,
                      ),
                      Center(
                          child: Image.asset(
                        "assets/images/instaname.png",
                        height: 90,
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(

                        controller: emailController,
                        decoration: InputDecoration(
                          isCollapsed: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 15, 0, 15),
                          hintText: "Email",
                          hintStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          suffixIcon: const Icon(
                            Icons.email,
                            size: 20,
                          ),
                          border: OutlineInputBorder(
                            
                            borderRadius: BorderRadius.circular(11),
                          ),
                          
                        ),
                        
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Check email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // TextFormField(
                      //   obscureText: _passwordVisible,
                      //   controller: passwordController,
                      //   decoration: InputDecoration(
                      //     isCollapsed: true,
                      //     contentPadding:
                      //         const EdgeInsets.fromLTRB(10, 15, 0, 15),
                      //     hintText: "Password",
                      //     hintStyle: const TextStyle(
                      //         fontSize: 16, fontWeight: FontWeight.bold),
                      //     suffixIcon: IconButton(
                      //         icon: Icon(
                      //           // Based on passwordVisible state choose the icon
                      //           _passwordVisible
                      //               ? Icons.visibility
                      //               : Icons.visibility_off,
                      //           color: Theme.of(context).primaryColorDark,
                      //         ),
                      //         onPressed: () {
                      //           // Update the state i.e. toogle the state of passwordVisible variable
                      //           setState(() {
                      //             _passwordVisible = !_passwordVisible;
                      //           });
                      //         }),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(11),
                      //     ),
                      //   ),
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return 'Please enter check password';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Forgotten password",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ))),
                      const SizedBox(
                        height: 7,
                      ),
                      SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    logging = false;
                                  });

                                  registerApi(
                                    emailController.text.trim(),
                                  ).then((value) {
                                    if (logging == true) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => GetApi2(),
                                          ));
                                    } else if (logging == false) {
                                      print("False");
                                    }
                                  });
                                }
                                ;
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              child: const Text(
                                "login",
                                style: TextStyle(fontSize: 15),
                              ))),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Forgot your deatails?",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DemoLoginInsta()));
                              },
                              child: const Text(
                                "  Get helf logging in",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 145, child: Divider()),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            "or",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const SizedBox(width: 145, child: Divider())
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/facebok-removebg-preview.png",
                            height: 30,
                          ),
                          const Text(
                            "login with Facebook",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 85, 154, 211)),
                          ),

                          // Text("Sign In"),
                        ],
                      ),
                      const SizedBox(
                        height: 78,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "dont have  an acount ?",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DemoSignUpScreen()));
                              },
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              )),
                        ],
                      ),
                    ]),
              ),
            )));
  }
}

