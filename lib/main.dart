import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purple/cubit/app_cubit_logics.dart';
import 'package:purple/cubit/app_cubits.dart';
import 'package:purple/pages/welcome_page.dart';
import 'package:purple/services/data_services.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubit>(
        create:(context)=>AppCubit(
          data: DataServices(),
        ),
        child: const AppCubicLogics(),
      ),
    );
  }
}
