import 'package:flutter/material.dart';
import 'package:foodapp/pages/login.dart';
import 'package:foodapp/pages/register.dart';
import 'package:foodapp/pages/tab/apptab.dart';
import 'package:foodapp/services/user_service.dart';
import 'package:get_it/get_it.dart';
import 'package:foodapp/pages/splash.dart';
import 'package:go_router/go_route'
    'r.dart';

import 'services/category_service.dart';
import 'services/product_service.dart';

/*
flutter pub add http shared_preferences get_it
flutter pub add go_router
flutter pub add intl
flutter pub add build_runner
flutter pub add flutter_layout_grid
* */
void main() {
  //register services
  GetIt.instance.registerLazySingleton<UserService>(() => UserService());
  GetIt.instance.registerLazySingleton<ProductService>(() => ProductService());
  GetIt.instance.registerLazySingleton<CategoryService>(() => CategoryService());
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
            return Login();
          },
        ),
        GoRoute(
          path: 'register',
          builder: (BuildContext context, GoRouterState state) {
            return Register();
          },
        ),
        GoRoute(
          path: 'apptab',
          builder: (BuildContext context, GoRouterState state) {
            return AppTab();
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
      home: AppTab(),
      //home: Login()
    );
  }
}
