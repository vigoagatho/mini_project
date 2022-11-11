import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_books/screens/home_screen.dart';
import 'package:flutter_books/screens/login_register/login_screen.dart';
import 'package:flutter_books/services/favourite_provider.dart';
import 'package:flutter_books/services/user_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
    ChangeNotifierProvider(create: (context) => FavouriteProvider())
  ],
  child: const MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        // debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Sen',
          brightness: Brightness.dark
        ),
        home: LoginScreen(),
      ),
    );
  }
}

