import 'package:flutter_final_build/models/Tags.dart';
import 'package:flutter_final_build/models/searchTag.dart';
import 'package:http/http.dart' as http;

import '../models/balance.dart';
import '../models/cart.dart';
import '../models/products.dart';
import '../sharedPrefrence/SharedPref.dart';

class RemoteServices {
 
//API Calling 
  static Future <Products?> fetchProducts() async {
String link =
        "https://chainprojectapi.herokuapp.com/rest/api/admin/get_all_products";
    var url = Uri.parse(link);
    var response = await http.get(
      url,
      headers: {
        
        "Content-Type": "application/json"
      },
    );

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return productsFromJson(response.body);
      // var jsonString= jsonDecode(response.body);
      // return Products.fromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
  static Future<Cart?> fetchCartData() async {
    String ?token= await getToken();
String link =
        "https://moiz-chain-project.herokuapp.com/rest/api/user/get_cart_products";
    var url = Uri.parse(link);
    var response = await http.get(
      url,
      headers: {
        
        "Content-Type": "application/json",
        "Authorization":"Bearer $token"
      },
    );

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return cartFromJson(response.body);
      // var jsonString= jsonDecode(response.body);
      // return Products.fromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
   static Future<SearchTag?> fetchSearchTags(name) async {
String link =
        "https://moiz-chain-project.herokuapp.com/rest/api/admin/tag_products?tag="+name;
    var url = Uri.parse(link);
    var response = await http.get(
      url,
      headers: {
        
        "Content-Type": "application/json"
      },
    );

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return searchTagFromJson(response.body);
      // var jsonString= jsonDecode(response.body);
      // return Products.fromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }

  static Future  fetchTags() async {
String link =
        "https://chainprojectapi.herokuapp.com/rest/api/admin/get_all_tags";
    var url = Uri.parse(link);
    var response = await http.get(
      url,
      headers: {
        
        "Content-Type": "application/json"
      },
    );

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
    return tagsFromJson(response.body);
      // var jsonString= jsonDecode(response.body);
      // return Tags.fromJson(jsonString[0]);
    } else {
      //show error message
      return null;
    }
  }

  // Balance 
  static Future <Balance?> fetchBalance() async {
    String ? token=await getToken();
String link =
        "https://moiz-chain-project.herokuapp.com/rest/api/user/getbalance";
    var url = Uri.parse(link);
    var response = await http.get(
      url,
      headers: {
        
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",

      },
    );

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
    return balanceFromJson(response.body);
      // var jsonString= jsonDecode(response.body);
      // return Tags.fromJson(jsonString[0]);
    } else {
      //show error message
      return null;
    }
  }
  
}
