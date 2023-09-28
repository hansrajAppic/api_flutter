import 'dart:convert';

import 'package:api_flutter/json_model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Intrvwe extends StatefulWidget {
  const Intrvwe({super.key});

  @override
  State<Intrvwe> createState() => _IntrvweState();
}

class _IntrvweState extends State<Intrvwe> {


  @override
  List ArrayName =[];
  var data;
  void getData() async {
    final response = await http.get(Uri.parse("http://restapi.adequateshop.com/api/Tourist?page=1"));

    //  print("tfrcvtgtc.>>>>>>>>${response.body}");
    print("Api call ho rhi hai>>>>>>>>>>${response.body}");
    
    debugPrint("Status code is: ${response.statusCode}");

    if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        print("jsonData.>>>>>>>>${jsonData}");
      setState(() {
        ArrayName = jsonData["data"];
      });
      debugPrint('${ArrayName.length.toString()}');
    }
  }
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: Text("post api"),
      ),
      body:SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [  ListView.builder(itemCount:ArrayName.length ,
            shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, index) {
              var item = ArrayName[index];
              print("item>>>>>>>>>>>>>>${item}");
              return 
              Container(
                width: double.infinity,
                height :50,
                color: Colors.red,
                child:
                     Column(
                       children: [
                         Text(item["tourist_location"],style: TextStyle(fontSize: 18)),
                         Text(item["tourist_name"]),
                       ],
                     ),
                    
       
              );
              
      
      
          } ),
            ElevatedButton(onPressed: (){
          getData();
        },style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
         child: Text("Sumbit")),
           
      
        ],),
      )
     

    );
  }
}