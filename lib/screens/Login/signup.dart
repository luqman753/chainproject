import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_build/screens/utils/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uiblock/uiblock.dart';
import 'package:http/http.dart' as http;

import '../utils/size_config.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
   TextEditingController userName= TextEditingController(); TextEditingController email= TextEditingController(); TextEditingController cnic= TextEditingController(); TextEditingController parentRef= TextEditingController(); TextEditingController balance= TextEditingController(); TextEditingController password= TextEditingController(); TextEditingController confirmPassword= TextEditingController();
   TextEditingController TxID= TextEditingController();
   TextEditingController Address= TextEditingController();
   TextEditingController accountNo= TextEditingController();
   TextEditingController mobile= TextEditingController();
    dynamic dropdownvalue;   
   

  // List of items in our dropdown menu
  var items = [
  "Islamabad", "Ahmed Nager", "Ahmadpur East", "Ali Khan", "Alipur", "Arifwala", "Attock", "Bhera", "Bhalwal", "Bahawalnagar", "Bahawalpur", "Bhakkar", "Burewala", "Chillianwala", "Chakwal", "Chichawatni", "Chiniot", "Chishtian", "Daska", "Darya Khan", "Dera Ghazi", "Dhaular", "Dina", "Dinga", "Dipalpur", "Faisalabad", "Fateh Jhang", "Ghakhar Mandi", "Gojra","Gawadar", "Gujranwala", "Gujrat", "Gujar Khan", "Hafizabad", "Haroonabad", "Hasilpur", "Haveli", "Lakha", "Jalalpur", "Jattan", "Jampur", "Jaranwala", "Jhang", "Jhelum", "Kalabagh", "Karor Lal", "Kasur", "Kamalia", "Kamoke", "Khanewal", "Khanpur", "Kharian", "Khushab", "Kot Adu", "Jauharabad", "Lahore", "Lalamusa", "Layyah", "Liaquat Pur", "Lodhran", "Malakwal", "Mamoori", "Mailsi", "Mandi Bahauddin", "mian Channu", "Mianwali", "Multan", "Murree", "Muridke", "Mianwali Bangla", "Muzaffargarh","Naran", "Narowal", "Okara", "Renala Khurd", "Pakpattan", "Pattoki", "Pir Mahal", "Qaimpur", "Qila Didar", "Rabwah", "Raiwind", "Rajanpur", "Rahim Yar", "Rawalpindi", "Sadiqabad", "Safdarabad", "Sahiwal", "Sangla Hill", "Sarai Alamgir", "Sargodha", "Shakargarh", "Sheikhupura", "Sialkot", "Sohawa", "Soianwala", "Siranwali", "Talagang", "Taxila", "Toba Tek", "Vehari", "Wah Cantonment", "Wazirabad", "Badin", "Bhirkan", "Rajo Khanani", "Chak", "Dadu", "Digri", "Diplo", "Dokri", "Ghotki", "Haala", "Hyderabad", "Islamkot", "Jacobabad", "Jamshoro", "Jungshahi", "Kandhkot","Kaghan", "Kandiaro", "Karachi", "Kashmore", "Keti Bandar", "Khairpur", "Kotri", "Larkana", "Matiari", "Mehar", "Mirpur Khas", "Mithani", "Mithi", "Mehrabpur", "Moro", "Nagarparkar", "Naudero", "Naushahro Feroze", "Naushara", "Nawabshah", "Nazimabad", "Qambar", "Qasimabad", "Ranipur", "Ratodero", "Rohri", "Sakrand", "Sanghar", "Shahbandar", "Shahdadkot", "Shahdadpur", "Shahpur Chakar", "Shikarpaur", "Sukkur", "Tangwani", "Tando Adam", "Tando Allahyar", "Tando Muhammad", "Tump Balochistan", "Taftan","Thatta", "Umerkot", "Warah", "Abbottabad", "Adezai", "Alpuri", "Akora Khattak", "Ayubia", "Banda Daud", "Bannu", "Batkhela", "Battagram", "Birote", "Chakdara", "Charsadda", "Chitral", "Daggar", "Dargai", "Darya Khan", "era Ismail", "Doaba", "Dir", "Drosh", "Hangu", "Haripur", "Karak", "Kohat", "Kulachi", "Lakki Marwat", "Latamber", "Madyan", "Mansehra", "Mardan", "Mastuj", "Mingora", "Nowshera", "Paharpur", "Pabbi", "Pishin", "Peshawar", "Saidu Sharif", "Shorkot", "Shewa Adda", "Swabi", "Swat", "Tangi", "Tank", "Thall", "Timergara", "Tordher", "Awaran", "Barkhan", "Chagai", "Dera Bugti", "Gwadar", "Harnai", "Jafarabad", "Jhal Magsi", "Kacchi", "Kalat", "Kech", "Kharan", "Khuzdar", "Killa Abdullah", "Killa Saifullah", "Kohlu", "Lasbela", "Lehri", "Loralai","Liaquatpur", "Mastung", "Musakhel", "Nasirabad", "Nushki", "Panjgur", "Pishin valley", "Quetta", "Sherani", "Sibi", "Sohbatpur", "Washuk", "Zhob", "Ziarat" ];

   bool ?obscureText;
     List data = []; //edited line
String? mySelection;
  bool isLoading=false;

   

   void SignupUser() async {
    String link = "https://chainprojectapi.herokuapp.com/rest/api/user/signup";
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
            "email": email.text.toLowerCase(),
            "password": password.text,
            "cnic":cnic.text,
            "balance":balance.text,
            "name":userName.text,
             "activeAmount":500,
          }),
        );
         
        if (response.statusCode == 200) {
          isLoading = false;
          if (response.statusCode == 200) 
          {
            setState(() {
              Navigator.pop(context);
            // Navigator.of(context).pushAndRemoveUntil(
            //     MaterialPageRoute(builder: (context) => LoginPage()),
            //     (Route<dynamic> route) => false);
                 Flushbar(
              title: "Account Created",
              message: "Please Log In",
              duration: const Duration(seconds:3 ),
            ).show(context);
          
          });
        } else {
          isLoading = false;

          UIBlock.unblock(context);
          if (response.statusCode == 502) {
            Flushbar(
              title: "Invalid URL",
              message: "Bad Gateaway",
              duration: const Duration(seconds: 3),
            ).show(context);
          } else {
            Flushbar(
              title: "Incorrect Credentials",
              message: "Please Enter Valid Email and Password",
              duration: const Duration(seconds: 3),
            ).show(context);
          }
        }
      
      } 
  
        }}


@override
  void initState() {

    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        // ignore: deprecated_member_use
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
        padding: const EdgeInsets.symmetric(horizontal: 40),
        height: MediaQuery.of(context).size.height - 50,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text("Sign up",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
        
                  ),),
                  const SizedBox(height: 20,),
                  Text("Create an account, It's free ",
                    style: TextStyle(
                        fontSize: 15,
                        color:Colors.grey[700]),)
        
        
                ],
              ),
              Column(
                children: <Widget>[
                  inputFile( userName, "Username",obscureText= false),
                  inputFile( email, "email",obscureText= false),
                  inputFile( cnic, "cnic",obscureText= false),
                  inputFile( mobile, "Mobile ",obscureText= false),
                  inputFile( TxID, "Tx ID No",obscureText= false),
                   Row(
                     children:const [
                     Text ("City"),
                     ],
                   ),
                   Container(
                     decoration: BoxDecoration(
                      //  border: Border.symmetric(color: kPrimaryColor),
                       borderRadius: BorderRadius.circular(0)
                     ),
                    //  height: 30,
                    //  width: MediaQuery.of(context).size.width*1,
                     child: DropdownButton(
                isExpanded:true,
                
              // Initial Value
              value: dropdownvalue,
                
              // Down Arrow Icon
              // icon: const Icon(Icons.keyboard_arrow_down),    
                
              // Array list of items
              items: items.map((items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: ( newValue) { 
                setState(() {
                  dropdownvalue = newValue;
               
                });
              },
            ),
                   ),
               const SizedBox(
                 height: 10,
               )   ,
                  inputFile( Address, "Address",obscureText= false),
                  inputFile( accountNo, "Account No",obscureText= false),
                  inputFile( parentRef, "Sponsor ID",obscureText= false),
                  inputFile( balance, "Payment amount",obscureText= false),
                  inputFile( password, "password",obscureText= false),
                  inputFile( confirmPassword, "confirmPassword",obscureText= false),

                
                ],
                
              ),
              Container(
                padding: const EdgeInsets.only(top: 3, left: 3),
                decoration:
                BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: const Border(
                      bottom:  BorderSide(color: Colors.black),
                      top:  BorderSide(color: Colors.black),
                      left:  BorderSide(color: Colors.black),
                      right:  BorderSide(color: Colors.black),
        
        
        
                    )
        
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    if(password.text==confirmPassword.text)
                    {
                    SignupUser();
UIBlock.block(context,
           customLoaderChild: Image.asset("assets/spinner.gif", height:defaultSize!*20 , width: defaultSize*10,)
           );
                    }
                    
                    else{
                       Flushbar(
              title: "UnSuccessfull",
              message: "Password does not match",
              duration: const Duration(seconds:2 ),
            ).show(context);
                    }

                  },
                  color: const Color(0xff0095FF),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
        
                  ),
                  child: const Text(
                    "Sign up", style:  TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
        
                  ),
                  ),
        
                ),
        
        
        
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget> [
                   Text("Already have an account?"),
                  Text(" Login", style:TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18
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



// we will be creating a widget for text field
Widget inputFile(
  controller, 
  label,
  obscureText
)
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        controller:controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0,
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
      const SizedBox(height: 10,)
    ],
  );
}

