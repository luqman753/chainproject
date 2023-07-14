// import 'dart:math';

// import 'package:chain_networking/controller/balanceController.dart';
// import 'package:chain_networking/screens/Balance/card.dart';
// import 'package:chain_networking/screens/utils/constants.dart';
// import 'package:chain_networking/screens/utils/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Balance extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _ExampleState();
//   }
// }

// class _ExampleState extends State with SingleTickerProviderStateMixin {
//   ///Animation controller
//   AnimationController? _animationController;
//   final BalanceController balanceController = Get.put(BalanceController());

//   @override
//   void initState() {
//     super.initState();
//     //Creating animation controllers
//     _animationController = AnimationController(
//       //Default initial value
//       value: 0.0,
//       //execution time
//       duration: Duration(seconds: 10),
//       //Value range
//       upperBound: 1,
//       lowerBound: -1,
//       vsync: this,
//     );
//     //Repeat execution
//     _animationController!.repeat();
//   }

//   @override
//   void dispose() {
//     //Destruction
//     _animationController!.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     double? defaultSize = SizeConfig.defaultSize;
//     //Gets the size of the current component
//     Size size = MediaQuery
//         .of(context)
//         .size;
//     return Scaffold(
//       backgroundColor:kSecondaryColor,
//       //Allow keyboard pop-up layout file to move up
//       resizeToAvoidBottomInset: true,
//       body: Container(
//         //fill
//         width: size.width,
//         height: size.height,
//         //Cascade
//         child: Stack(
//           children: <Widget>[
//             //Part I water ripple background
//                         buildFirstAnimation(size),



        
//           //  Positioned(
//           //    top:defaultSize!*024,
//           //    left: defaultSize*18,
//           //    child:
//           //  ),
         
//          Positioned(top:defaultSize!*50,
//  left:defaultSize*3,        
//          child: _cardWalletBalance(context)),
//           ],

//         ),
//       ),
//     );
 
//   }
//   AnimatedBuilder buildFirstAnimation(Size size) {
//     return AnimatedBuilder(
//       //Bind animation controller
//       animation: _animationController!,
//       builder: (BuildContext context, Widget ?child) {
//         //Crop component
//         return ClipPath(
//           //Custom clipping path
//           clipper: HeaderClipper(_animationController!.value),
//           //Cropped child Widget
//           child: Container(
//             //height
//             height: size.height * 0.5,
//             //The style of a linear gradient color
//             decoration: BoxDecoration(
//               // color: kSecondaryColor
//               gradient: LinearGradient(
//                 //Direction of linear gradient
//                   begin: Alignment.bottomLeft,
//                   end: Alignment.topRight,
//                   colors: [kSecondaryColor,kPrimaryColor
//                   ]),
//             ),
//           ),
//         );
//       },
//     );
//   }
//   Widget _cardWalletBalance(BuildContext context,
//       ) {
//          double? defaultSize = SizeConfig.defaultSize;
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 5),
//       child: card(
//         width: MediaQuery.of(context).size.width - 50,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 ClipOval(
//                   child: Material(
//                     color: Colors.black87,
//                     child: InkWell(
//                       splashColor: Colors.red, // inkwell color
//                       child: SizedBox(
//                           width: 56,
//                           height: 56,
//                           child: Icon(
//                             Icons.account_balance_wallet,
//                             color: Colors.white,
//                             size: 25.0,
//                           )),
//                       onTap: () {},
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 20),
//                 Expanded(
//                   child: Text('Total Wallet Balance',
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                 ),
//                 Row(
//                   children: [Text('PKR'), ],
//                 )
//               ],
//             ),
//             SizedBox(height: 25),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'total',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 40,
//                       color: Colors.black87),
//                 ),
//                  Obx(() {
//                   if (balanceController.isLoading.value)
//                   return Center(child: Image.asset('assets/spinner.gif', height: defaultSize!*5, ));
//                     else 
//                   return Text(" "+balanceController.balanceList.value.data!.balance!.toStringAsFixed(0), style: TextStyle(fontSize: 45),);
//                    }),
//                 Container(
//                   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
//                   decoration: BoxDecoration(
//                       // color: precent >= 0 ? Colors.green : Colors.pink,
//                       borderRadius: BorderRadius.all(Radius.circular(30))),
//                   child: Text("aav",
//                     // precent >= 0 ? '+ $precent %' : '$precent %',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(height: 10),
            
//           ],
//         ),
//       ),
//     );
//   }

// }

// class HeaderClipper extends CustomClipper<Path> {
//   ///The value is - 1 ~ 1.0
//   double moveFlag = 0;

//   HeaderClipper(this.moveFlag);

//   @override
//   Path getClip(Size size) {
//     //Create Path
//     Path path = Path();
//     //Move to point P0, which is also the starting point of the curve
//     path.lineTo(0, size.height * 0.8);
//     //Calculate the coordinates of control point P1
//     double xCenter = size.width * 0.5 +
//         (size.width * 0.6 + 1) * sin(moveFlag * pi);
//     double yCenter = size.height * 0.8 + 50 * cos(moveFlag*pi);
//     //Construction of second order Bessel curve
//     path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.8);

//     path.lineTo(size.width, 0);
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     //Refresh
//     return true;
//   }
// }
