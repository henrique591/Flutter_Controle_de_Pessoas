// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Fatec Ferraz- Controle de Alunos",
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoa = 0;
  String _mensagem = "Pode Entrar!";

  _alteraContador(int i) {
    setState(() {
      _pessoa += i;

      if (_pessoa <= 0) {
        _mensagem = "Não há ninguem!";
        _pessoa = 0;
      } else if (_pessoa == 25) {
        _mensagem = "Sala meio ocupada!";
      } else if (_pessoa > 50) {
        _mensagem = "Lotado! Por Favor, Aguarde!";
        _pessoa = 50;
      } else {
        _mensagem = "Pode Entrar!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/folhas.jpg",
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Alunos: $_pessoa",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(40),
                  child: FlatButton(
                    color: Colors.greenAccent,
                    minWidth: 120,
                    child: Text(
                      "-1",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      _alteraContador(-1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: FlatButton(
                    color: Colors.greenAccent,
                    minWidth: 120,
                    child: Text(
                      "+1",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      _alteraContador(1);
                    },
                  ),
                ),
              ],
            ),
            Text(
              _mensagem,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 30,
              ),
            ), //
          ],
        ),
      ],
    );
  }
}
