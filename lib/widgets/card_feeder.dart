import 'package:flutter/material.dart';
import './image_status_card.dart';
import './action_button_card.dart';

/* 
  Card para la informacion del estado de los motores asi como
  para ponerlos en marcha o pararlos
*/

Widget cardFeeder(
    String route, Map data, Function onPressed, BuildContext context) {
  var _scaleImage = data['programing'] == true ? 25.0 : 0.0;
  var _name = data['name'];
  var _state = data['status'];
  var _route = 'feeders/$route/actuator';

  return Card(
    elevation: 2.0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: BorderSide(width: 2.0, color: Colors.white30)),
    child: Padding(
      padding: EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 3.0),
      child: Row(
        children: <Widget>[
          imageStatusCard(
              'ButtonMotor.png', 60.0, "ButtonTime.png", _scaleImage),
          Expanded(
            flex: 2,
            child: ListTile(
              title: Text('$_name'),
              subtitle: Text('$_state'),
              isThreeLine: false,
            ),
          ),
          actionButtonCard('ON', onPressed, _route, 'status', 15.0, value: 'Encendido'),
          actionButtonCard('ON', onPressed, _route, 'status', 15.0, value: 'Apagado'),
        ],
      ),
    ),
  );
}
