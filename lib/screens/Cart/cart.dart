
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_final_build/controller/cartController.dart';
import 'package:flutter_final_build/screens/Cart/cart_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../utils/constants.dart';
import '../utils/size_config.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key, this.tag}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final tag;

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController cartController = Get.put(CartController());
 
  
  @override
  void initState() {
    super.initState();
 
    
  }
  
  @override
  Widget build(BuildContext context) {
  double? defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
         leading: IconButton(
        icon: SvgPicture.asset("assets/arrow-long-left.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
        title: const Text("Shopping Cart",
            style: TextStyle(
              color: kTextColor,
            )),
            centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
     
      body: Column(
        children: [
          Expanded(
            // flex:2,
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: 
               Obx(() {
           if (cartController.isLoading.value) {
             return Center(child: Image.asset('assets/ripple.gif'));
           } else {
             return
              ListView(
                children: [
                  ListView.builder(
                      //use shrink wrap true and scrollphysics to avoid error because we are using listview in side listview or column
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: cartController.cartList.value.data!.length,
                      itemBuilder: (context, index) => CartDetail(
                        cart: cartController.cartList.value.data![index]
                           
                          ))
                ],
              );
           }
               })
            )),
          ),

        Expanded(
          flex: 0,
          child: Container(
            height: defaultSize!*10,
            width: MediaQuery.of(context).size.width*1,
          decoration: BoxDecoration(
            color: kSecondaryColor,
            border: Border.all(
              color: Colors.transparent
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20)
            )
          ),
          child: Center(child: 
           Obx(() {
           if (cartController.isLoading.value ) {
             return Center(child: Image.asset('assets/ripple.gif'));
           } else {
             return
          Text("Total Price: RS "+cartController.totalPrice.toString(),
           style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
          );
           }
          
          },
          ),
          ),
        ),
        
        ),
        SizedBox(
          height: defaultSize*1,
        ),
        Expanded(
          flex:0,
          child: SizedBox(
              width: double.infinity,

              child: FlatButton(
                padding: EdgeInsets.all(defaultSize * 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: kPrimaryColor,
                onPressed: (){
                 
  
                },
                child: Text(
                  "Make Payment",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: defaultSize * 1.6,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ),
         SizedBox(
          height: defaultSize*1,
        ),
        ],
      ),
    );
  }
}

