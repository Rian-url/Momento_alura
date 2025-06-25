import 'package:flutter/material.dart';
import 'package:alura_project_model/src/Screens/jogoDaVelha_tela.dart';
import 'package:alura_project_model/src/Screens/home_tela.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlurAPP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 93, 47)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const TelaHome(),
    );
  }
}


