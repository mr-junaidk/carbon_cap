import 'package:flutter/cupertino.dart';
import 'package:internship_task/data/response/api_response.dart';
import 'package:internship_task/models/movies_model.dart';
import 'package:internship_task/repository/home_repository.dart';

class HomeViewViewModel with ChangeNotifier{
 final _myRepo = HomeRepository();

 ApiResponse<MovieListModel> moviesList = ApiResponse.loading();

 setMoviesList(ApiResponse<MovieListModel>response){
   moviesList = response;
   notifyListeners();
 }
 Future<void> fetchMoviesListApi() async{
   setMoviesList(ApiResponse.loading());
   _myRepo.moviesListApi().then((value){
     setMoviesList(ApiResponse.completed(value));
     
   }).onError((error, stackTrace){
     setMoviesList(ApiResponse.error(error.toString()));

   });
 }
}