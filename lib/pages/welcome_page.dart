import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purple/cubit/app_cubits.dart';
import 'package:purple/widgets/app_large_texts.dart';
import 'package:purple/widgets/app_texts.dart';
import 'package:purple/widgets/responsive_button.dart';

class WelcomPage extends StatefulWidget {
  const WelcomPage({super.key});

  @override
  State<WelcomPage> createState() => _WelcomPageState();
}

class _WelcomPageState extends State<WelcomPage> {
  List images = [
    'cover.png',
    'cover.png',
    'cover.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  // ignore: prefer_interpolation_to_compose_strings
                  image: AssetImage('img' + images[index]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: 'Purple IT Business'),
                        Container(
                          width: 250,
                          child: AppText(
                            text: 'supplying top Brands of PVC Card Printers',
                            size: 30,
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 250,
                          child: AppText(
                            text:
                                'We are especially experts in Evolis PVC card Printers, Smart Series 51, Margicard PVC card Printer and Data Card Printers.',
                            color: Colors.black54,
                            size: 14,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: (){
                            BlocProvider.of<AppCubit>(context).getData();
                          },
                          child: Container(
                            width: 200,
                            child: Row(
                              children:[ ResponsiveButton(
                                width: 120,
                              ),
                           ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
