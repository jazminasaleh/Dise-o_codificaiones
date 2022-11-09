import 'package:diseno_codificaciones/pages/codificaciones.dart';

import 'package:flutter/material.dart';

//*Trajetas de lad definiciones de cada una de las codificaciones
class CradTable extends StatelessWidget {
  const CradTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          _SigleCard(
            titulo: 'Polar',
            desc:
                'En este caso la señal toma valores positivos para un 1 lógico y negativos para un 0 lógico pero nunca toma el valor 0.',
            tipo: 'Polar',
            retornoacero: true,
            negativoPositivo: false,
            texto: '',
          )
        ]),
        TableRow(children: [
          _SigleCard(
            titulo: 'Unipolar',
            desc:
                'En este caso un 1 siempre toma una polaridad positiva o negativa, mientras que un 0 vale siempre 0.',
            tipo: 'Unipolar',
            negativoPositivo: true,
            retornoacero: true,
            texto: '',
          )
        ]),
        TableRow(children: [
          _SigleCard(
            titulo: 'Bipolar',
            desc:
                'En este caso un dígito toma valor con polaridad alternada mientras que el otro permance simepre en 0.',
            tipo: 'Bipolar',
            negativoPositivo: true,
            retornoacero: true,
            texto: '',
          )
        ]),
        TableRow(children: [
          _SigleCard(
            titulo: 'Diferencial',
            desc:
                'En una codificación diferncial en lugar de dterminar el valor absoluto, las señales se decodifica comparando la polaridad de los bits con los bits adyacentes.',
            tipo: 'Manchester diferncial',
            negativoPositivo: false,
            retornoacero: false,
            texto: '',
          )
        ]),
        TableRow(children: [
          _SigleCard(
            titulo: 'Manchester',
            desc:
                'En este código siempre hay una transición en la mitad del intervalo de duración de los bits. Cada transición positiva representa un 1 y cada transición negativa representa un 0.',
            tipo: 'Manchester',
            negativoPositivo: false,
            retornoacero: false,
            texto: '',
          )
        ]),
        TableRow(children: [
          _SigleCard(
            titulo: 'Manchester diferencial',
            desc:
                'En la descodificación se detecta el estado de cada intervalo y se lo compara con el estado del intervalo anterior. Si ocurrió un cambio de la señal se descodifica un 1 de lo contrario 0.',
            tipo: 'Manchester diferncial',
            negativoPositivo: false,
            retornoacero: false,
            texto: '',
          )
        ]),
        TableRow(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'MODULACIÓNES',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ]),
        TableRow(children: [
          _SigleCardSinBoton(
            titulo: 'AM',
            desc:
                'Tambien conocida como modulación de amplitud, este es un caso de modulación donde tanto las señales de trasmisión como las señales de datos son analógicas.',
            texto: '',
          )
        ]),
        TableRow(children: [
          _SigleCardSinBoton(
            titulo: 'FM',
            desc:
                'La cual significa modulación de frecuencia, eset es un caso de modulación donde tanto las señales de transmisión como las señales de datos son analógicas y es un tipi de modulación exponencial.',
            texto: '',
          )
        ]),
        TableRow(children: [
          _SigleCardSinBoton(
            titulo: 'ASK',
            desc:
                'Amplitudes-shift keying, traducido al español desplazamiento de amplitud, es una modulación de amplitud donde la señal moduladora (datos) es digital.',
            texto: '',
          )
        ]),
        TableRow(children: [
          _SigleCardSinBoton(
            titulo: 'FSK',
            desc:
                'Frequency-shift keying, ya en español Desplazamiento de frecuencia, es una modulación de frecuencia donde la señal moduladora (datos) es digital.',
            texto: '',
          )
        ]),
        TableRow(children: [
          _SigleCardSinBoton(
            titulo: 'PSK',
            desc:
                'Phase-shift keying, lo que quiere decir en español desplazamiento de fase, es una modulación de fase donde la señal moduladora (datos) es digital.',
            texto: '',
          )
        ]),
        TableRow(children: [
          _SigleCardSinBoton(
            titulo: 'PCM',
            desc:
                'Pulse Code Modulation, traduce al español modulación de pulsos codificados, en este caso se debe realizar un muestreo de la señal, cuantificar la misma y codificarla.',
            texto: '',
          )
        ]),
        TableRow(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tomado de: Tema_6._Representacion_de_Informacion',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          )
        ]),
      ],
    );
  }
}

//*Trajeta individual
class _SigleCard extends StatelessWidget {
  final String titulo;
  final String desc;
  final String tipo;
  final bool retornoacero;
  final bool negativoPositivo;
  final String texto;

  const _SigleCard(
      {super.key,
      required this.titulo,
      required this.desc,
      required this.tipo,
      required this.retornoacero,
      required this.negativoPositivo,
      required this.texto});
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
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    overflow: TextOverflow.ellipsis)),
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
                                negativoopostitivo: this.negativoPositivo,
                                retornoCero: this.retornoacero,
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

class _SigleCardSinBoton extends StatelessWidget {
  final String titulo;
  final String desc;
  final String texto;

  const _SigleCardSinBoton(
      {super.key,
      required this.titulo,
      required this.desc,
      required this.texto});
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
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    overflow: TextOverflow.ellipsis)),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
