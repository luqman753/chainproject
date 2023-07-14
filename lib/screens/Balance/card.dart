import 'package:flutter/material.dart';

import '../utils/constants.dart';

Widget card(BuildContext context, 
    {
      double height= 150, double width = double.infinity, double padding = 20, Widget ?child}) {
  return Container(
    height: height,
    width: width,
    padding: EdgeInsets.all(padding),
    decoration: const BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(15))),
    child: child,
  );
}
