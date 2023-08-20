import 'package:disability/helper_widget/colors.dart';
import 'package:disability/screens/authentication/Login.dart';
import 'package:disability/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: DisabilityColors.mint,
        primarySwatch:Colors.cyan,
        textTheme:
        TextTheme(displayMedium: TextStyle(color: DisabilityColors.textDarkGrey)),
        appBarTheme: AppBarTheme(
            elevation: 0,
            centerTitle: true,
            color: Colors.white,
            ),
      ),
      initialRoute: '/', // Set the initial route to '/'
      routes: {
        '/': (context) => SplashScreen(), // Define the route for LoginDemo
        // Add more routes here if you have additional screens
      },
    );
  }
}
