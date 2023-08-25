import 'package:api_flutter/api_controlar_puran.dart';
import 'package:flutter/material.dart';
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
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