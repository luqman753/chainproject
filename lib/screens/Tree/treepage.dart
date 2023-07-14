import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_final_build/models/treeNode.dart';
import 'package:flutter_final_build/screens/Login/homePage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:list_treeview/tree/controller/tree_controller.dart';
import 'package:list_treeview/tree/node/tree_node.dart';
import 'package:list_treeview/tree/tree_view.dart';
import 'package:http/http.dart' as http;

import '../../About/about.dart';
import '../../drawer.dart';
import '../../sharedPrefrence/SharedPref.dart';
import '../home/home.dart';
import '../utils/constants.dart';
import '../utils/size_config.dart';

class TreePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TreePageState();
  }
}

class _TreePageState extends State<TreePage>
    with SingleTickerProviderStateMixin {
  TreeViewController? _controller;
  bool _isSuccess = false;
  List point =[];
  int? colorValue;
    Future? _value;
// bool _isLoading=false;
  @override
  void initState() {

    super.initState();

    ///The controller must be initialized when the treeView create
    _controller = TreeViewController();

    _value=getData();
  }

  Future getData() async {
    // print('start get data');
    // _isSuccess = false;
    // await Future.delayed(Duration(seconds: 2));

    String? token = await   getToken();
    String? refCode= await getRefCode();
     String link =
        "https://chainprojectapi.herokuapp.com/rest/api/user/getchild?refcode="+refCode.toString();
        // qJQsjV";
    var url = Uri.parse(link);
    var response = await http.get(
      url,
      headers: {
        
        "Content-Type": "application/json","Authorization": "Bearer $token",
      },
    );

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var results = json.decode(response.body);
      print(response.body);
      print(response.statusCode);
      // return results;
      
      String ? name=await getUserName();
    var treeValue = TreeNodeData(name: name.toString());
    var datas;
    for(int i=0; i<results["data"].length;i++)
    {
        datas=TreeNodeData(
        name: results["data"][i]["name"], levelNumber: results["data"][i]["level"] , id:results["data"][i]["_id"], cnic:results["data"][i]["cnic"], email: results["data"][i]["email"], referenceCode: results["data"][i]["referenceCode"], parentReference: results["data"][i]["parentReference"], balance:results["data"][i]["balance"]);
        treeValue.addChild(datas);

    }
  
    

    /// set data
    _controller!.treeData([treeValue]);
    print('set treeData suceess');

    setState(() {
      _isSuccess = true;
    });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
        final _advancedDrawerController = AdvancedDrawerController();

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
  /// Add
  Future add (dynamic dataNode, index) async {
     
if(!point.contains(dataNode.id.toString()))
{
    point.add(dataNode.id.toString());
       String? token = await getToken();
       String link =
        "https://chainprojectapi.herokuapp.com/rest/api/user/getchild?refcode="+dataNode.referenceCode.toString();
    var url = Uri.parse(link);
    var response = await http.get(
      url,
      headers: {
        
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
setState(() {
  
});
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      var results = json.decode(response.body);
      
      // print(response.body);
      // print(response.statusCode);
      // var datas;
       var newNode;
        if(results["data"].length==0 && index!=0)
        { 
          
          Flushbar(
              title: "No Data",
              message: "This User does not contain any refrence child ",
              duration: const Duration(seconds:3 ),
            ).show(context);
       

        }
        else{
for(int i=0; i<results["data"].length;i++)
      {
      newNode=TreeNodeData(
        name: results["data"][i]["name"], levelNumber: results["data"][i]["level"] , id:results["data"][i]["_id"], cnic:results["data"][i]["cnic"], email: results["data"][i]["email"], referenceCode: results["data"][i]["refrenceCode"], parentReference: results["data"][i]["parentReference"], balance:results["data"][i]["balance"]);
    
       _controller!.insertAtFront(dataNode, newNode);
    setState(() {
      //  _isSuccess = true;
    });
    }
    
    }
        }
      
  
}
       
     
    }

  void delete(dynamic item) {
    _controller!.removeItem(item);
  }

  void select(dynamic item) {
    _controller!.selectItem(item);
  }

  void selectAllChild(dynamic item) {
    _controller!.selectAllChild(item);
  }

  @override
  Widget build(BuildContext context) {
   SizeConfig().init(context);
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
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> const Home()));},
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
                style:const  TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: const  Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
      child: Scaffold(
        
        appBar: AppBar(
        title: const Text("Tree", style: TextStyle(color: Colors.black),),
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
      body:FutureBuilder(
  future: _value,
  builder: (
      BuildContext context,
      AsyncSnapshot snapshot,
      ) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return getProgressView();
    } else if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        return const Text('Error');
      } else if (snapshot.hasData) {
        return Divider();
       
      } else {
        return  ListTreeView(
          toggleNodeOnTap: true,
          // shrinkWrap: true,
          padding: const EdgeInsets.all(0),
          itemBuilder: (BuildContext context, NodeData data) {
            TreeNodeData item = data as TreeNodeData;
            return Padding(
              padding:  const EdgeInsets.only(top:5),
              child: 
               Container(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
          decoration: BoxDecoration(
              color: colorValue!=data.index?kSecondaryColor:kPrimaryColor,
              borderRadius: BorderRadius.circular(15.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name: "+ item.name.toString(),

                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:Colors.black
                      ),
                    ),
                    // Text(
                    //   "Quantity: "+widget.cart.quantity.toString(),
                    //   maxLines: 2,
                    //   style: const TextStyle(
                    //     fontSize: 15,
                    //   ),
                    // ),
                   
                    item.email!=null?Text("Email: "+item.email.toString()):const Text(""),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                      item.levelNumber!=null ? Text(
                          "level: "+item.levelNumber.toString(),
                          style: const TextStyle(
                            fontSize: 15,
                            // color: kPrimaryColor,
                            // fontWeight: FontWeight.bold,
                          ),
                        ):const Text(""),
                        
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),

        
        ),
             
              // Container(
              //   height: 55,
               
              //   padding: const EdgeInsets.only(left: 16),
                
              //   decoration:  BoxDecoration(
              //   color: colorValue!=data.index?kSecondaryColor:kPrimaryColor,
              //    borderRadius:const BorderRadius.all(Radius.circular(20))
              //      ),
                 
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children:[
              //       const SizedBox(height: 10,),
              //       Row(
              //         children:  [
              //           const Icon(
              //                               Icons.arrow_right_outlined,
              //                               size: 30,
                                            
              //                             ),
              //                               Text(item.name.toString()),
              //         ],
              //       ),
                  
                  
                   
              //     ],
              //   ),
              // ),
           
            );
          },
          onTap: (NodeData data) {
           
            if(colorValue!=data.index)
            {
           
            colorValue=data.index;
            }
            _value=add(data,  data.index);
            
          },
          // onLongPress: (data) {
          //   delete(data);
          // },
          controller: _controller,
        );
       
      }
    } else {
      return getProgressView();
      // Text('State: ${snapshot.connectionState}');
    }
  },
),
    ));
  }
    
  }

  Widget getProgressView() {
    return Center(child: Image.asset("assets/spinner.gif"));
  }


