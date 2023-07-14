import 'package:another_flushbar/flushbar.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_final_build/alert.dart';
import 'package:flutter_final_build/components/balanceCard.dart';
import 'package:flutter_final_build/screens/Login/homePage.dart';
import 'package:flutter_final_build/screens/Tree/treepage.dart';
import 'package:flutter_final_build/screens/home/home.dart';
import 'package:flutter_final_build/screens/utils/constants.dart';
import 'package:flutter_final_build/screens/utils/size_config.dart';
import 'package:flutter_final_build/sharedPrefrence/SharedPref.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'About/about.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _advancedDrawerController = AdvancedDrawerController();
String ?id, name;
  @override
  initState()  {
    super.initState();
  getPrefsData() ;
  }

 getPrefsData() async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
     id= prefs.getString("id").toString();
     name=prefs.getString("name").toString();
}
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor:kPrimaryColor,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
    
    
        borderRadius:  BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        appBar: AppBar(
          title:  const Text('Dashboard', style: TextStyle(color: Colors.black),
          ),
          
          centerTitle:true,
          actions: [
            
            
             IconButton(onPressed: (){ showAlert(context, id, name); }, icon: const Icon(Icons.perm_device_info), color: Colors.black,)],
          backgroundColor: Colors.white,
          
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return const AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(Icons.menu, color: Colors.black,
                   
                  ),
                
                );
              },
            ),
          ),
          
        ),
        body:const BalanceCard(),
      ),
      drawer:  SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/logoApp.png',
                ),
              ),
              ListTile(
                onTap: () {  Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard()));},
                leading:const  Icon(Icons.dashboard),
                title: const Text('Dashboard'),
              ),
              ListTile(
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));},
                leading: const Icon(Icons.shopping_bag),
                title: const Text('Shop'),
              ),
              ListTile(
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> TreePage())
                );},
                leading:   SvgPicture.asset(
          "assets/tree.svg",color: Colors.white,
          height: SizeConfig.defaultSize! * 2.4, //24
        ),
                // leading: Icon),
                title:const Text('Tree'),
              ),
              ListTile(
                onTap: () async {  
                  String? refcode= await getRefCode();
                  FlutterClipboard.copy(refcode!);
                     Flushbar(
              title: "Refrence Code",
              message: "Copy to Clipboard",
              duration: Duration(seconds:3 ),
            )..show(context);
          
          
                },
                leading:const  Icon(Icons.copy_outlined),
                title: const Text('Refrence Code'),
              ),
              ListTile(
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> const About())
                );},
                leading: const Icon(Icons.account_box_outlined),
                title: const Text('About'),
              ),
              ListTile(
                onTap: () {
                  logoutCleaner();
                   Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) =>const HomePage()),
                                  (Route<dynamic> route) => false,
                                );
                },
                leading: const Icon(Icons.login_outlined),
                title: const Text('Log out'),
              ),
             const Spacer(),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: const Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
showAlert(BuildContext context, id, name) {
    showDialog(
      // barrierColor: kPrimaryColor,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title:  Text("Dear "+ name.toString() + ". Your Refreal Link is "),
        actions: <Widget>[

Padding(
  padding:  const EdgeInsets.only(left:7),
  child:   Row(
  
    mainAxisAlignment: MainAxisAlignment.start,
  
    children: [
      
  
          InkWell(
            onTap: (){
              FlutterClipboard.copy(id.toString());
            },
            child: Text(id.toString(),style: const  TextStyle(color: kPrimaryColor),)),
  
    ],
  
  ),
),
          FlatButton(

            child:   const Text("OK", style: TextStyle(color: kPrimaryColor),),
            onPressed: () {
              Navigator.of(context).pop();
            },
            
          ),
          
        ],
      );
     },
    );
  }