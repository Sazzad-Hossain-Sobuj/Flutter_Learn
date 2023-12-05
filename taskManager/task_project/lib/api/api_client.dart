import 'dart:convert';
import 'package:http/http.dart' as http;
import '../style/style.dart';

var BaseURL = "https://task.teamrabbil.com/api/v1";
var RequestHeader = {"Content-type":"application/json"};


Future<bool> loginRequest(Formvalues) async{
  var URL = Uri.parse("${BaseURL}/login");
  var PostBody = json.encode(Formvalues);

  var response = await http.post(URL,headers: RequestHeader, body: PostBody);

  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if(resultCode == 200 && resultBody['status'] == 'success'){
    SuccessToast('Request Success');
    return true;
  }
  else{
    ErrorToast('Request failed! Try again');
    return false;
  }

}
