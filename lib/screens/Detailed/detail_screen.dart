import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Cart/cart.dart';
import '../utils/constants.dart';
import '../utils/size_config.dart';
import 'detail_body.dart';


class DetailsScreen extends StatefulWidget {

// Thats means we have to  pass it
  const DetailsScreen({Key ?key, @required this.product}) : super(key: key);
// ignore: prefer_typing_uninitialized_variables
final product;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: buildAppBar(context),
      body: Body(product: widget.product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset("assets/arrow-long-left.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/bag.svg", color: Colors.black,),
          onPressed: () { Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const CartScreen()),
  );},
        ),
        SizedBox(width: SizeConfig.defaultSize),
      ],
    );
  }
}
