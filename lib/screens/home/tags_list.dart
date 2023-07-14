import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_build/screens/utils/size_config.dart';
import 'package:get/get.dart';

import '../../controller/ProductController.dart';
import '../../controller/tagsController.dart';
import '../utils/constants.dart';

class TagsList extends StatefulWidget {
  const TagsList({ Key? key }) : super(key: key);

  @override
  _TagsListState createState() => _TagsListState();
}

class _TagsListState extends State<TagsList> {

final ProductController productController = Get.put(ProductController());
final TagsController tagsController = Get.put(TagsController());
  @override
  Widget build(BuildContext context) {
     double? defaultSize = SizeConfig.defaultSize;
    return Obx((){
      if (tagsController.isLoading.value) {
        return Center(child: Image.asset('assets/spinner.gif'));
      } else {
        return ListView.builder(
         // reverse: true,
      scrollDirection: Axis.horizontal,
      shrinkWrap:true,
    dragStartBehavior: DragStartBehavior.start,
    
       itemCount: tagsController.tagsList.length,
    
      itemBuilder: (context, index) {
           int itemCount=tagsController.tagsList.length;
                              int reversedIndex = itemCount - 1 - index;

      return   Padding(
        padding:  EdgeInsets.only(left:defaultSize!*0.5),
        child: InkWell(
          onTap: (){
          
            productController.add(tagsController.tagsList[reversedIndex].name.toString().toLowerCase(), tagsController.tagsList[reversedIndex].id.toString());
          },
          child: Container(
          width: defaultSize *15,
          height: defaultSize *30,
          decoration: ShapeDecoration(
            color: tagsController.tagColor==0? kSecondaryColor:kPrimaryColor,
            shape: RoundedRectangleBorder (
              borderRadius: BorderRadius.circular(32.0),
            
            )
            ),
            child: Center(
            child: Text(
              tagsController.tagsList[reversedIndex].name.toString()
             
            )

             ),
            
          ),
        ),
       );
      },
    );
      }
    });
      
  
}}