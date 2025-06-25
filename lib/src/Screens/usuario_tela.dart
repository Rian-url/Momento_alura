import 'package:flutter/material.dart';
import '../models/Usuario.dart';

class TelaUsuario extends StatelessWidget {
  const TelaUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Jogo da Velha')),
          backgroundColor: const Color.fromARGB(255, 0, 93, 47),
          foregroundColor: Colors.white,
        ),
        body: FutureBuilder<List<Usuario>>(
            future: BuscarUsuarios(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("Erro: ${snapshot.error}"));
              }

              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.none:
                  return const Center(child: Text("Sem conexão"));
                case ConnectionState.active:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    return ListaUsuariosWidget(snapshot: snapshot);
                  } else {
                    return const Center(child: Text("Sem dados"));
                  }
              }
            }));
  }
}

class ListaUsuariosWidget extends StatelessWidget {
  final AsyncSnapshot<List<Usuario>> snapshot;

  const ListaUsuariosWidget({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    final usuarios = snapshot.data!;
    return ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (context, index) {
          final usuario = usuarios[index];

          return ListBody(
            children: [
              Text('Nome: ${usuario.nome}'),
              Text('Id: ${usuario.id}'),
              Text('Partidas: ${usuario.qt_partidas}'),
              Text('Vitorias: ${usuario.qt_vitorias}', style: TextStyle(color: Colors.green)),
              Text('Empates: ${usuario.qt_empates}', style: TextStyle(color: Colors.yellow)) ,
              Text('Derrotas: ${usuario.qt_derrotas}', style: TextStyle(color: Colors.red)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05)
            ],
          );
        });
  }
}
