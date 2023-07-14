import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../../controller/cartController.dart';
import '../utils/constants.dart';
import '../utils/size_config.dart';

class CartDetail extends StatefulWidget {
  const CartDetail({
    Key? key,
    required this.cart,
    
  }) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final cart ;

  @override
  State<CartDetail> createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> {
  // final VoidCallback press;
  final CartController cartController = Get.put(CartController());

  // http://localhost:5000/rest/api/user/remove_from_car
  @override
  Widget build(BuildContext context) {
    
    double? defaultSize = SizeConfig.defaultSize;
    return 
    Padding(
      padding:  EdgeInsets.symmetric(vertical:defaultSize!*1),
      child: InkWell(
        onTap: (){},
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
          decoration: BoxDecoration(
              color: kSecondaryColor,
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
                      widget.cart.productName.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                    Text(
                      "Quantity: "+widget.cart.quantity.toString(),
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rs "+widget.cart.price.toString(),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                           
                            ElevatedButton(onPressed: (){ 
                              cartController.deleteItem(widget.cart.productId.toString());
     
                            }, child: const Text("Remove"))
                         
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}