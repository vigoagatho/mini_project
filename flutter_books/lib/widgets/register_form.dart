import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_books/screens/login_register/login_screen.dart';
import 'package:flutter_books/services/user_provider.dart';
import 'package:flutter_books/widgets/login_container.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  void _signUpUser(String email, String password, BuildContext context)async{
    UserProvider _currentUser = Provider.of<UserProvider>(context, listen: false);

    try {
      if(await _currentUser.signUpUser(email, password)){
        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoginContainer(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            child: Text(
              'Register',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            controller: _fullNameController,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                prefixIcon: Icon(Icons.person_outline),
                hintText: 'Full Name'),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                prefixIcon: Icon(Icons.alternate_email),
                hintText: 'Email'),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                prefixIcon: Icon(Icons.lock_outline),
                hintText: 'Password'),
                obscureText: true,
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: _confirmPasswordController,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                prefixIcon: Icon(Icons.lock_outline),
                hintText: 'Confirm Password'),
                obscureText: true,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              if(_passwordController.text == _confirmPasswordController.text){
                _signUpUser(_emailController.text, _passwordController.text, context);
              }
              else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Password Not Match!'),
                      duration: Duration(seconds: 1),
                      behavior: SnackBarBehavior.floating,
                    ));
              }
            },
            child: Text('Register'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber.shade800,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account?'),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  'Log In',
                  style: TextStyle(color: Colors.amber.shade800),
                ),
              )
            ],
          )
          
        ],
      ),
    );
  }
}