import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;


class Hemraj extends StatefulWidget {
  const Hemraj({super.key});

  @override
  State<Hemraj> createState() => _HemrajState();
  
}



class _HemrajState extends State<Hemraj> {
  @override

   List<dynamic> data = [];
   List apiDataArray = [];

   

  


  void initState() {
    // TODO: implement initState
    super.initState();
  }
 
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              color: Colors.red,
            ),
            ElevatedButton(
              onPressed: (){
                getData();
              },style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,),
            
             child: Text("Sumbit ${ data.length>0? data[0]:null}",style: TextStyle(color: Colors.white),)),
      
        ],),
      )
    );
  }








Future<void> fetchData() async {
  final url = Uri.parse('http://restapi.adequateshop.com/api/Tourist?page=1'); // Replace with your API endpoint

  try {
    final response = await http.get(url);
        print('response>>>>>>>>>>>>${response}');
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON data
      final jsonData = json.decode(response.body);
      // Now you can work with the jsonData as needed
      print('jsonData>>>>>>>>>>>>>>>${jsonData}');
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception or handle the error accordingly.
      throw Exception('Failed to load data');
    }
  } catch (e) {
    // Handle exceptions or errors that may occur during the request.
    print('Error: $e');
  }
}
 void getData() async {
    print('class call ho rhi h >>>>>>>>>>>>>>>>>>>>>>');

    final response = await http.get(Uri.parse("http://restapi.adequateshop.com/api/Tourist?page=1"));
    debugPrint("Status code is: ${response.statusCode}");

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print('responce>>>>>>>${jsonData["data"].toString()}');
     
      setState(() {
        apiDataArray = jsonData["data"];
          data =  jsonData["data"];
      });
       debugPrint("dgfhfrsdgn>>>>>>>${data.toString()}");
    }
  }

  // void postData() async {
  //   final response = await http.post(Uri.parse(uri), body: {
  //     "title": "Anything",
  //     "body": "Post body",
  //     "userid": "1",
  //   });
  //   debugPrint(response.body);
  //   debugPrint(response.statusCode.toString());
  // }




}