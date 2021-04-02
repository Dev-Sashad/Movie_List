import 'package:flutter/material.dart';
//Helps to scale size on different device and maintain UI looks

widthSizer(double value, BuildContext context) {
  return MediaQuery.of(context).size.width *
      (value / 414); // width size on figma
}

heightSizer(double value, BuildContext context) {
  return MediaQuery.of(context).size.height *
      (value / 896); // height size on figma
}
