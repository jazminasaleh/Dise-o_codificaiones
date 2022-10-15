import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: boxDecoration()
      ),
      ]
    );
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.2, 0.8],
        colors: [
          Color(0xff004E5A),
          Colors.black
        ]
        )
     );
  }
}