 import 'package:flutter/material.dart';
import 'package:purple/widgets/app_button.dart';
import 'package:purple/widgets/app_large_texts.dart';
import 'package:purple/widgets/app_texts.dart';
import 'package:purple/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex=-1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/ribbons.jpg'),
                      fit: BoxFit.cover,
                    )
                  ),

            ),
            ),
            Positioned(
                left: 20,
                top: 50,
                child: Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.menu),

                      color: Colors.white,
                    ),

                  ],
                )),
            Positioned(
              top: 320,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(text: 'Ribbons', color: Colors.black.withOpacity(0.8),),
                          AppLargeText(text: 'K1500', color: Colors.blueAccent,),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Wrap(
                              children: List.generate(5, (index) {
                                return Icon(Icons.star, color: Colors.yellow,);
                              })

                          ),
                          SizedBox(width: 10,),
                          AppText(text: '(5.0)', color: Colors.black54,)
                        ],
                      ),
                      SizedBox(height: 25,),
                      
                      AppLargeText(text: 'YMCKO Ribbons', color: Colors.black, size: 20,),
                      SizedBox(height: 5,),
                      AppText(text: 'IDP SMART YMCKO RIBBON (250 PRINTS)', color: Colors.black,),
                      SizedBox(height: 10,),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: (){
                             setState(() {
                               selectedIndex=index;
                             });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButtons(
                                  size: 50,
                                  color: selectedIndex==index?Colors.white:Colors.black,
                                  backgroundColor: selectedIndex==index?Colors.black:Colors.grey,
                                borderColor: selectedIndex==index?Colors.black:Colors.grey,
                                text: (index+1).toString(),
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 20,),
                      AppLargeText(text: 'Description', color: Colors.black, size: 20,),
                      SizedBox(height: 10,),
                      AppText(text: 'YMCKO (Yellow, Magenta, Cyan, Black and Overlay panels),Compatible with Smart 31 & 51 printers only.',color: Colors.blueAccent,)
                    ],
                  ),
                ),
            ),
            //Positioned(
             // top: 20,
             // left: 20,
            ////  right: 20,
             // child: Row(
               // children: [
                //  AppButtons(
                   // size: 60,
                   // color: Colors.black87,
                  //  backgroundColor: Colors.white,
                   // isIcon: true,
                   // icon: Icons.favorite_border,
                 // ),
                  //SizedBox(height: 20,),
                 // ResponsiveButton(
                   // isResponsive: true,
                 // ),
                ],
              ),
            ),
    );




  }
}
