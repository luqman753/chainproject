import 'package:flutter/material.dart';
import 'package:flutter_final_build/drawer.dart';
import 'package:flutter_final_build/screens/Login/homePage.dart';
import 'package:flutter_final_build/screens/home/home.dart';
import 'package:flutter_final_build/screens/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

        debugShowCheckedModeBanner: false,
 theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme:
            GoogleFonts.dmSansTextTheme().apply(displayColor: kTextColor),
    
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          brightness: Brightness.light,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  HomePage(),
    );
  }
}


