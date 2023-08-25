import 'dart:convert';

import 'package:api_flutter/json_model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
    

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
 
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostsModel>postList=[];
 Future<List<PostsModel>>getPostApi()async{
  final resposne = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
  var data = jsonDecode(resposne.body.toString());
  if(resposne.statusCode ==200){
    postList.clear();
    for(Map i in data){
      postList.add(PostsModel.fromJson(i));
    }
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
      body: FutureBuilder(future: getPostApi(),
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