
import 'package:flutter_final_build/screens/home/product_card.dart';
import 'package:flutter_final_build/screens/home/tags_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_final_build/screens/utils/constants.dart';
import 'package:get/get.dart';

import '../../components/balanceCard.dart';
import '../../components/title_text.dart';
import '../../controller/ProductController.dart';
import '../../controller/searchTagController.dart';
import '../utils/size_config.dart';
class RecommandProducts extends StatefulWidget {
  const RecommandProducts({
    Key? key,
    
  }) : super(key: key);
//  final Function ? press;
  @override
  State<RecommandProducts> createState() => _RecommandProductsState();
}

class _RecommandProductsState extends State<RecommandProducts> {
 
 final ProductController productController = Get.put(ProductController());
 final SearchtagController searchTagController = Get.put(SearchtagController());


 TextEditingController search=TextEditingController();
  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    return 
    Column(
      children: [
SizedBox(
  height: defaultSize!*0.5,
),
                Center(
              child: SizedBox(
                width:defaultSize *35,
                height: defaultSize*5,

                child: TextField(
                  controller: search,
                  cursorColor:kTextColor,
                    decoration: InputDecoration(

                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
        contentPadding: const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
      filled: true,
      hintStyle: TextStyle(color: Colors.grey[800]),
      hintText: "Search Procducts",
      fillColor: kSecondaryColor),
      onChanged:(String str){
                    setState((){
                      productController.productNameSearch(str);
                    });
      // ,
      }),),
                ),
  SizedBox(
    height: defaultSize*1.5,
  ),
   Row(
     children: [
       Padding(
         padding:  EdgeInsets.only(left:defaultSize *1),
         child: const TitleText(title: "Categories"),
       ),
     ],
   ),
    const SizedBox(
     height:10,
   ),
   Row(
     children: [
       SizedBox(
         height: defaultSize*4,
         width: MediaQuery.of(context).size.width*1,
         child: const TagsList()),
     ],
   ),
        Center(child: Padding(
          padding:  EdgeInsets.only(top: defaultSize*1,),
          child: const TitleText(title: "Products For You"),
        )),
    
        Obx((){
          if( searchTagController.tagsList.value.data!.isEmpty &&  productController.pointValue.value=="CategoryProducts"  )
          {
            return   Image.asset("assets/NoProduct.jpg");

          }
          else
          {
            return  Padding(
              padding: EdgeInsets.all(defaultSize * 2), //20
              child:
               Obx(() {
             if (searchTagController.isLoading.value || productController.isLoading.value) {
               return Center (child:  Image.asset('assets/ripple.gif'));
             } else {
               return
                 GridView.builder(
                  // We just turn off grid view scrolling
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  // just for demo
                  
                  itemCount: productController.pointValue.value=="AllProducts"? productController.productList.value.data!.length: searchTagController.tagsList.value.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        SizeConfig.orientation == Orientation.portrait ? 2 : 4,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.693,
                  ),
                  itemBuilder: (context, index) => 
          
                     productController.pointValue.value=="AllProducts"?
                    ProductCard(
                        product: 
                         productController.productList.value.data![index],
                        
                        ): 
            
                       ProductCard(
                        product: 
                          searchTagController.tagsList.value.data![index],
                        
                        )
            
                );
             }} 
            
                )
              );
        
          }
        
         }),
        

      ],
    );
  }
}
