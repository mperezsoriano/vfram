import 'package:flutter/material.dart';

//import './constant/theme_style.dart';
import './screens/home_page.dart';

void main() => runApp(MainApp());

final ThemeData _themeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF974E4C),
  backgroundColor: Colors.orange,
  accentColor: Colors.black, //(0xFFBCA264),
  canvasColor: Color (0xFF473F3F), // Seleccion de las opciones del drawer
  cardColor: Color (0xFF473F3F)
);

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmWork',
      theme: _themeData,
      /*
      theme: ThemeData(
        primaryColor: FirstColor,
        secondaryHeaderColor: Colors.blue,
        scaffoldBackgroundColor: BackgroundColor,
      ),
      */
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );}
}