import 'package:flutter/material.dart';
import '../widgets/card_feeder_programing.dart';
import '../widgets/card_feeder_programing_new.dart';

class FeedersPagePrograming extends StatefulWidget {
  final Map data;
  final Function changeValue;
  FeedersPagePrograming({Key key, this.data, this.changeValue})
      : super(key: key);

  @override
  _FeedersPagePrograming createState() => _FeedersPagePrograming();
}

class _FeedersPagePrograming extends State<FeedersPagePrograming> {

 
  createNewPrograming() {
    //var startTime = DateTime.now();

    Map<String, dynamic> newPrograming = {
      'enabled': false,
      'startTime': '00:00',
      'repeat': '',
      'feeders':'',
      'stopGenerator': false
    };
    widget.changeValue(true, 'programing/feeders', newPrograming);
  }

  _body() {
    if (widget.data != null) {
     
      return ListView.builder(
          itemCount: widget.data.length,
          itemBuilder: (BuildContext context, int index) {
            var keyOfElement = widget.data.keys.elementAt(index);
            //return cardFeederPrograming('programing/feeders', widget.data[(widget.data.keys.elementAt(index))], widget.changeValue,  context);
            return cardFeederProgramingNew('programing/feeders/$keyOfElement', widget.data[keyOfElement], widget.changeValue,  context);
          });
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        mini: false,
        onPressed: () {
          createNewPrograming();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
