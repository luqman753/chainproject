
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/ProductController.dart';
import '../utils/size_config.dart';
import 'grid.dart';


class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final ProductController productController = Get.put(ProductController());
  
  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    // It enables scrolling
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
            
            // Right Now product is our demo product
             Obx(() {
                if (productController.isLoading.value) {
                  return Center(child: Image.asset('assets/ripple.gif'));
                } else {
                  return const  RecommandProducts();
                }
        }),
        
        
        
           
          ],
        ),
      ),
    );
  }
}
