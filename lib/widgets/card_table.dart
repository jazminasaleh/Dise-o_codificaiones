import 'package:diseno_codificaciones/pages/codificaciones.dart';


import 'package:flutter/material.dart';

class CradTable extends StatelessWidget {
  const CradTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const[
        TableRow(children: [
          _SigleCard(
            titulo: 'Polar',
            desc:
                'En este caso la señal toma valores positivos para un 1 lógico y negativos para un 0 lógico pero nunca toma el valor 0.',
            tipo: 'Polar',
             rcero: true,
             negpos: false, 
          )
        ]),
        TableRow(children: [
          _SigleCard(
            titulo: 'Unipolar',
            desc:
                'En este caso un 1 siempre toma una polaridad positiva o negativa, mientras que un 0 vale siempre 0.',
            tipo: 'Unipolar',
             negpos: true, 
             rcero: true
          )
        ]),
        TableRow(children: [
          _SigleCard(
            titulo: 'Bipolar',
            desc:
                'En este caso un dígito toma valor con polaridad alternada mientras que el otro permance simepre en 0.',
            tipo: 'Bipolar', negpos: true, 
            rcero: true
          )
        ]),
        TableRow(children: [
          _SigleCard(
            titulo: 'Manchester',
            desc:
                'En este código siempre hay una transición en la mitad del intervalo de duración de los bits. Cada transición positiva representa un 1 y cada transición negativa representa un 0.',
            tipo: 'Manchester', negpos: false, rcero: false
          )
        ]),
        TableRow(children: [
          _SigleCard(
            titulo: 'Manchester diferencial',
            desc:
                'En la descodificación se detecta el estado de cada intervalo y se lo compara con el estado del intervalo anterior. Si ocurrió un cambio de la señal se descodifica un 1 de lo contrario 0.',
            tipo: 'Manchester diferncial', negpos: false, rcero: false,
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
  final bool rcero;
  final bool negpos;

  const _SigleCard(
      {super.key,
      required this.titulo,
      required this.desc,
      required this.tipo,
      required this.rcero,
      required this.negpos});
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
            maxLines: 5,
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.white, fontSize: 15, overflow: TextOverflow.ellipsis)),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CodificacionesScreen(
                                titulo: this.titulo,
                                negpos: this.negpos,
                                rcero: this.rcero,
                              )));
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
