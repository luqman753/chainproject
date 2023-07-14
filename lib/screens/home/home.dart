import 'package:another_flushbar/flushbar.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_final_build/components/balanceCard.dart';
import 'package:flutter_final_build/drawer.dart';
import 'package:flutter_final_build/screens/Login/homePage.dart';
import 'package:flutter_final_build/screens/Tree/treepage.dart';
import 'package:flutter_final_build/screens/utils/constants.dart';
import 'package:flutter_final_build/sharedPrefrence/SharedPref.dart';
import 'package:flutter_svg/svg.dart';
import '../../About/about.dart';
import '../utils/size_config.dart';
import 'home_body.dart';

class Home extends StatefulWidget {
    const Home({Key? key}) : super(key: key);
  
    @override
    _HomeState createState() => _HomeState();
  }
  
  class _HomeState extends State<Home> {
      final _advancedDrawerController = AdvancedDrawerController();

      void _handleMenuButtonPressed() {
      // NOTICE: Manage Advanced Drawer state through the Controller.
      // _advancedDrawerController.value = AdvancedDrawerValue.visible();
      _advancedDrawerController.showDrawer();
    }
     @override
  Widget build(BuildContext context) {
    // It help us to  make our UI responsive
    SizeConfig().init(context);
    return 
    AdvancedDrawer(
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
              duration: const Duration(seconds:3 ),
            ).show(context);
          
          
                },
                leading:const  Icon(Icons.copy_outlined),
                title: const Text('Refrence Code'),
              ),
              ListTile(
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> About()));},
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
        title: const Text("Shop", style: TextStyle(color: Colors.black),),
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
        body: Body(),
        
      ),
    );
  }
  }
  //  AppBar buildAppBar( context) {
  //   return AppBar(
      
  //     actions: <Widget>[
  //       IconButton(
  //         icon: SvgPicture.asset(
  //           "assets/tree.svg",
  //           height: SizeConfig.defaultSize! * 2.4, //24
  //         ),
  //         onPressed: () {
  //           Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) =>  TreePage ()),
  // );

  
  //         },
  //       ),
       
  //       SizedBox(width: SizeConfig.defaultSize),
  //     ],
  //   );
  // }