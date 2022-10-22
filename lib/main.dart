import 'package:diseno_codificaciones/pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home' : (_) => HomeScreen()
      },
     theme: Theme.of(context).copyWith(
      unselectedWidgetColor: Color(0xff87E7E4)
     ),
    );
  }
}
