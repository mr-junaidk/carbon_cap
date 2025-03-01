import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:internship_task/models/user_model.dart';
import 'package:internship_task/repository/auth_repository.dart';
import 'package:internship_task/utils/routes/routes_name.dart';
import 'package:internship_task/utils/utils.dart';
import 'package:internship_task/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _registerLoading = false;
  bool get registerLoading => _registerLoading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  setRegisterLoading(bool value){
    _registerLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async{
    setLoading(true);

    _myRepo.loginApi(data).then((value){
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveUser(
        UserModel(
          token: value['token'].toString()
        )
      );
      Utils.flushBarErrorMessage('Login Successful', context);
      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace){
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if(kDebugMode){
        print(error.toString());
      }

    });
  }

  Future<void> registerApi(dynamic data, BuildContext context) async{
    setRegisterLoading(true);

    _myRepo.registerApi(data).then((value){
      setRegisterLoading(false);
      Utils.flushBarErrorMessage('Registration Successful', context);
      Navigator.pushNamed(context, RoutesName.login);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace){
      setRegisterLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if(kDebugMode){
        print(error.toString());
      }

    });
  }
}