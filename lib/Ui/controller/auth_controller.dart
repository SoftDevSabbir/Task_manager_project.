// import 'dart:convert';
//
// import 'package:crud_app/data_network_caller/models/user_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class AuthController{
//   static String? token;
//   static String? user;
//  static Future<void> saveUserInformation(String t,UserModel model)async {
// SharedPreferences sharedPreferences=SharedPreferences.getInstance() as SharedPreferences;
// await sharedPreferences.setString('token', t);
// await sharedPreferences.setString('user', jsonEncode(model.toJson()));
// token=t;
// user=model as String?;
//   }
//  static Future<void> initializeUserCash()async {
//     SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
//   token=  sharedPreferences.getString('token');
//  user=UserModel.fromJson(jsonDecode(sharedPreferences.getString('user')??'{}')) as String?;
//
//   }
//
//   static Future<bool>cheakAuthState()async {
//     SharedPreferences sharedPreferences= await SharedPreferences.getInstance() as SharedPreferences;
//     String? token= sharedPreferences.getString('token');
//     if(token!=null){
//       await initializeUserCash();
//       return true;
//     }
//     return false;
//   }
//   static Future<void>clearAuthData()async{
//    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
//    await sharedPreferences.clear();
//   }
// }

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
//import 'package:task_manager/data/models/user_model.dart';

import '../../data_network_caller/models/user_model.dart';

class AuthController {
  static String? token;
  static UserModel? user;

  static Future<void> saveUserInformation(String t, UserModel model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', t);
    await sharedPreferences.setString('user', jsonEncode(model.toJson()));
    token = t;
    user = model;
  }

  static Future<void> initializeUserCache() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    user = UserModel.fromJson(jsonDecode(sharedPreferences.getString('user') ?? '{}'));
  }

  static Future<bool> checkAuthState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey('token')) {
      await initializeUserCache();
      return true;
    }
    return false;
  }

  static Future<void> clearAuthData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    token = null;
  }
}