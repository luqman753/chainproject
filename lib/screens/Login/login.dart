import 'dart:convert';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_build/screens/Login/signup.dart';
import 'package:flutter_final_build/screens/home/home.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uiblock/uiblock.dart';
import 'package:http/http.dart' as http;

import '../utils/size_config.dart';


class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email= TextEditingController();

  TextEditingController password=TextEditingController();
  bool isLoading=false;
   void loginUser() async {
    String link = "https://moiz-chain-project.herokuapp.com/rest/api/user/login";
    // "${getCloudUrl()}​/api​/ShipmentOrder​/getfedexorderlist";
    FocusScope.of(context).unfocus();

    if (email.text.isNotEmpty &&
        password.text.isNotEmpty) {
      // print(loginUrl);
      
        // UIBlock.block(context);
        var response = await http.post(
          Uri.parse(link),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(<String, dynamic>{
            "email": email.text.trim(),
            "password": password.text.toString()
          }),
        );
         
        if (response.statusCode == 200) {
          isLoading = false;
         
          var jsonresponse = json.decode(response.body);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("name", jsonresponse['name']);
          prefs.setString("token", jsonresponse["accessToken"]);
          prefs.setString("id", jsonresponse["_id"]);
          prefs.setString("refCode", jsonresponse["referenceCode"]);
          // if (response.statusCode == 200) 
          // {
            setState(() {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const  Home()),
                (Route<dynamic> route) => false);
                 Flushbar(
              title: "Successfull",
              message: "Loggen In",
              duration: Duration(seconds:3 ),
            )..show(context);
          
          });
         }
        else if(response.statusCode==401)
        {
          UIBlock.unblock(context);
              Flushbar(
              title: "UnSuccessfull",
              message: "Please enter correct credentials",
              duration: Duration(seconds:3 ),
            )..show(context); 
        }
        
        
         else  {
          isLoading = false;

          UIBlock.unblock(context);
          if (response.statusCode == 502) {
            Flushbar(
              title: "Invalid URL",
              message: "Bad Gateaway",
              duration: Duration(seconds: 3),
            )..show(context);
          } else {
            //var responseJson = json.decode(response.body);
            Flushbar(
              title: "Incorrect Credentials",
              message: "Please Enter Valid Email and Password",
              duration: Duration(seconds: 3),
            )..show(context);
          }
        }
      
      } 
   
      
     
}
  @override
  Widget build(BuildContext context) {
    bool obscureText;
     double? defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
          leading: IconButton(
        icon: SvgPicture.asset("assets/arrow-long-left.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Login",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Text("Login to your account",
                    style: TextStyle(
                      fontSize: 15,
                    color:Colors.grey[700]),)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      inputFile( "Email",email, obscureText= false,),
                      // inputFile(label: "Password",obscureText: true,password)
                      inputFile("password", password, obscureText=true)
                    ],
                  ),
                ),
                  Padding(padding:
                  EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration:
                        BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),

                          )



                        ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          print(email.text);
                          loginUser();
                            UIBlock.block(context,
           customLoaderChild: Image.asset("assets/spinner.gif",)
           );
                                  },
                        color: Color(0xff0095FF),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),

                        ),
                        
                        child: Text(
                          "Login", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,

                        ),
                        ),

                      ),
                    ),
                  ), 

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?"),
                    InkWell(
                      onTap: (){Navigator.push(context, MaterialPageRoute( builder: (context) => SignupPage()));},
                      child: Text(" Sign up", style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                    
                      ),),
                    )
                  ],
                ),

                Container(
                  padding: EdgeInsets.only(top: 100),
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/background.png"),
                      fit: BoxFit.fitHeight
                    ),

                  ),
                )

              ],
            ))
          ],
        ),
      ),
    );
  }
}
Widget inputFile( 
  label,
  controller,
  obscureText,
 )
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color:Colors.black87
        ),

      ),
      SizedBox(
        height: 5,
      ),
      TextField(
      controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,
          horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400
            ),

          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400)
          )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}



// we will be creating a widget for text field
   