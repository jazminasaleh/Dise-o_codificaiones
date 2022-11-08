import 'package:diseno_codificaciones/pages/codificaciones.dart';
import 'package:diseno_codificaciones/preferncias.dart';
import 'package:diseno_codificaciones/widgets/background.dart';
import 'package:flutter/material.dart';

import 'home.dart';

//*Donde se muestra la grafica
class Grafica extends StatelessWidget {
  const Grafica({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          _TarjetaGrafica(),
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
    //*Recibir los argumentso de Prefrencias
    final Preferencias arguments =
        ModalRoute.of(context)?.settings.arguments as Preferencias;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          //*Parte de los botones
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_sharp,
                  color: Color(0xff06F7074),
                  size: 40,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: Color(0xff06F7074),
                  size: 40,
                ),
                onPressed: () {
                  print(arguments.titulo);
                  print(arguments.negativoPositivo);
                  print(arguments.rz);
                  print(arguments.texto);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
            ],
          ),
          //*Titulo
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Text('Gráfica',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ))
            ],
          ),
          //*Se coloca la gráfica
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(20),
                height: 400,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)),
                //* Aqui va la grafica 
              ),
            ],
          )
        ],
      ),
    );
  }
}
