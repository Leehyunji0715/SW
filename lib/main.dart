import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'Home.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
        initialRoute: '/home',
        routes: {
          '/home':(context) =>LoginPage(),
        },
        title: 'kodeversitas',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Nunito',
        ),
        home: LoginPage()
    );
  }
}
