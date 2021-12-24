/* Manuel Ignacio Perez Soriano */

import 'package:flutter/material.dart';
import '../Constant/theme_style.dart';

Widget textCardPersonal(color, active, size, value) {
  var texto = value == null
      ? Container()
      : Text(
          value,
          style: TextStyle(
              fontSize: size == 'small' ? SmallTextSize : MediumTextSize,
              color: color == 'white'
                  ? whiteCardColor(active)
                  : blackCardColor(active)),
        );
  return texto;
}
