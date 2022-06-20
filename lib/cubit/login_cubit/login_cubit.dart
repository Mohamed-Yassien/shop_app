import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/cubit/login_cubit/login_states.dart';
import 'package:my_shop/network/endpoints.dart';
import 'package:my_shop/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData passwordIcon = Icons.visibility_off;

  changePasswordState() {
    isPassword = !isPassword;
    passwordIcon = isPassword ? Icons.visibility_off : Icons.visibility;
    emit(LoginChangePasswordVisibility());
  }

  void userLogin({
    required String email,
    required String password,
  }){
    emit(LoginLoadingState());

    DioHelper.postData(url: LOGIN_END_POINT, data: {
      'email': email,
      'password': password,
    }).then((value) {
      print(value.toString());
      emit(LoginSuccessState());
    }).catchError(
      (error) {
        print(error.toString());
        emit(LoginErrorState(error));
      },
    );
  }
}
