import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/constants.dart';
import '../utils/size_config.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    Key ?key,
    @required this.product,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final  product;

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    TextStyle lightTextStyle = TextStyle(color: kTextColor.withOpacity(0.6));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultSize! * 2),
      height: defaultSize * 37.5, //375
      width: defaultSize *
          (SizeConfig.orientation == Orientation.landscape ? 35 : 15), //150
    
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              product.productName.toString(), style: lightTextStyle),
            SizedBox(height: defaultSize),
           
            SizedBox(height: defaultSize * 2),
            Text("Available Items", style: lightTextStyle),
            Text(
              product.quantity.toString(),
              style: TextStyle(
                fontSize: defaultSize * 1.6, //16
                fontWeight: FontWeight.bold,
                height: 1.6,
              ),
            ),
            SizedBox(height: defaultSize * 2), //20
            
          ],
        ),
      ),
    );
  }

  Container buildColorBox(double defaultSize,
      {Color? color, bool isActive = false}) {
    return Container(
      margin: EdgeInsets.only(top: defaultSize, right: defaultSize),
      // For  fixed value we can use cont for better performance
      padding: const EdgeInsets.all(5),
      height: defaultSize * 2.4,
      width: defaultSize * 2.4,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: isActive ? SvgPicture.asset("assets/check.svg") :const  SizedBox(),
    );
  }
}
