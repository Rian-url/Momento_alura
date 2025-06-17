import 'package:flutter/material.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contador = 0;
  List<String> casas = List.filled(9, ''); // ALTERAÇÃO 01
  bool isXTurn = true; // ALTERAÇÃO 02

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 93, 47),
        title: const Center(
          child: Text(
            "Momento Alura",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Center(
        child: Stack(alignment: Alignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 3,
                height: MediaQuery.of(context).size.height * .7,
                color: Colors.black,
              ),
              const SizedBox(width: 200),
              Container(
                width: 3,
                height: MediaQuery.of(context).size.height * .7,
                color: Colors.black,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.height * .7,
                height: 3,
                color: Colors.black,
              ),
              const SizedBox(height: 200),
              Container(
                width: MediaQuery.of(context).size.height * .7,
                height: 3,
                color: Colors.black,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCell(0),
                  buildCell(1),
                  buildCell(2),
                ],
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCell(3),
                  buildCell(4),
                  buildCell(5),
                ],
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCell(6),
                  buildCell(7),
                  buildCell(8),
                ],
              )
            ],
          )
        ]),
      ),
    );
  }

  void handleTap(int index) {
    if (casas[index] != '') return;

    setState(() {
      //fazer sem set state
      casas[index] = isXTurn ? 'x' : 'o';
      isXTurn = !isXTurn;
    });

    //se deu velha
    if (isVelha()) {
      //mostra empate
      showEmpate();
    } else if (isVitoria()) {
      //mostra vitoria
      showVitoria();
    }
    //continua o jogo
  }

  Widget buildCell(int index) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        shadowColor: WidgetStateProperty.all(Colors.transparent),
        elevation: WidgetStateProperty.all(0),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
      ),
      onPressed: () {
        handleTap(index);
      },
      child: SizedBox(
        width: 100,
        height: 100,
        child: casas[index] == ''
            ? null
            : Image.asset(
                '${casas[index]}.png',
                width: 100,
                height: 100,
              ),
      ),
    );
  }

  void showEmpate() {
    if (!casas.contains('')) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Empate!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                reiniciar();
              },
              child: const Text("Reiniciar"),
            )
          ],
        ),
      );
    }
  }

  void showVitoria() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Vitória!"),
        content: Text("${!isXTurn ? 'X' : 'O'} venceu o jogo!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              reiniciar();
            },
            child: const Text("Reiniciar"),
          )
        ],
      ),
    );
  }

  void reiniciar() {
    setState(() {
      casas = List.filled(9, '');
      isXTurn = true;
    });
  }

  bool isVelha() {
    return !casas.contains('') && !isVitoria();
  }

  bool isVitoria() {
    const List<List<int>> seqVitoria = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (List<int> pos in seqVitoria) {
      String a = casas[pos[0]];
      String b = casas[pos[1]];
      String c = casas[pos[2]];

      if (a != '' && a == b && b == c) {
        return true;
      }
    }

    return false;
  }
}
