import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'UserModel.dart';

class ApiService{

  final apiUrl = 'https://randomuser.me/api/?results=20';
  late List<UserModel> users = [];

  Future <List<UserModel>> getData() async{
    final response = await http.get(Uri.parse(apiUrl));

    try{
      if(response.statusCode == 200){
        if (kDebugMode) {
          print('Connect with Api');
        }
        Map userdata = jsonDecode(response.body);
        List<dynamic> user = userdata['results'];

        for(var item in user){
          users.add(UserModel.fromJson(item));
        }
      }else{
        // print('Something error!');
        Future.error('Something error! \n Status Code - ${response.statusCode}');
      }
    }catch(e){
      Future.error('Something error!\n $e');
      // print('Something error!\n ${e}');
    }
    return users;
  }
}