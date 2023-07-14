import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

import '../domain/Service.dart';
import '../models/cart.dart';
import '../sharedPrefrence/SharedPref.dart';


class CartController extends GetxController {
  var isLoading = true.obs;
var cartList = Cart().obs;
  var pointValue = 0.obs;
   var  totalPrice=0.obs;

  @override
  void onInit() {
    fetchCart();
    super.onInit();
  }
fetchCart() async {
    try {
      isLoading(true);
      var cart = await RemoteServices.fetchCartData();
      if (cart != null) {
        cartList.value = cart;
    totalPrice.value=0;

   for(int i=0;i<cartList.value.data!.length;i++)
    {
totalPrice +=cartList.value.data![i].price!;
    }
      }
    } finally {
      isLoading(false);
    }
   
  }
 deleteItem(id) async {
 String? token = await getToken();

    String link =
        "https://moiz-chain-project.herokuapp.com/rest/api/user/remove_from_cart";
    var url = Uri.parse(link);
    var response = await http.delete(
      url,
      headers: {
        "Authorization": "Bearer $token",
      },
       body: jsonEncode(<String, dynamic>{
            "productId": id.toString(),
            
            
          }),
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var productData = json.decode(response.body);
      fetchCart();
    

      

      return productData[0];
    } else {
      print("Exception");
      throw Error;
    }

 }

  
  

}
