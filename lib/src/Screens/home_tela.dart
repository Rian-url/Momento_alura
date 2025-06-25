import 'package:flutter/material.dart';
import 'package:alura_project_model/src/Screens/jogoDaVelha_tela.dart';
import 'package:alura_project_model/src/Screens/usuario_tela.dart';

class TelaHome extends StatelessWidget {
  const TelaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Jogo da Velha')),
          backgroundColor: const Color.fromARGB(255, 0, 93, 47),
          foregroundColor: Colors.white,
        ),
        body: Center(
            child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TelaJogoDaVelha()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[600],
                      minimumSize: const Size(300, 50)),
                  child: Text('Jogar', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TelaUsuario()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[600],
                      minimumSize: const Size(300, 50)),
                  child: Text('Ranking', style: TextStyle(color: Colors.white)),
                )
              ],
            )
          ],
        )));
  }
}
