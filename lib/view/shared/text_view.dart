import 'package:flutter/material.dart';
import 'package:m2p_assignment/res/AppContextExtension.dart';

class MyTextView extends StatelessWidget {
  final String label;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight; 

  const MyTextView({super.key, this.label = "", this.color = Colors.white, this.fontSize = 0,  this.fontWeight = FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    double fSize = fontSize;
    if (fSize == 0) {
      fSize = context.resources.dimension.bigText;
    }
    return Text(label, style: TextStyle(color: color, fontSize: fSize, fontWeight: fontWeight),);
  }
}