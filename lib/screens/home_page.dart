import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import '../tabs/grid_tab.dart';
import '../tabs/feeder_tab.dart';
import '../widgets/element_list_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectDrawerItem = 0;
  // Lista de las diferentes ventanas
  List<String> _nameScreem = ['General', 'Generadores', 'Comederos', 'Silos', 'Temperaturas', 'Baterias', 'Accesos'];

  // Datos de la base de datos de firebase
  Map dataFarm = {};
  DatabaseReference _dataFarm;
  StreamSubscription<Event> _dataFarmSubscription;
  Object _error;

  var waitTime = DateTime.now().add(Duration(minutes: 1));
  // TODO hacer la comprobacion para pasado un minuto salir 
  // de la aplicacion
  
  /*
  Instancia una variable con la referencia a FirebaseDatabase
  y mantiene los datos en ella permitiendo pasar los cambios
  a lo largo de todo el programa
  */
  @override
  void initState() {
    super.initState();
    _dataFarm = FirebaseDatabase.instance.reference().child('granja0001');
    _dataFarm.keepSynced(true);
    _dataFarmSubscription = _dataFarm.onValue.listen((Event event) {
      setState(() {
        dataFarm = event.snapshot.value;
      });
    }, onError: (Object error) {
      setState(() {
        _error = error;
      });
    });
  }

  @override
  void dispose() {
    _dataFarmSubscription.cancel();
    super.dispose();
  }

  /*
  Permite ma modificacion de parametros en la base de datos
  la ruta sera del tipo 'feeders/L0/actuator' y el data es 
  del tipo Map {'key' : 'valor}
  */
  void changeValueDatabase(bool create, String route, var data) async {
    if (create == true) {
      await _dataFarm.child(route).push().set(data);
    } else {
      await _dataFarm.child(route).update(data);
    }
  }

  /*
  Permite el paso entra pantallas modificando el body del
  cuerpo principal
  */
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return GridTab(dataFarm);
        break;
      case 1:
        return FeederTab(dataFeeders: dataFarm['feeders'], dataPrograming: dataFarm['programing']['feeders'], changeValue: changeValueDatabase);
      default:
        return Container();
    }
  }

  _onSelectItem(int pos) {
    Navigator.of(context).pop();
    setState(() {
      _selectDrawerItem = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    String _title = _nameScreem[_selectDrawerItem];
    if (dataFarm.length > 0) {
      return Scaffold(
        appBar: AppBar(
          title: Text('$_title'),
          centerTitle: true,
        ),
        drawer: Drawer(
            child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text('Wop'),
                accountEmail: Text('watchonphone@gmail.com'),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/img1.jpg')))),
            elementListDrawer('Icon_Motor', _nameScreem[0], 0, _selectDrawerItem, _onSelectItem),
            Divider(height: 0.0,),
            elementListDrawer(
                'Icon_Motor', _nameScreem[1], 1, _selectDrawerItem, _onSelectItem),
            elementListDrawer('Icon_Generator', _nameScreem[2], 2,
                _selectDrawerItem, _onSelectItem),
            Divider(height: 0.0),
            elementListDrawer('Icon_Thermometer', _nameScreem[3], 3,
                _selectDrawerItem, _onSelectItem),
            elementListDrawer(
                'Icon_Silo', _nameScreem[4], 4, _selectDrawerItem, _onSelectItem),
            Divider(height: 0.0),
            elementListDrawer(
                'Icon_Door', _nameScreem[5], 5, _selectDrawerItem, _onSelectItem),
            Divider(height: 0.0),
            elementListDrawer('Icon_Door', 'Información', 6, _selectDrawerItem,
                _onSelectItem),
            elementListDrawer(
                'Icon_Door', 'Salir', 7, _selectDrawerItem, _onSelectItem)
          ],
        )),
        body: _getDrawerItemWidget(_selectDrawerItem),
      );
    } else {
      return Scaffold(
          body: Center(
              child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      )));
    }
  }
}
