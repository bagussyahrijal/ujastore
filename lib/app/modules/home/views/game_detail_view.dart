import 'package:flutter/material.dart';

class GameDetailView extends StatelessWidget {
  final String gameName;

  GameDetailView({required this.gameName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gameName),
        backgroundColor: Color.fromRGBO(27, 56, 78, 1), // Warna tema
      ),
      body: Center(
        child: Text(
          'Detail dari $gameName',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
