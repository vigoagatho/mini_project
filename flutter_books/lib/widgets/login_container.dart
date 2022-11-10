import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginContainer extends StatelessWidget {
  final Widget child;
  const LoginContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black87,
                blurRadius: 5,
                spreadRadius: 1,
                offset: Offset(4.0, 4.0))
          ]),
      child: child,
    );
  }
}
