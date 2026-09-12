import 'package:flutter/material.dart';

import 'telas/tela_perfil.dart';

void main() {
  runApp(const PerfilApp());
}

/// Aplicativo da Atividade Aula 04 - Perfil de Usuário.
///
/// Como o app possui uma única tela, ela é definida diretamente em `home:`
/// do [MaterialApp], sem necessidade de rotas nomeadas.
class PerfilApp extends StatelessWidget {
  const PerfilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil de Usuário',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const TelaPerfil(),
    );
  }
}
