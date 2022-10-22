import 'package:diseno_codificaciones/pages/home.dart';
import 'package:flutter/material.dart';

import '../widgets/background.dart';

class CodificacionesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [Background(), _Codificaciones()],
      ),
    );
  }
}

class _Codificaciones extends StatelessWidget {
  const _Codificaciones({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
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
                height: 160,
              ),
              SizedBox(
                width: 120,
              ),
              Center(
                  child: Text('Polar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ))),
            ],
          ),
          _Cuadrotexto(),
          _CuadroRZ(),
          _CuadroPN()
        ],
      ),
    );
  }
}

class _Cuadrotexto extends StatelessWidget {
  const _Cuadrotexto({super.key});

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
            child: Text('Ingresar texto', style: TextStyle(fontSize: 15, color: Color(0xffB6B7BB)),),
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
                width: 200,
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
                width: 182,
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
                width: 160,
              ),
              Checkbox(
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
                width: 171,
              ),
              Checkbox(
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
