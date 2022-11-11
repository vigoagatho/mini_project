import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_books/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: ListView(
            padding: EdgeInsets.all(20.0),
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child:
                    Container(
                      // color: Colors.amber,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 70),
                      child: Image.asset('assets/ruang_baca_tp.png', fit: BoxFit.cover,)),
              ),
              SizedBox(
                height: 1,
              ),
              LoginForm()
            ],
          ))
        ],
      ),
    );
  }
}
