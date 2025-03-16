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
      body: 
      Center(
        child: Stack(
         alignment: Alignment.center,
          children: [
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
                     Container(
                      child: Image.asset(
                          'x.png',
                          width: 100,
                          height: 100,
                          ),
                     ),
                     SizedBox(width: 120),
                     Container(
                      child: Image.asset(
                          'o.png',
                          width: 100,
                          height: 100,
                          ),
                     ),
                     SizedBox(width: 120),
                     Container(
                      child: Image.asset(
                          'x.png',
                          width: 100,
                          height: 100,
                          ),
                     )
                  ],
                ), SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Container(
                      child: Image.asset(
                          'o.png',
                          width: 100,
                          height: 100,
                          ),
                     ),
                     SizedBox(width: 120),
                     Container(
                      child: Image.asset(
                          'x.png',
                          width: 100,
                          height: 100,
                          ),
                     ),
                     SizedBox(width: 120),
                     Container(
                      child: Image.asset(
                          'o.png',
                          width: 100,
                          height: 100,
                          ),
                     )
                  ],
                ), SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Container(
                      child: Image.asset(
                          'o.png',
                          width: 100,
                          height: 100,
                          ),
                     ),
                     SizedBox(width: 120),
                     Container(
                      child: Image.asset(
                          'o.png',
                          width: 100,
                          height: 100,
                          ),
                     ),
                     SizedBox(width: 120),
                     Container(
                      child: Image.asset(
                          'x.png',
                          width: 100,
                          height: 100,
                          ),
                     )
                  ],
                )
              ],
             )
            

          ]
        ),
      ),
    );
  }
}
