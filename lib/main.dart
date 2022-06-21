import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/layout/shopLayout.dart';
import 'package:my_shop/modules/login_screen.dart';
import 'package:my_shop/network/local/cache_helper.dart';
import 'package:my_shop/network/remote/dio_helper.dart';
import 'package:my_shop/shared/styles/themes.dart';

import 'cubit/bloc_observer.dart';
import 'modules/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();

  bool onBoard = CacheHelper.getData(key: 'onBoarding') ?? false;

  String token = CacheHelper.getData(key: 'token') ?? '';
  bool isLogged = token.isEmpty ? false : true;

  BlocOverrides.runZoned(
    () {
      runApp(MyApp(
        onBoard: onBoard,
        isLogged: isLogged,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool onBoard;
  final bool isLogged;

  MyApp({
    required this.onBoard,
    required this.isLogged,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      themeMode: ThemeMode.light,
      darkTheme: darkTheme,
      home: onBoard ? (isLogged ? const ShopLayout() :  LoginScreen() ): const OnBoardingScreen(),
    );
  }
}
