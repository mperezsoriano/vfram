import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import './action_button_card.dart';

Widget cardFeederPrograming(
    String route, Map data, Function onPressed, BuildContext context) {
  var _enable = data['enabled'];
  var _startTime = data['startTime'];
  var _endTime = data['endTime'];
  var _repeat = data['repeat'];

  return Card(
    elevation: 2.0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: BorderSide(width: 2.0, color: Colors.white30)),
    child: Padding(
        padding: EdgeInsets.fromLTRB(15.0, 3.0, 15.0, 3.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    final timePick = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (timePick != null) {
                      String hour = timePick.hour.toString();
                      String minute = timePick.minute.toString();
                      print('$hour:$minute');
                      
                    }
                  },
                  child: Text(
                    'Inicio: $_startTime',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
                Text(
                  'Fin: $_endTime',
                  style: TextStyle(fontSize: 24.0),
                ),
                Switch(
                  value: _enable,
                  dragStartBehavior: DragStartBehavior.start,
                ),
              ],
            ),
            Row(
                //mainAxisSize: MainAxisSize.max,
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Row(children: <Widget>[
                        Checkbox(
                          value: true,
                        ),
                        Text(
                          'Repetir',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ])),
                     
                  Expanded(
                      flex: 2,
                      child: Row(
                        children: <Widget>[
                        actionButtonCard('L1', null, null, null, 14.0,
                            state: true),
                        actionButtonCard('L2', null, null, null, 14.0,
                            state: true),
                        actionButtonCard('L3', null, null, null, 14.0,
                            state: true),
                        actionButtonCard('L4', null, null, null, 14.0,
                            state: true),
                      ]))
                ]),
            _repeat == true
                ? Column(children: <Widget>[
                    Divider(),
                    Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          actionButtonCard('L', null, null, null, 5.0,
                              state: true),
                          actionButtonCard('M', null, null, null, 5.0,
                              state: true),
                          actionButtonCard('X', null, null, null, 5.0,
                              state: true),
                          actionButtonCard('J', null, null, null, 5.0,
                              state: true),
                          actionButtonCard('V', null, null, null, 5.0,
                              state: true),
                          actionButtonCard('S', null, null, null, 5.0,
                              state: true),
                          actionButtonCard('D', null, null, null, 5.0,
                              state: true)
                        ])
                  ])
                : Container(),
            Divider(),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.delete,
                  size: 30.0,
                ),
                Text(
                  'Eliminar',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            )),
          ],
        )),
  );
}
