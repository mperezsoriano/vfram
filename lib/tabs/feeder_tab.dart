import 'package:flutter/material.dart';
import '../screens/feeders_page_status.dart';
import '../screens/feeders_page_programing.dart';

class FeederTab extends StatefulWidget {
  final Map dataFeeders;
  final Map dataPrograming;
  final Function changeValue;
  FeederTab({Key key, this.dataFeeders, this.dataPrograming, this.changeValue}) : super(key: key);

  @override
  _FeederTabState createState() => _FeederTabState();
}

class _FeederTabState extends State<FeederTab> {
  int _selectedIndex = 0;

  Widget callPageSelect(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return FeedersPageStatus(data: widget.dataFeeders, changeValue: widget.changeValue);
        break;
      case 1:
        return FeedersPagePrograming(data: widget.dataPrograming, changeValue: widget.changeValue);
        break;
      default:
        return Container(); //FeederPageStatus();
        break;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: callPageSelect(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Estado'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Programacion'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
