import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_/Dio/dio_helper.dart';
import 'package:news_app_/cubit/cubit.dart';
import 'package:news_app_/News_app/news_layout.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black26,
      ),
      themeMode: ThemeMode.light,
      theme: ThemeData(
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.deepOrange),
          primarySwatch: Colors.deepOrange,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarBrightness: Brightness.light)),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed
              // selectedItemColor: Colors.orange.
              )),
      debugShowCheckedModeBanner: false,
      home: const NewsLayout(),
    );
  }
}
