
import 'dart:convert';
import 'dart:developer';

import 'package:crud_app/Ui/controller/auth_controller.dart';
import 'package:http/http.dart';

import 'network_reponse.dart';

class NetworkCaller{
  Future<NetworkResponse> PostRequest(String url,{Map<String,dynamic>? body})async{
    try{
      log(url);
      log(body.toString());
  Response response =await post(Uri.parse(url),body: jsonEncode(body),headers: {
    'Content-type':'Application/json',
    'token':AuthController.token.toString(),
  });
  log(response.statusCode.toString());
  log(response.body.toString());
  if(response.statusCode==200){
    return NetworkResponse(isSuccess: true,

    jsonResponse: jsonDecode(response.body),
      statuscode: 200
    );
  }else{
    return NetworkResponse(isSuccess: false,
    statuscode: response.statusCode,
      jsonResponse: jsonDecode(response.body)
    );
  }
    }
    catch(e){
      return NetworkResponse(isSuccess: false,errorMessage: e.toString());
    }
  }
}
