import 'package:flutter/material.dart';

// Colores 
const BackgroundColor = const Color (0xFF473F3F);
const FirstColor = const Color(0xFF974E4C);
const SecondColor = const Color(0xFFBCA264);
const ThirdColor = const Color(0xFF948080);
const FourthColor = const Color(0xFF5A5757);

// Colores texto
const FirstColorText = const Color(0xFFFFFFFF);
const SecondColorText = const Color(0xFF000000);
const ThirdColorText = const Color(0xFF757272);

// Colores elementos
const FirstColorElement = const Color(0xFFFFFFFF);
const SecondColorElement = const Color(0x757272);

// Fuentes
const String FontNameDefault = 'Montserrat';

// Tamaños de letras
const LargeTextSize = 18.0;//20.0;
const MediumTextSize = 14.0;//16.0;
const SmallTextSize = 12.0;//14.0;

/*
const AppBarTextStyle = TextStyle(
    fontFamily: FontNameDefault,
    fontWeight: FontWeight.w600,
    fontSize: LargeTextSize,
    color: FirstColor);



const TitleTextStyle = TextStyle(
    fontFamily: FontNameDefault,
    fontWeight: FontWeight.w300,
    fontSize: LargeTextSize,
    color: Colors.white);

const Body1TextStyle = TextStyle(
    fontFamily: FontNameDefault,
    fontWeight: FontWeight.w300,
    fontSize: BodyTextSize,
    color: Colors.white);

const Body2TextStyle = TextStyle(
    fontFamily: FontNameDefault,
    fontWeight: FontWeight.w300,
    fontSize: BodyTextSize,
    color: Colors.white);

const SubheadTextStyle = TextStyle(
    fontFamily: FontNameDefault,
    fontWeight: FontWeight.w600,
    fontSize: BodyTextSize,
    color: Colors.red);
*/
const ButtonTextStyle = TextStyle(
    fontFamily: FontNameDefault,
    fontWeight: FontWeight.w600,
    fontSize: SmallTextSize,
    color: Colors.black);


Color backgroundCardColor(active, state) {
  Color color = FourthColor;  
  if (active == true) {
    color = state == 'Encendido' ? SecondColor : ThirdColor;
  }
  return color;
}

Color whiteCardColor(active) {
  return (active == true) ? FirstColorText : ThirdColorText;
}

Color blackCardColor(active) {
  return (active == true) ? SecondColorText : ThirdColorText;
}