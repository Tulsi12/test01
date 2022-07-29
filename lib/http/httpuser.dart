import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/model/user.dart';
import 'package:myapp/response/user_resp.dart';

class HttpConnectUser {
  final baseurl = 'http://$ip1:3001/api/users/';
  static String token = '';

  //sending data to the server--- creating user
  Future<bool> registerPost(User user) async {
    Map<String, dynamic> userMap = {
      "username": user.username,
      "email": user.email,
      "password": user.password,
    };

    final response = await post(Uri.parse('$baseurl/register'), body: userMap);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      var usrRes = ResponseUser.fromJson(
          jsonDecode(response.body)); //jsonString-->> jsonMap
      Fluttertoast.showToast(msg: "User created successfully");

      return true;
    } else {
      print("eror");
      return false;
    }
  }

  //sending data to the server- login as user
  Future<bool> loginPosts(String username, String password) async {
    print(" here");
    Map<String, dynamic> loginStudent = {
      'username': username,
      'password': password
    };

    try {
      final response = await post(
          Uri.parse(
            "$baseurl/login",
          ),
          body: loginStudent);

      //json serializing inline
      final jsonData = jsonDecode(response.body) as Map;
      print(jsonData);

      token = jsonData['token'];
//merotoken = jsonData['token'];

      if (token.isNotEmpty) {
        return true;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    print('error');
    return false;
  }
}
