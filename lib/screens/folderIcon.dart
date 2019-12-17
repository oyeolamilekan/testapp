import 'package:flutter/material.dart';

class FileIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter, children: <Widget>[
      Container(
        width: 40,
        height: 40,
        color: Colors.red,
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Card(
          elevation: 8,
          color: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          child: Container(
            width: 70,
            height: 50,
            
          ),
        ),
      ),
    ]);
  }
}
