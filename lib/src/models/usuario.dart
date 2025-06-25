import 'dart:convert';
import 'package:http/http.dart' as http;

class Usuario {
  final int id;
  final String nome;
  final String apelido;
  final int qt_partidas;
  final int qt_vitorias;
  final int qt_empates;
  final int qt_derrotas;

  Usuario(
      {required this.id,
      required this.nome,
      required this.apelido,
      required this.qt_partidas,
      required this.qt_derrotas,
      required this.qt_empates,
      required this.qt_vitorias});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
        id: json['CD_USUARIO'],
        nome: json['NM_COMPLETO'],
        apelido: json['NM_APELIDO'],
        qt_partidas: json['QT_PARTIDAS'],
        qt_derrotas: json['QT_DERROTAS'],
        qt_empates: json['QT_EMPATES'],
        qt_vitorias: json['QT_VITORIAS']);
  }
}

Future<List<Usuario>> BuscarUsuarios() async {
  final usuariosJson =
      await http.get(Uri.parse('http://localhost:3000/usuarios'));

  try {
    List<dynamic> listaJson = jsonDecode(usuariosJson.body);
    return listaJson.map((json) => Usuario.fromJson(json)).toList();
  } catch (erro) {
    throw Exception('Erro ao buscar usuários, erro: $erro');
  }
}
