import 'package:diseno_codificaciones/widgets/background.dart';
import 'package:diseno_codificaciones/widgets/card_table.dart';

import 'package:flutter/material.dart';
//*Pantalla de inicio de la app
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Background(), 
        _HomeBody()
      ],
    ));
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 50,),
          Text('CODIFICACIÓNES', textDirection: TextDirection.ltr,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white, ),),
          CradTable()
        ],
      ),
    );
  }
}
