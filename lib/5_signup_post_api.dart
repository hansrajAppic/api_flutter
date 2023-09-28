import 'dart:convert';

import 'package:api_flutter/4_login_post_api.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DemoSignUpScreen extends StatefulWidget {
  const DemoSignUpScreen({super.key});

  @override
  State<DemoSignUpScreen> createState() => _DemoSignUpScreenState();
}

class _DemoSignUpScreenState extends State<DemoSignUpScreen> {
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
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          automaticallyImplyLeading: false,
          title: const Center(
              child: Text(
            "Sign up",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          )),
        ),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        height: 130,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: const InputDecoration(
                          isCollapsed: true,
                          contentPadding: EdgeInsets.fromLTRB(10, 15, 0, 15),
                          hintText: "Email",
                          hintStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          suffixIcon: Icon(
                            Icons.email,
                            size: 20,
                          ),
                          border: UnderlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter check password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        obscureText: _passwordVisible,
                        controller: passwordController,
                        decoration: InputDecoration(
                          isCollapsed: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 15, 0, 15),
                          hintText: "Password",
                          hintStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              }),
                          border: const UnderlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter check password';
                          }
                          return null;
                        },
                      ),
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
                        height: 45,
                      ),
                      SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  signup_API(
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                  ).then((value) {
                                    if (value) {
                                      final snackBar = SnackBar(
                                        content: Text("Failed"),
                                        backgroundColor: (Colors.red),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      setState(() {});
                                    } else {
                                      final snackBar = SnackBar(
                                        content: Text("Sucess"),
                                        backgroundColor: (Colors.green),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(fontSize: 15),
                              ))),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Forgot your deatails?",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "  Get helf Sigen in",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
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
                                            DemoLoginInsta()));
                              },
                              child: const Text(
                                "Login",
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

Future signup_API(var email, var password) async {
  try {
    var response = await http.post(Uri.parse("https://reqres.in/api/register"),
        body: {"email": email, "password": password});
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data["status"]) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  } catch (e) {}
}
