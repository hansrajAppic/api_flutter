import 'package:api_flutter/api_controlar_puran.dart';
import 'package:flutter/material.dart';
class MyWidget extends StatefulWidget {

  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
 
  //   int Name = 220;
  //   double name =89.9;
  //   String a = "hhhh";
  // var list =[];
  // dynamic n = "hhhh";
  // dynamic b = 18;
  // bool Boday  =false;
  // List Array  = [];
// var f = const[];
//  final geek1 = "Geeks For Geeks";
// final name =[];
// var b = "LLL";
// dynamic N = " Privan";
//  const String geek2 = "Geeks For Geeks Again!!";



 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: InkWell(
        onTap: () async {
          /// Get
          await ApiController().countryApi(url: "https://api.publicapis.org/entries",).then((value) {
            if(value != null) {
              
              print("::::::::::::::::${value.count}");
              var _counter = value.count ?? 0;
              setState(() {

              });
            }
          });

 
          /// Post
          // await ApiController().postMainApi(url: "http//",body: {"user_id":"234","name":"Rohit"}).then((value){
          //
          // });
        },
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          color: Colors.green,
          child: Center(
            child: Text("Call Api"),
          ),
        ),
      ),
      ),
    );
  }
}