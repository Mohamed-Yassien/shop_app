import 'package:flutter/material.dart';
import 'package:my_shop/shared/widgets/reusable_text_button.dart';
import 'package:my_shop/shared/widgets/reusable_text_field.dart';

import '../shared/widgets/reusable_button.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LOGIN',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'Login now to browse our offers',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ReusableTextField(
                  controller: emailController,
                  prefixIcon: Icons.email,
                  textLabel: 'Email Address',
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'email must not be empty';
                    }
                  },
                  type: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 15,
                ),
                ReusableTextField(
                  controller: emailController,
                  prefixIcon: Icons.email,
                  textLabel: 'Email Address',
                  suffixIcon: Icons.visibility_off,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'email must not be empty';
                    }
                  },
                  type: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 40,
                ),
                reusableButton(
                  function: () {},
                  text: 'login',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account ?',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    reusableTextButton(
                      text: 'sign up',
                      function: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
