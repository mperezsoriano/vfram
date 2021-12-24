import 'package:flutter/material.dart';

/* 
Dibuja cada un de los elementos que componen el menu DRAWER
teniendo en cuenta que tenemos que indicar el orden del mismo en 
number y pasarle la funcion que tiene que ejecutar al hacer un tap
*/
Widget elementListDrawer(String image, String name, int number,
    int selectDrawerItem, Function ontap) {
  String imageName = 'assets/images/$image' + '.png';
  return ListTile(
      trailing: Image(
        image: AssetImage(imageName),
        width: 30,
        height: 20,
        color: Colors.red,
      ),
      title: Text(
        '$name',
        style: TextStyle(fontSize: 18.0),
      ),
      selected: (number == selectDrawerItem),
      onTap: () {
        ontap(number);
        //_onSelectItem(0);
      });
}
