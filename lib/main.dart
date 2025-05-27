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
  List<String> casas = List.filled(9, '');
  bool isTurnoX = true;

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
              SizedBox(width: 200),
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
              SizedBox(height: 200),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  casaWidget(0),
                  SizedBox(width: 120),
                  casaWidget(1),
                  SizedBox(width: 120),
                  casaWidget(2),
                ],
              ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  casaWidget(3),
                  SizedBox(width: 120),
                  casaWidget(4),
                  SizedBox(width: 120),
                  casaWidget(5),
                ],
              ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  casaWidget(6),
                  SizedBox(width: 120),
                  casaWidget(7),
                  SizedBox(width: 120),
                  casaWidget(8),
                ],
              )
            ],
          )
        ]),
      ),
    );
  }

  Widget casaWidget(int index) {
    return InkWell(
      onTap: () {
        if (casas[index] != '') return;

        setState(() {
          casas[index] = isTurnoX ? 'x' : 'o';
          isTurnoX = !isTurnoX;
        });

        if (isVelha()) {
          showEmpate();
        } else if (isVitoria()) {
          showVitoria();
        }
      },
      child: Container(
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

  bool isVelha() {
    return !casas.contains('');
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

  void showVitoria() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Vitória!"),
              content: Text("${isTurnoX ? 'O' : 'X'} venceu o jogo da #"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      reiniciar();
                    },
                    child: Text("Reiniciar"))
              ],
            ));
  }

  void showEmpate() {
    if (!casas.contains('')) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Empate!"),
                content: Text("Deu velha"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        reiniciar();
                      },
                      child: Text("Reiniciar"))
                ],
              ));
    }
  }

  void reiniciar() {
    setState(() {
      casas = List.filled(9, '');
      isTurnoX = true;
    });
  }
}
