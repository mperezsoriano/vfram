import 'package:flutter/material.dart';

class DialogFeeder {
  //String data;
  //DialogFeeder(this.data);

  show(BuildContext context, String title, List<String> listData,
      String selectRepeat) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                       selectRepeat.contains('L');
                    },
                    child: Text('Lunes'),
                    color:
                        selectRepeat.contains('L') ? Colors.red : Colors.blue,
                  )
                ],
              ),
            ),
            /*
            content: ListView.builder(
                itemCount: listData.length,
                itemBuilder: (BuildContext context, int index) {
                  return RaisedButton(
                    onPressed: (){},
                    child: Text(listData[index])
                  );
                  
                }),
            */
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }
}
