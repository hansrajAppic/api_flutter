import 'dart:convert';

import 'package:api_flutter/json_model/post_model.dart';
import 'package:api_flutter/json_model/test_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
    

class GetApi3 extends StatefulWidget {
  const GetApi3({super.key});
 
  @override
  State<GetApi3> createState() => _GetApi3State();
}

class _GetApi3State extends State<GetApi3> {
  List<Constrectr>postList=[];
 Future<List<Constrectr>>getApi()async{
  final resposne = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
  var data = jsonDecode(resposne.body.toString());
  if(resposne.statusCode ==200){
    // print(data);
    // postList.clear();

 postList.clear();
    for(Map data  in data){
      postList.add(Constrectr.fromJson(data));
    }
    return postList;

    
      postList.add(Constrectr.fromJson(data));
    
    return postList;
    
  }else{
    return postList;

  }

 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("api Course"),
      ),
      body: FutureBuilder(future: getApi(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Text("loding");

          }else{
            return ListView.builder(shrinkWrap: true,
            scrollDirection:  Axis.vertical,
            
              itemCount: postList.length,
              itemBuilder: (BuildContext context, index) {
              return Card(
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
              const Text("Title",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              Text(postList[index].title.toString()),
              SizedBox(height: 5,),
             const Text("Description",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  Text("Description"+postList[index].title.toString()),

                ],)
                  
                
              

            
            );
    
  });
          }
        }

   ) );
  }
}