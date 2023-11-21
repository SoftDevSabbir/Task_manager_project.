
class NetworkResponse{
  final int? statuscode;
  final bool isSuccess;
  final Map<String,dynamic>? jsonResponse;
  final String? errorMessage;

  NetworkResponse({this.statuscode=-1,this.jsonResponse,required this.isSuccess,this.errorMessage="Something Went Wrong",});
}

