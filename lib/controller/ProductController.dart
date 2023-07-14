// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter_final_build/controller/searchTagController.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';

import '../domain/Service.dart';
import '../models/products.dart';
import '../models/searchTag.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = Products().obs;
  var pointValue ="AllProducts".obs;
  // ignore: prefer_typing_uninitialized_variables
  var productTempList=Products().obs;

var buttonValue=false.obs;
var buttonId="".obs;
var tagList= SearchTag().obs;
final SearchtagController searchTagController = Get.put(SearchtagController());

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }
  productNameSearch(String name) {
//Empty then all data store in productList
if (name.isEmpty) {
// productList.value = productTempList as Products;
  fetchProducts();
} else {
//Search must be tempList using
productList.value.data = productTempList.value.data!
.where((element) =>
element.productName!.toLowerCase().contains(name.toLowerCase()))
.toList();
}
}
add(name, id) async {

buttonId.value=id;
if(buttonId.value=="1234")
{
  // searchTagController.fetchTags(name)==""?fetchProducts():
  searchTagController.fetchTags(name);
  pointValue.value="AllProducts";
  fetchProducts();


}
else 

{
  buttonValue.value=true;
  // buttonId.value=id;
  searchTagController.fetchTags(name);
  pointValue.value="CategoryProducts";
}
}

fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products ;
        productTempList.value=products;
      }
    } 
    finally {
     isLoading(false);
    }
  }
}
