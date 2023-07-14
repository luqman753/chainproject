import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../controller/cartController.dart';
import '../../sharedPrefrence/SharedPref.dart';
import '../utils/constants.dart';
import '../utils/size_config.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({
    Key? key,
    @required this.product,
    this.press,
  }) : super(key: key);

  final  product;
  final Function? press;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  int value=1;
    // ignore: prefer_typing_uninitialized_variables
    var price;
  //  var 
  @override
  void initState() {
    
    super.initState();
    
    price=widget.product.salePrice;
  }
  Future addtoCart() async{
    String ? token= await getToken();
    String link = "https://moiz-chain-project.herokuapp.com/rest/api/user/add_to_cart";

        var response = await http.post(
          Uri.parse(link),
          headers: {
            "Content-Type": "application/json",
            "Authorization":"Bearer $token",
          },
          body: jsonEncode(<String, dynamic>{
            "productId": widget.product.id.toString(),
            "quantity": value,
            "price":price
            
          }),
        );
         
    if (response.statusCode == 200) {
final CartController cartController = Get.put(CartController());          Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          title: "Success",
          message: "Added to Cart Successfully",
          duration: const Duration(seconds: 3),
              ).show(context);
          var data = json.decode(response.body);
           cartController.fetchCart();
            return data;
    
     }
    else {
      
      Flushbar(
        title: "Failed",
        message: "Error Occured",
        duration:const Duration(seconds: 3),
      ).show(context);

      // ignore: avoid_print
      print("Exception");
      throw Error;
    }
  }
  

  // add() as
  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    return Container(
      constraints: BoxConstraints(minHeight: defaultSize!* 44),
      padding: EdgeInsets.only(
        top: defaultSize * 9, //90
        left: defaultSize * 2, //20
        right: defaultSize * 2,
      ),
      // height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(defaultSize * 1.2),
          topRight: Radius.circular(defaultSize * 1.2),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.product.tags.toString(),
              style: TextStyle(
                fontSize: defaultSize * 1.8,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: defaultSize * 3),
            Text(
              "Rs " +price.toString()+" Only",
              style: TextStyle(
                color: kTextColor.withOpacity(0.7),
                height: 1.5,
              ),
            ),

            SizedBox(height: defaultSize * 5),
            // Text(product.description.toString()),
               Row(
                   mainAxisAlignment:MainAxisAlignment.end,
                 children: [  
                   
                    InkWell(
                              onTap: () {
                           setState(() {
                             if(value>1)
                             {
                               value--;
                                price -=widget.product.salePrice;
                             }
                             else{
                               value==1;
                             }
                           });
                              },
                              child: Container(
                                height: defaultSize*3,
                                width: defaultSize*3,
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: const Icon(
                                  Icons.remove,
                                  color: kSecondaryColor,
                                ),
                              ),
                            ),
                           
                            Padding(
                            padding: EdgeInsets.only(left: defaultSize*1, right: defaultSize*1),
                              child: Text(value.toString())),
                                  InkWell(
                                
                                  onTap: () {
                                setState(() {
                                      
                                    if(value>=1)
                                    {
                                    value++;
                                    price +=widget.product.salePrice;
                                      
                                    }
                                    });
                                  },
                                  child: Container(
                                    height: defaultSize*3,
                                    width: defaultSize*3,
                                    decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius: BorderRadius.circular(10.0)),
                                    child: const Icon(
                                      Icons.add,
                                      color: kSecondaryColor,
                                    ),
                                  ),
                                ),
                 ],
               ),
               SizedBox(height:defaultSize*3,),
            SizedBox(
              width: double.infinity,

              child: FlatButton(
                padding: EdgeInsets.all(defaultSize * 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: kPrimaryColor,
                onPressed: (){
                  addtoCart();
  
                },
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: defaultSize * 1.6,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
