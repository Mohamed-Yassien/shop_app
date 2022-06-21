import 'package:flutter/material.dart';

void navigateToAndFinish({
  required Widget widget,
  required context,
}) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false,
  );
}
