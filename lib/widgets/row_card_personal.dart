/* Manuel Ignacio Perez Soriano */

import 'package:flutter/material.dart';
import '../Constant/theme_style.dart';
import './text_card_personal.dart';

Widget rowCardPersonal(active, type, image, scale,
    {titext1, text1, titext2, text2}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.all(3.0),
              child: Image(
                image: AssetImage(image),
                color: whiteCardColor(active),
                height: scale,
                //width: scale,
              ))),
      Expanded(
        flex: (type == 0) ? 0 : 1,
        //flex: 1,
        child: Column(
          children: <Widget>[
            textCardPersonal('black', active, 'medium', titext1),
            textCardPersonal('white', active, 'medium', text1),
            textCardPersonal('black', active, 'medium', titext2),
            textCardPersonal('white', active, 'medium', text2),
          ],
        ),
      )
    ],
  );
}
