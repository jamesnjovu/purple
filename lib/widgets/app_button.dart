import 'package:flutter/material.dart';
import 'package:purple/widgets/app_texts.dart';

class AppButtons extends StatelessWidget {
  final Color  color;
  String? text;
  IconData? icon;
  final Color backgroundColor;
  double size;
  final borderColor;
  bool? isIcon;

   AppButtons({Key? key,
     this.isIcon=false,
     this.text ='hi',
     this.icon,
     required this.size,
    required this.color,
    required this.backgroundColor,
    this.borderColor
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor),
      child: isIcon==false?Center(child: AppText(text: text!, color: color,)):Center(child: Icon(icon, color: color,)),
    );
  }
}
