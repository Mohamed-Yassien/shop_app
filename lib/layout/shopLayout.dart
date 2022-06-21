import 'package:flutter/material.dart';
import 'package:my_shop/modules/login_screen.dart';
import 'package:my_shop/network/local/cache_helper.dart';
import 'package:my_shop/shared/methods.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salla'),
        actions: [
          TextButton(
            onPressed: () {
              CacheHelper.remove(key: 'token').then(
                (value) => navigateToAndFinish(
                  widget: LoginScreen(),
                  context: context,
                ),
              );
            },
            child: Text('Log Out'),
          ),
        ],
      ),
    );
  }
}
