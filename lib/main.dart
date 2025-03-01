import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internship_task/utils/routes/routes.dart';
import 'package:internship_task/viewmodel/auth_view_model.dart';
import 'package:internship_task/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';
import 'utils/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
      ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => UserViewModel())
    ],
    child: const ScreenUtilInit(
      designSize: Size(1440, 2560),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),

    ),
    );
  }
}
