
import 'package:flutter/material.dart';
import 'package:flutter_final_build/drawer.dart';
import 'package:flutter_final_build/screens/Login/signup.dart';
import 'package:flutter_final_build/screens/home/home.dart';
import 'package:flutter_final_build/sharedPrefrence/SharedPref.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future loadFromFuture() async {
    // <fetch data from server. ex. login>
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 0), () async {
     var name= prefs.getString("name").toString();
     String? token =await getToken();
     String? id=await userId();
     print(name);
    
      if (token.toString().isNotEmpty) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>  Home()));
      } 
      else if (token.toString().isEmpty) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
      else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>SignupPage()));
      }
    });}


@override
  void initState() {
    super.initState();
       loadFromFuture();
  }    
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // we will give media query height
          // double.infinity make it big as my parent allows
          // while MediaQuery make it big as per the screen

          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            // even space distribution
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    "Welcome",
                    style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,

                    ),
                    
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("BackSlash Flutter provides extraordinary flutter tutorials. Do Subscribe! ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15,

                  ),)
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/welcome.png")
                  )
                ),
              ),

              Column(
                children: <Widget>[
                  // the login button
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));

                    },
                    // defining the shape
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Text(
                      "Login",
                      style:  TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                      ),
                    ),
                  ),
                  // creating the signup button
                  const SizedBox(height:20),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignupPage()));

                    },
                    color: const Color(0xff0095FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                      ),
                    ),
                  )

                ],
              )



            ],
          ),
        ),
      ),
    );
  }
}

