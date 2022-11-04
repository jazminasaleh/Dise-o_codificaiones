import 'package:diseno_codificaciones/pages/grafica.dart';
import 'package:diseno_codificaciones/pages/home.dart';
import 'package:flutter/material.dart';

import '../widgets/background.dart';

class CodificacionesScreen extends StatelessWidget {
  final String titulo;

  const CodificacionesScreen({super.key, required this.titulo});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          _Codificaciones(
            titulo: this.titulo,
          )
        ],
      ),
    );
  }
}

class _Codificaciones extends StatelessWidget {
  final String titulo;

  const _Codificaciones({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                alignment: Alignment.topLeft,
                icon: Icon(
                  Icons.arrow_back,
                  color: Color(0xff06F7074),
                  size: 35,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(this.titulo,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ))
            ],
          ),
          _Cuadrotexto(),
          _CuadroRZ(),
          _CuadroPN(),
          SizedBox(
            height: 30,
          ),
          _botton()
        ],
      ),
    );
  }
}

class _Cuadrotexto extends StatelessWidget {
  late String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(20),
      height: 200,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Center(
            child: Text(
              'Ingresar texto',
              style: TextStyle(fontSize: 15, color: Color(0xffB6B7BB)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            style: TextStyle(color: Color(0xffB6B7BB)),
            decoration: InputDecoration(
                border:
                    //*Cuando se esta
                    OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 5.0),
                  borderRadius: BorderRadius.circular(20),
                ),
                //*Cuando no se esta escribiendo en texto
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: '',
                hintStyle: TextStyle(color: Color(0xffB6B7BB))),
            onChanged: (texto) {
              print('$texto');
            },
            maxLines: 4,
          )
        ],
      ),
    );
  }
}

class _CuadroRZ extends StatefulWidget {
  @override
  State<_CuadroRZ> createState() => _CuadroRZState();
}

class _CuadroRZState extends State<_CuadroRZ> {
  bool rz = true;
  bool nrz = false;

  void alertaMensaje(BuildContext context, Text titulo, Text mensaje) {
    showDialog(
        //poder cerra el cuadro de error precionando desde afuera
        barrierDismissible: false,
        context: context,
        builder: (context) {
          //un cuadro de alerta
          return AlertDialog(
            elevation: 10,
            title: titulo,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Column(
              //determina el tamaño del contenido de la alterta, de acuerdo al contenido
              mainAxisSize: MainAxisSize.min,
              children: [
                mensaje,
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Salir',
                    style: TextStyle(color: Colors.amber),
                  )),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(20),
      height: 184,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  'RZ-L',
                  style: TextStyle(
                      color: Color(0xffB6B7BB),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),  
              Switch(
                  activeColor: Color(0xffB6B7BB),
                  activeTrackColor: Color(0xff87E7E4),
                  value: this.rz,
                  onChanged: (value) {
                    setState(() {
                      this.rz = value!;
                      nrz = false;
                    });
                  })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Text(
                  'NRZ-L',
                  style: TextStyle(
                      color: Color(0xffB6B7BB),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              Switch(
                  activeColor: Color(0xffB6B7BB),
                  activeTrackColor: Color(0xff87E7E4),
                  value: this.nrz,
                  onChanged: (value) {
                    setState(() {
                      this.nrz = value!;
                      rz = false;
                    });
                  })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () => alertaMensaje(
                      context,
                      Text(
                        'RZ-L/NRZ-L',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                          'RZ(Retourn to zero): se tiene tension positiva en una parte de la duración de un 1 lógico, y cero durante el resto del tiempo. y NRZ-L (código NonReturn to Zero Level): un 1 lógico es un pulso de tensión, minetras que un 0 lógico es la ausencia de dicho pulso de tensión.')),
                  icon: Icon(
                    Icons.help_outline,
                    color: Color(0xffB6B7BB),
                    size: 25,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class _CuadroPN extends StatefulWidget {
  @override
  State<_CuadroPN> createState() => _CuadroPNState();
}

class _CuadroPNState extends State<_CuadroPN> {
  bool negativo = true;
  bool positivo = false;

  void alertaMensaje(BuildContext context, Text titulo, Text mensaje) {
    showDialog(
        //poder cerra el cuadro de error precionando desde afuera
        barrierDismissible: false,
        context: context,
        builder: (context) {
          //un cuadro de alerta
          return AlertDialog(
            elevation: 10,
            title: titulo,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Column(
              //determina el tamaño del contenido de la alterta, de acuerdo al contenido
              mainAxisSize: MainAxisSize.min,
              children: [
                mensaje,
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Salir',
                    style: TextStyle(color: Colors.amber),
                  )),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(20),
      height: 184,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '   Negativo',
                style: TextStyle(
                    color: Color(0xffB6B7BB),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              
              Checkbox(
                  checkColor: Colors.grey,
                  activeColor: Color(0xff87E7E4),
                  value: this.negativo,
                  onChanged: (value) {
                    setState(() {
                      this.negativo = value!;
                      this.positivo = false;
                    });
                  })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '   Positivo',
                style: TextStyle(
                    color: Color(0xffB6B7BB),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              
              Checkbox(
                  checkColor: Colors.grey,
                  activeColor: Color(0xff87E7E4),
                  value: this.positivo,
                  onChanged: (value) {
                    setState(() {
                      this.positivo = value!;
                      this.negativo = false;
                    });
                  })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () => alertaMensaje(
                      context,
                      Text(
                        'Negativo/Positivo',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('En cualquiera de los dos casos puede tomar el valor de cero y cunado es positivo: en la gráfica toma valores positivos; en cambio negativos: toma valores en la gráfica negativos.')),
                  icon: Icon(
                    Icons.help_outline,
                    color: Color(0xffB6B7BB),
                    size: 25,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class _botton extends StatelessWidget {
  const _botton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Grafica()));
            },
            height: 55,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Colors.amber,
            child: Container(
              child: Text(
                '  Enviar  ',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
