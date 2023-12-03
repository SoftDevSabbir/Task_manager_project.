import 'dart:convert';
import 'dart:developer';
import 'package:crud_app/Ui/Screen/login_screen.dart';
import 'package:crud_app/Ui/controller/auth_controller.dart';
import 'package:crud_app/app.dart';
import 'package:http/http.dart';
import 'package:http/http.dart';
import 'network_reponse.dart';
import 'package:flutter/material.dart';

class NetworkCaller {

  Future<NetworkResponse> PostRequest(String url,
      {Map<String, dynamic>? body, bool isLogin = false}) async {
    try {
      log(url);
      log(body.toString());
      Response response =
          await post(Uri.parse(url), body: jsonEncode(body), headers: {
        'Content-type': 'Application/json',
        'token': AuthController.token.toString(),
      });
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        return NetworkResponse(
            isSuccess: true,
            jsonResponse: jsonDecode(response.body),
            statuscode: 200);
      } else if (response.statusCode == 401) {
        if (isLogin == false) {
          backLogin();
        }
        return NetworkResponse(
            isSuccess: false,
            statuscode: response.statusCode,
            jsonResponse: jsonDecode(response.body));
      } else {
        return NetworkResponse(
            isSuccess: false,
            statuscode: response.statusCode,
            jsonResponse: jsonDecode(response.body));
      }
    } catch (e) {
      return NetworkResponse(isSuccess: false, errorMessage: e.toString());
    }
  }
  Future<dynamic> deleteRequest(String url,
      {Map<String, dynamic>? body,VoidCallback? onUnAuthorize}) async {
    try {
      final Response response = await get(Uri.parse(url), headers: {
        'Content-type': 'application/json',
        'token': AuthController.token.toString(),

      });

      if (response.statusCode == 200 && jsonDecode(response.body)['status'] == 'success') {
        return true;
        //return true;
      } else if (response.statusCode == 401) {
        if (onUnAuthorize != null) {
          onUnAuthorize();
        }
      } else {
        log('Something went wrong ${response.statusCode}');
      }
    } catch (e) {
      return NetworkResponse(isSuccess: false, errorMessage: e.toString());
    }
  }

  Future<NetworkResponse> getRequest(String url) async {
    try {
      log(url);
      Response response =
          await get(Uri.parse(url), headers: {
        'Content-type': 'Application/json',
        'token': AuthController.token.toString(),
      });
      log(response.statusCode.toString());
      log(response.body.toString());
      log(AuthController.token.toString(),);
      if (response.statusCode == 200) {
        return NetworkResponse(
            isSuccess: true,
            jsonResponse: jsonDecode(response.body),
            statuscode: 200);
      } else if (response.statusCode == 401) {
          backLogin();
        return NetworkResponse(
            isSuccess: false,
            statuscode: response.statusCode,
            jsonResponse: jsonDecode(response.body));
      } else {
        return NetworkResponse(
            isSuccess: false,
            statuscode: response.statusCode,
            jsonResponse: jsonDecode(response.body));
      }
    } catch (e) {
      return NetworkResponse(isSuccess: false, errorMessage: e.toString());
    }
  }

  Future<void> backLogin() async {
    await AuthController.clearAuthData();
    Navigator.pushAndRemoveUntil(
        TaskManagerApp.navigatorKey.currentContext!,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
        (route) => false);
  }


}
