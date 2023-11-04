import 'dart:convert';
import 'package:http/http.dart' as http;
import '../style/style.dart';

Future<bool> ProductCreateRequest(FormValues) async{
  var URL = Uri.parse("http://crud.teamrabbil.com/api/v1/CreateProduct");
  var PostHeader = {"Content-Type":"application/json"};
  var PostBody = json.encode(FormValues);

  var response =  await http.post(URL, headers:PostHeader, body: PostBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if(resultCode == 200 && resultBody['status'] == "success"){
    SuccessToast("Request Successful");
    return true;
  }
  else{
    ErroToast("Request fail! Try again");
    return false;

  }


}