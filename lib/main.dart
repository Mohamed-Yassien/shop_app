import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/network/remote/dio_helper.dart';
import 'package:my_shop/shared/styles/themes.dart';

import 'cubit/bloc_observer.dart';
import 'modules/on_boarding_screen.dart';

void main() {
  DioHelper.init();

  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      themeMode: ThemeMode.light,
      darkTheme: darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}
