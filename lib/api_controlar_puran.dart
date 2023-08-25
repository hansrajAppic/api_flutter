import 'dart:convert';


import 'package:api_flutter/json_model/model.dart';
import 'package:http/http.dart' as http;



class ApiController{

  /// Country List Api
  Future<CountryResponse?> countryApi({required String url} ) async {
    CountryResponse? result;
      try{
        final http.Response? response = await getMainApi( url:url);
        if(response?.body != null && response?.statusCode == 200){
          result = CountryResponse.fromJson(json.decode(response!.body.toString()));
        }
        return result;
      }catch(e){
        print("Exception_main1: $e");
        return result;
      }
  }

  /// Get Type Api
  Future<http.Response?> getMainApi({required String url,})async{
    http.Response? response;
    try{
      Map<String, String> headers = {
        "Content-type": "application/json",
      };

      response = await http.get(Uri.parse(url),headers:headers);
      if(response.statusCode == 200) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        return response;
      }
    }catch (e){
      print("Exception_GET:.....$e");
    }
    return null;
  }

  /// Post Type Api
  Future<http.Response?> postMainApi({required String url, required Object body})async{
    http.Response? response;
    try{
      Map<String, String> headers = {
        "Content-type": "application/json",
      };
      response = await http.post(Uri.https(url),body: body,headers: headers);

      if(response.statusCode == 200) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        return response;
      }
    }catch (e){
      print("Exception_POST:.....$e");
    }
    return response;
  }


}
    
