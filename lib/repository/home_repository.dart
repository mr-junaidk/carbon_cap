import 'package:internship_task/data/network/BaseApiServices.dart';
import 'package:internship_task/data/network/NetworkApiServices.dart';
import 'package:internship_task/models/movies_model.dart';
import 'package:internship_task/res/app_url.dart';

class HomeRepository{

  BaseApiServices _apiServices = NetworkApiServices();

  Future<MovieListModel> moviesListApi() async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.moviesApiEndPoint);
      return response = MovieListModel.fromJson(response);
    }catch(e){
      throw e;
    }
  }
}