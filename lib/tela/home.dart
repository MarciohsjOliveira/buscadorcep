import 'package:buscador_cep/componente/buscador.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Buscador de CEP',
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Buscador(),
            ],
          ),
        ),
      ),
    );
  }
}
