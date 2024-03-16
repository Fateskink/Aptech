import 'package:flutter/material.dart';
import 'package:foodapp/pages/login.dart';
import 'package:foodapp/services/token_service.dart';
import 'package:foodapp/services/user_service.dart';
import 'package:get_it/get_it.dart';
import 'package:foodapp/pages/splash.dart';

/*
flutter pub add http shared_preferences get_it


* */
void main() {
  //register services
  GetIt.instance.registerLazySingleton<UserService>(() => UserService());
  GetIt.instance.registerLazySingleton<TokenService>(() => TokenService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //home: Splash(),
      home: Login()
    );
  }
}
