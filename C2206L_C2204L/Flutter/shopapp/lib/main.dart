import 'package:flutter/material.dart';
import 'package:foodapp/pages/login.dart';
import 'package:foodapp/pages/register.dart';
import 'package:foodapp/pages/tab/apptab.dart';
import 'package:foodapp/services/user_service.dart';
import 'package:get_it/get_it.dart';
import 'package:foodapp/pages/splash.dart';
import 'package:go_router/go_route'
    'r.dart';

import 'pages/detail_product/detail_product.dart';
import 'services/category_service.dart';
import 'services/product_service.dart';

/*
flutter pub add http shared_preferences get_it
flutter pub add go_router
flutter pub add intl
flutter pub add build_runner
flutter pub add loading_animation_widget
flutter pub add carousel_slider
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
    var theme = ThemeData(
      textTheme: const TextTheme(
          bodySmall: TextStyle(
            fontSize: 14, // Normal text size
            // You can also set other properties like fontFamily, fontWeight, etc.
          ),
          bodyMedium: TextStyle(
            fontSize: 16, // Normal text size
          ),
          bodyLarge: TextStyle(
            fontSize: 20, // Normal text size
            // You can also set other properties like fontFamily, fontWeight, etc.
        )
      ),
    );
    /*
    return MaterialApp.router(
      routerConfig: _router,
      theme: theme
    );
    */
    return MaterialApp(
      title: 'Flutter Demo',
        theme: theme,
      //home: AppTab(),
      //home: Login()
      home:DetailProduct()
    );
  }
}
