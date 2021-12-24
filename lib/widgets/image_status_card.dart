import 'package:flutter/material.dart';

Widget imageStatusCard (String imagePrimaryName, double sizePrimary, String imageSecondaryName, double sizeSecondary) {
    return Container(
        child: Stack(
      alignment: AlignmentDirectional(1, 1),
      children: <Widget>[
        Image(
          image: AssetImage('assets/images/$imagePrimaryName'),
          width: sizePrimary,
        ),
        Image(
          image: AssetImage('assets/images/$imageSecondaryName'),
          width: sizeSecondary,
        ),
      ],
    ));
  }