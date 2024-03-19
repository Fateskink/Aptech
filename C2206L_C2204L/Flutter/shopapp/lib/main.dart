import 'package:flutter/material.dart';
import 'package:foodapp/pages/login.dart';
import 'package:foodapp/pages/register.dart';
import 'package:foodapp/services/auth_service.dart';
import 'package:foodapp/services/token_service.dart';
import 'package:foodapp/services/user_service.dart';
import 'package:get_it/get_it.dart';
import 'package:foodapp/pages/splash.dart';
import 'package:go_router/go_router.dart';

/*
flutter pub add http shared_preferences get_it
flutter pub add go_router

* */
void main() {
  //register services
  GetIt.instance.registerLazySingleton<UserService>(() => UserService());
  GetIt.instance.registerLazySingleton<TokenService>(() => TokenService());
  GetIt.instance.registerLazySingleton<AuthService>(() => AuthService());
  runApp(const MyApp());
}
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return Splash();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const Login();
          },
        ),
        GoRoute(
          path: 'register',
          builder: (BuildContext context, GoRouterState state) {
            return const Register();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );

    return MaterialApp(
      title: 'Flutter Demo',
      home: Splash(),
      //home: Login()
    );
  }
}
