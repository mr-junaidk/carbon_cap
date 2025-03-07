import 'package:internship_task/data/network/BaseApiServices.dart';
import 'package:internship_task/data/network/NetworkApiServices.dart';
import 'package:internship_task/res/app_url.dart';

class AuthRepository{
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginApiEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.signupApiEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }
}