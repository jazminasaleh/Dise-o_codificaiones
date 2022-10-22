import 'package:diseno_codificaciones/pages/home.dart';
import 'package:flutter/material.dart';

import '../widgets/background.dart';

//* Pra el checkbox al final mainaxisaligmen.end
class CodificacionesScreen extends StatelessWidget {
  final String titulo;

  const CodificacionesScreen({super.key, required this.titulo});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [Background(), _Codificaciones(titulo: this.titulo,)],
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
                      )
                    )
                  
            ],
          ),
          _Cuadrotexto(),
          _CuadroRZ(),
          _CuadroPN(),
          SizedBox(
            height: 65,
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
  bool rz = false;
  bool nrz = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(20),
      height: 150,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '   RZ-L',
                style: TextStyle(
                    color: Color(0xffB6B7BB),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 170,
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
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                '   NRZ-L',
                style: TextStyle(
                    color: Color(0xffB6B7BB),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 150,
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
  bool negativo = false;
  bool positivo = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(20),
      height: 150,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '   Negativo',
                style: TextStyle(
                    color: Color(0xffB6B7BB),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 140,
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
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                '   Positivo',
                style: TextStyle(
                    color: Color(0xffB6B7BB),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 151,
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
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            height: 55,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Color(0xff87E7E4),
            child: Container(
              child: Text(
                '  Enviar  ',
                style: TextStyle(fontSize: 30, color: Color(0xff004853)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
