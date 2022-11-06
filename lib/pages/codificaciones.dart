import 'package:diseno_codificaciones/pages/grafica.dart';
import 'package:diseno_codificaciones/preferncias.dart';
import 'package:flutter/material.dart';

import '../widgets/background.dart';

class CodificacionesScreen extends StatefulWidget {
  String titulo;
  bool retornoCero;
  bool negativoopostitivo;

  CodificacionesScreen({
    super.key,
    required this.titulo,
    required this.retornoCero,
    required this.negativoopostitivo,
  });

  @override
  State<CodificacionesScreen> createState() => _CodificacionesScreenState();
}

class _CodificacionesScreenState extends State<CodificacionesScreen> {
  bool nrz = false;
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
                const SizedBox(
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
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          GestureDetector(
            onTap: () {
              final FocusScopeNode focus = FocusScope.of(context);
              if (!focus.hasPrimaryFocus && focus.hasFocus) {
                FocusManager.instance.primaryFocus!.unfocus();
              }
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        alignment: Alignment.topLeft,
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color(0xff06F7074),
                          size: 35,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.titulo,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.all(20),
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        const Center(
                          child: Text(
                            'Ingresar texto',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xffB6B7BB)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          autocorrect: false,
                          keyboardType: TextInputType.name,
                          style: const TextStyle(color: Color(0xffB6B7BB)),
                          decoration: InputDecoration(
                              border:
                                  //*Cuando se esta
                                  OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 5.0),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              //*Cuando no se esta escribiendo en texto
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: '',
                              hintStyle: TextStyle(color: Color(0xffB6B7BB))),
                          onChanged: (texto) {},
                          maxLines: 4,
                        )
                      ],
                    ),
                  ),
                  Container(
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
                            const Text(
                              'RZ-L',
                              style: TextStyle(
                                  color: Color(0xffB6B7BB),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Switch(
                                activeColor: Color(0xffB6B7BB),
                                activeTrackColor: Color(0xff87E7E4),
                                value: widget.retornoCero,
                                onChanged: (value) {
                                  setState(() {
                                    if (widget.titulo == 'Manchester' ||
                                        widget.titulo ==
                                            'Manchester diferencial') {
                                      null;
                                    } else {
                                      widget.retornoCero = value!;
                                      if (widget.retornoCero) {
                                        nrz = false;
                                      } else {
                                        nrz = true;
                                      }
                                    }
                                  });
                                })
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
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
                                    if (widget.titulo == 'Manchester' ||
                                        widget.titulo ==
                                            'Manchester diferencial') {
                                      null;
                                    } else {
                                      this.nrz = value!;
                                      if (nrz) {
                                        widget.retornoCero = false;
                                      } else {
                                        widget.retornoCero = true;
                                      }
                                    }
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
                                    const Text(
                                      'RZ-L/NRZ-L',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                        'RZ(Retourn to zero): se tiene tension positiva en una parte de la duración de un 1 lógico, y cero durante el resto del tiempo. y NRZ-L (código NonReturn to Zero Level): un 1 lógico es un pulso de tensión, minetras que un 0 lógico es la ausencia de dicho pulso de tensión.')),
                                icon: const Icon(
                                  Icons.help_outline,
                                  color: Color(0xffB6B7BB),
                                  size: 25,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
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
                            const Text(
                              'Negativo',
                              style: TextStyle(
                                  color: Color(0xffB6B7BB),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            Checkbox(
                                checkColor: Colors.grey,
                                activeColor: Color(0xff87E7E4),
                                value: widget.negativoopostitivo,
                                onChanged: (value) {
                                  setState(() {
                                    if (widget.titulo == 'Manchester' ||
                                        widget.titulo ==
                                            'Manchester diferencial' ||
                                        widget.titulo == 'Polar') {
                                      null;
                                    } else {
                                      widget.negativoopostitivo = value!;
                                      if (widget.negativoopostitivo) {
                                        this.positivo = false;
                                      } else {
                                        widget.negativoopostitivo = true;
                                      }
                                    }
                                  });
                                })
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Positivo',
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
                                    if (widget.titulo == 'Manchester' ||
                                        widget.titulo ==
                                            'Manchester diferencial' ||
                                        widget.titulo == 'Polar') {
                                      null;
                                    } else {
                                      this.positivo = value!;
                                      if (positivo) {
                                        widget.negativoopostitivo = false;
                                      } else {
                                        this.positivo = true;
                                      }
                                    }
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
                                    const Text(
                                      'Negativo/Positivo',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                        'En cualquiera de los dos casos puede tomar el valor de cero y cunado es positivo: en la gráfica toma valores positivos; en cambio negativos: toma valores en la gráfica negativos.')),
                                icon: const Icon(
                                  Icons.help_outline,
                                  color: Color(0xffB6B7BB),
                                  size: 25,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Column(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'grafica',
                                //*Cmabira titulo
                                arguments: Preferencias(widget.titulo,
                                    widget.negativoopostitivo, widget.retornoCero));
                          },
                          height: 55,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          disabledColor: Colors.grey,
                          elevation: 0,
                          color: Colors.amber,
                          child: Container(
                            child: const Text(
                              '  Enviar  ',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
