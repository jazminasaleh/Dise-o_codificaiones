

import 'package:flutter/material.dart';

class CradTable extends StatelessWidget {
  const CradTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            _SigleCard()
          ]
        ),
         TableRow(
          children: [
            _SigleCard()
          ]
        ),
         TableRow(
          children: [
            _SigleCard()
          ]
        ),
         TableRow(
          children: [
            _SigleCard()
          ]
        ),
         TableRow(
          children: [
            _SigleCard()
          ]
        )
      ],
    );
  }
}

class _SigleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      height: 100,
      decoration: BoxDecoration(
        color: Color.fromARGB(30, 80, 100, 170),
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}
