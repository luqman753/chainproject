import 'package:another_flushbar/flushbar.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_final_build/About/AboutBody.dart';
import 'package:flutter_svg/svg.dart';

import '../drawer.dart';
import '../screens/Login/homePage.dart';
import '../screens/Tree/treepage.dart';
import '../screens/home/home.dart';
import '../screens/utils/constants.dart';
import '../screens/utils/size_config.dart';
import '../sharedPrefrence/SharedPref.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
   final _advancedDrawerController = AdvancedDrawerController();

      void _handleMenuButtonPressed() {
      // NOTICE: Manage Advanced Drawer state through the Controller.
      // _advancedDrawerController.value = AdvancedDrawerValue.visible();
      _advancedDrawerController.showDrawer();
    }
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: kPrimaryColor,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: BorderRadius.all(Radius.circular(16)),),
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
                  child:const  Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
      child: Scaffold(
        
        appBar: AppBar(
        title: const Text("About", style: TextStyle(color: Colors.black),),
        centerTitle: true,
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
        body:  AboutBody(),
        
      ),
    );
  
  }
}