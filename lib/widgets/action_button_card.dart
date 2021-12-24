import 'package:flutter/material.dart';
import '../constant/theme_style.dart';

/*
  Dibuja los botones que van en las tarjetas
  Inidicando:
  text: texto que se vera en el boton
  onPressedFunction: la funcion a ejecutar cuando se prete el boton
  route: la ruta de la base de datos de firebase
  value: el valor a cambiar en la base de datos al pretar el boton
*/
Widget actionButtonCard(
    String text, Function onPressedFunction, String route, String paramRoute, double size, 
    {String value, bool state}) {
  return Expanded(
      flex: 1,
      child: RawMaterialButton(
        onPressed: () => {
              value == null
                  ? onPressedFunction(false, route, {paramRoute: !state})
                  : onPressedFunction(false, route, {paramRoute: value})
            },
        child: Text(text),
        shape: CircleBorder(),
        elevation: 2.0,
        fillColor: SecondColor,
        highlightColor: Colors.white,
        padding: EdgeInsets.all(size),
      ));
}
