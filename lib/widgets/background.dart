import 'package:flutter/material.dart';
//*El color de fondo de la app
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
        stops: [0.2, 0.99],
        colors: [
          Color(0xff014A55),
          Colors.black.withOpacity(0.9)
        ]
        )
     );
  }
}