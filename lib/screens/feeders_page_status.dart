import 'package:flutter/material.dart';
import '../widgets/card_feeder.dart';

class FeedersPageStatus extends StatefulWidget {
  final Map data;
  final Function changeValue;
  FeedersPageStatus({Key key, this.data, this.changeValue}) : super(key: key);

  @override
  _FeedersPageStatus createState() => _FeedersPageStatus();
}

class _FeedersPageStatus extends State<FeedersPageStatus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: widget.data.length,
        itemBuilder: (BuildContext context, int index) {
          return widget.data['L$index']['actuator']['service'] == true
              ? cardFeeder('L$index', widget.data['L$index']['actuator'],
                  widget.changeValue, context)
              : null;
        },
      ),
    );
  }
}
