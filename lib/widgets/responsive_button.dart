import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:purple/widgets/app_texts.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key, this.width=120, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive==true?double.maxFinite:width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.deepPurpleAccent),
        child: Row(
          mainAxisAlignment: isResponsive==true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
          children: [
            isResponsive==true?Container(margin: const EdgeInsets.only(left: 20),
                child: AppText(text: 'Buy Now', color: Colors.white,)):Container(),
           // Image.asset('asset/image/PVC.png'),
        ],
        ),
      ),
    );
  }
}
