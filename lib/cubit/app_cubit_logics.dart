import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purple/cubit/app_cubit_states.dart';
import 'package:purple/cubit/app_cubits.dart';
import 'package:purple/pages/home_page.dart';
import 'package:purple/pages/welcome_page.dart';

class AppCubicLogics extends StatefulWidget {
  const AppCubicLogics({Key? key}) : super(key: key);

  @override
  State<AppCubicLogics> createState() => _AppCubicLogicsState();
}

class _AppCubicLogicsState extends State<AppCubicLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, CubitStates>(
       builder: (context, state) {
         if(state is WelcomeState){
           return WelcomPage();
         }if(state is LoadedState){
           return HomePage();
         }if(state is LoadingState){
           return Center(child: CircularProgressIndicator(),);
         }else {
           return Container();
         }
       },
      ),
    );
  }
}
