import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function selectHandler;
  final String Display;
  final int sco;
  Button(this.selectHandler, this.Display, this.sco);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: 200,
      height: 75,
      child: ElevatedButton(
        child: Text(
          Display,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => selectHandler(sco),
      ),
    );
  }
}
