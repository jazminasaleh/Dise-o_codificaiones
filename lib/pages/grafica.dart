import 'package:diseno_codificaciones/widgets/background.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Grafica extends StatelessWidget {
  const Grafica({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
            _TarjetaGrafica() 
        ],
      ),
    );
  }
}

class _TarjetaGrafica extends StatefulWidget {
  const _TarjetaGrafica({super.key});

  @override
  State<_TarjetaGrafica> createState() => _TarjetaGraficaState();
}

class _TarjetaGraficaState extends State<_TarjetaGrafica> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                icon: Icon(
                  Icons.home,
                  color: Color(0xff06F7074),
                  size: 40,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
              SizedBox(
                height: 90,
              ),
            ],
         ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Text('Gráfica',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ))
            ],
          ),
          Column(
            children: [
              Container(
               margin: EdgeInsets.all(15),
               padding: EdgeInsets.all(20),
               height: 300,
               width: MediaQuery.of(context).size.width-40,
               decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20)),
              )
            ],
          )
        ],
      ),
    );
  }
}