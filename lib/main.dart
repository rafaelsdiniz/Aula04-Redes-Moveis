import 'package:flutter/material.dart';

import 'telas/tela_perfil.dart';

void main() {
  runApp(const PerfilApp());
}

class PerfilApp extends StatelessWidget {
  const PerfilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil de Usuário',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF007AFF),
        scaffoldBackgroundColor: const Color(0xFFF2F2F7),
        platform: TargetPlatform.iOS,
        splashFactory: NoSplash.splashFactory,
      ),
      home: const TelaPerfil(),
    );
  }
}
