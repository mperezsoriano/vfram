import 'package:flutter/material.dart';

import '../widgets/card_model.dart';
import '../constant/constant.dart';

class GridTab extends StatefulWidget {
  final Map data;
  GridTab(this.data);

  @override
  _GridTabState createState() => _GridTabState();
}

class _GridTabState extends State<GridTab> {
  @override
  Widget build(BuildContext context) {
    //final var status = widget.data['_privateStatus'];
    Map _l1 = widget.data['feeders']['L0']['actuator'];
    Map _l2 = widget.data['feeders']['L1']['actuator'];
    Map _l3 = widget.data['feeders']['L2']['actuator'];
    Map _l4 = widget.data['feeders']['L3']['actuator'];
    Map _l5 = widget.data['feeders']['L4']['actuator'];
    Map _l6 = widget.data['feeders']['L5']['actuator'];

    //dataMotor.forEach((f, j) => print (dataMotor['$f']['actuator']));

    //TODO cambiar el paso de parametros para que se pueda realizar por map
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(children: <Widget>[
              cardModel(
                1,
                _l1['service'],
                0,
                _l1['name'],
                'assets/images/Icon_Motor.png',
                smallImage,
                state: _l1['status'],
              ),
              cardModel(
                1,
                _l2['service'],
                0,
                _l2['name'],
                'assets/images/Icon_Motor.png',
                smallImage,
                state: _l2['status'],
              ),
              cardModel(
                1,
                _l3['service'],
                0,
                _l3['name'],
                'assets/images/Icon_Motor.png',
                smallImage,
                state: _l3['status'],
              ),
            ]),
            Row(children: <Widget>[
              cardModel(
                1,
                _l4['service'],
                0,
                _l4['name'],
                'assets/images/Icon_Motor.png',
                smallImage,
                state: _l4['status'],
              ),
              cardModel(
                1,
                _l5['service'],
                0,
                _l5['name'],
                'assets/images/Icon_Motor.png',
                smallImage,
                state: _l5['status'],
              ),
              cardModel(
                1,
                _l6['service'],
                0,
                _l6['name'],
                'assets/images/Icon_Motor.png',
                smallImage,
                state: _l6['status'],
              ),
            ]),
            Row(children: <Widget>[
              cardModel(1, true, 1, 'Generador 1',
                  'assets/images/Icon_Generator.png', bigImage,
                  state: 'Encendido',
                  titext1: 'Tª Motor',
                  text1: '30ºC',
                  titext2: 'Horas',
                  text2: '1234 Hr'),
              cardModel(1, false, 1, 'Generador 2',
                  'assets/images/Icon_Generator.png', bigImage,
                  state: 'Encendido',
                  titext1: 'Tª Motor',
                  text1: '30ºC',
                  titext2: 'Horas',
                  text2: '1234 Hr'),
            ]),
            Row(children: <Widget>[
              cardModel(
                  1, true, 2, 'Silo 1', 'assets/images/Icon_Silo.png', bigImage,
                  state: 'Encendido', titext1: 'Uso', text1: '40 %'),
              cardModel(
                  1, true, 2, 'Silo 2', 'assets/images/Icon_Silo.png', bigImage,
                  state: 'Encendido', titext1: 'Uso', text1: '40 %'),
              cardModel(
                  1, true, 2, 'Silo 3', 'assets/images/Icon_Silo.png', bigImage,
                  state: 'Apagado', titext1: 'Uso', text1: '40 %'),
            ]),
            Row(children: <Widget>[
              cardModel(1, true, 2, 'Tª Sector 1',
                  'assets/images/Icon_Thermometer.png', mediunImage,
                  state: 'Encendido',
                  titext1: 'Tª',
                  text1: '29ºC',
                  titext2: 'Hm',
                  text2: '78%'),
              cardModel(1, true, 2, 'Tª Sector 2',
                  'assets/images/Icon_Thermometer.png', mediunImage,
                  state: 'Encendido',
                  titext1: 'Tª',
                  text1: '29ºC',
                  titext2: 'Hm',
                  text2: '78%'),
              cardModel(1, true, 2, 'Tª Sector 3',
                  'assets/images/Icon_Thermometer.png', mediunImage,
                  state: 'Encendido',
                  titext1: 'Tª',
                  text1: '29ºC',
                  titext2: 'Hm',
                  text2: '78%'),
              cardModel(1, true, 2, 'Tª Sector 4',
                  'assets/images/Icon_Thermometer.png', mediunImage,
                  state: 'Encendido',
                  titext1: 'Tª',
                  text1: '29ºC',
                  titext2: 'Hm',
                  text2: '78%'),
            ]),
            Row(children: <Widget>[
              cardModel(1, true, 1, 'Entrada 1', 'assets/images/Icon_Door.png',
                  mediunImage,
                  state: 'Cerrada',
                  titext1: 'Usuario',
                  text1: '4006HZR',
                  titext2: 'Ultima apertura',
                  text2: '12-01-19 13:00'),
            ]),
          ],
        )
      ],
    ));
  }
}
