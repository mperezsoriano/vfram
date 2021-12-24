import 'package:flutter/material.dart';

import './dialog_feeder.dart';

Widget cardFeederProgramingNew(
    String route, Map data, Function onPressed, BuildContext context) {
  print(data);

  DialogFeeder dialogFeeder = DialogFeeder();
  List<String> daysWeek = ['Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo'];


  var _startTime = data['startTime'];
  var _enable = data['enabled'] ?? false;
  var _repeat = data['repeat'] ?? '';
  var _stopGenerator = data['stopGenerator'] ?? false;
  var _feeders = data['feeders'] ?? '';
  // TODO cambiar la lista de elementos para que se pueda
  // incluir directamene si estan en marcha mas lineas
  List _element = ['L1', 'L2', 'L3', 'L4'];
  return Card(
    elevation: 2.0,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: BorderSide(width: 2.0, color: Colors.white30)),
    child: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    flex: 4,
                    child: Row(children: <Widget>[
                      Icon(
                        Icons.alarm,
                        size: 35.0,
                      ),
                      GestureDetector(
                        onTap: () async {
                          final timePick = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (timePick != null) {
                            String hour = timePick.hour.toString();
                            String minute = timePick.minute.toString();
                            onPressed(false, route,
                                {'startTime': hour + ':' + minute});
                          }
                        },
                        child: Text(
                          _startTime,
                          style: TextStyle(fontSize: 32.0),
                        ),
                      ),
                    ])),
                Expanded(
                    flex: 1,
                    child: Switch(
                      value: _enable,
                    ))
              ],
            ),
            GestureDetector(
                //TODO Cambiar para que se pueda elegir a partir de una lista
                onTap: () {
                  dialogFeeder.show(context, 'titulo', daysWeek, _repeat);
                },
                child: Text(
                  _repeat,
                  style: TextStyle(fontSize: 16.0),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.settings_applications),
                Checkbox(
                  value: _stopGenerator,
                ),
                Text('Apagar el generador al terminar')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Card(
                    margin: EdgeInsets.all(3.0),
                    color: _feeders.contains(_element[0]) == true
                        ? Colors.red
                        : Colors.amber,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(13.0, 3.0, 13.0, 3.0),
                      child: Text(
                        'L1',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    )),
                Card(
                    margin: EdgeInsets.all(3.0),
                    color: _feeders.contains(_element[1]) == true
                        ? Colors.red
                        : Colors.amber,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(13.0, 3.0, 13.0, 3.0),
                      child: Text(
                        'L1',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    )),
                Card(
                    margin: EdgeInsets.all(3.0),
                    color: _feeders.contains(_element[2]) == true
                        ? Colors.red
                        : Colors.amber,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(13.0, 3.0, 13.0, 3.0),
                      child: Text(
                        'L1',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    )),
                Card(
                    margin: EdgeInsets.all(3.0),
                    color: _feeders.contains(_element[3]) == true
                        ? Colors.red
                        : Colors.amber,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(13.0, 3.0, 13.0, 3.0),
                      child: Text(
                        'L1',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ))
              ],
            )
          ],
        )),
  );
}
