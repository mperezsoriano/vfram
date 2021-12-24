/* Manuel Ignacio Perez Soriano */

import 'package:flutter/material.dart';
import '../Constant/theme_style.dart';
import './text_card_personal.dart';
import './row_card_personal.dart';

/* 
  Representa las tarjetas de la pantalla general de informacion
  weight: inica el peso para la visualizacion
  active: el elemento esta activo o no
  type: (1-2-3) tipo de tipo 
  title: nombre del titulo
  image: icono a visualizar
  titext1: titulo del campo 1
  text1: valor del campo 1
  titext2: titulo del campo 2
  text2: valor del campo 2
  state: indica el estado ("Parado", "En Marcha"), si no esta activo por defecto esta en ("Sin Servicio")
*/

Widget cardModel(weight, active, type, title, image, scale,
    {titext1, text1, titext2, text2, state: 'Sin Servicio'}) {
  return Expanded(
    flex: weight,
    child: Card(
      margin: EdgeInsets.all(3.0),
      color: backgroundCardColor(active, state),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Padding(
        padding: EdgeInsets.fromLTRB(3.0, 3.0, 3.0, 3.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
                alignment: Alignment.centerLeft,
                child: textCardPersonal('black', active, 'small', title)),
            rowCardPersonal(active, type, image, scale,
                titext1: titext1, text1: text1, titext2: titext2, text2: text2),
            type < 2
                ? textCardPersonal('white', active, 'medium', state)
                : Container()
          ],
        ),
      ),
    ),
  );
}
