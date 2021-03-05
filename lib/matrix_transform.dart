import 'package:flutter/material.dart';

class MTS extends StatefulWidget {
  @override
  _MTSState createState() => _MTSState();
}

class _MTSState extends State<MTS> {
  double? x = 0;
  double? y = 0;
  double? z = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform(
        transform: Matrix4(
            1, 0, 0, 0,
            0, 1, 0, 0,
            0, 0, 1, 0,
            0, 0, 0, 1)
          ..rotateX(x!)
          ..rotateY(y!)
          ..rotateZ(z!),
        alignment: FractionalOffset.center,
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              y = y! - details.delta.dx / 100;
              x = x! + details.delta.dy / 100;
            });
          },
          child: Container(
            color: Colors.red,
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
