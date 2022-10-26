import 'package:diseno_codificaciones/pages/codificaciones.dart';
import 'package:diseno_codificaciones/pages/codificacionesBlock.dart';
import 'package:diseno_codificaciones/pages/codificacionesPolar.dart';
import 'package:flutter/material.dart';

class CradTable extends StatelessWidget {
  const CradTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          _SigleCard(
            titulo: 'Polar',
            desc:'En este caso la señal toma valores positivos para un 1 lógico y negativos para un 0 lógico pero unca toma el valor 0.',
            tipo: 'Polar',
          )
        ]),
        TableRow(children: [
          _SigleCard(
            titulo: 'Unipolar',
            desc:'En este caso un 1 siempre toma una polaridad, positiva o negativa, mientras que un 0 vale siempre 0.', 
            tipo: 'Unipolar',
          )
        ]),
        TableRow(children: [
          _SigleCard(
            titulo: 'Bipolar',
            desc:'En este caso un dígito toma valor con polaridad alternada mientras que el otro permance simepre 0.', 
            tipo: 'Bipolar',
          )
        ]),
        TableRow(children: [
          _SigleCard(
            titulo: 'Manchester',
            desc:
                'En este código siempre hay una transición en la mitad del intervalo de duración de los bits. Cada transición positiva representa un 1 y cada transición negativa representa un 0.', 
                tipo: 'Manchester',
          )
        ]),
        TableRow(children: [
          _SigleCard(
            titulo: 'Manchester diferncial',
            desc:'En la descodificación se detecta el estado de cada intervalo y se lo compara con el estado del intervalo anterior. Si ocurrió un cambio de la señal se descodifica un 1 de lo contrario 0.', 
            tipo: 'Manchester diferncial',
          )
        ])
      ],
    );
  }
}

class _SigleCard extends StatelessWidget {
  final String titulo;
  final String desc;
  final String tipo;

  const _SigleCard({super.key, required this.titulo, required this.desc, required this.tipo});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(20),
      height: 240,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                titulo,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Text(desc,
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.white, fontSize: 15)),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                onPressed: () {
                  if(this.titulo == 'Manchester'|| this.titulo == 'Manchester diferncial' ){
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => 
                          CodificacionesBlockScreen(titulo: this.titulo,)));
                  }else if(this.titulo == 'Polar'){
                       Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => 
                          CodificacionesPolarScreen(titulo: this.titulo,)));
                  }else{
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => 
                          CodificacionesScreen(titulo: this.titulo,)));
                  }
                 
                },
                height: 40,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.amber,
                child: Container(
                  child: Text(
                    'Ir',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
