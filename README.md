# Aula 04 - Perfil de Usuário (Flutter)

Atividade individual da disciplina **Programação para Dispositivos Móveis I**.
O app possui uma única tela, a **Tela de Perfil de Usuário**, construída em
Flutter e cobrindo as quatro fases pedidas na atividade.

## Estrutura

```
lib/
├── main.dart              # MaterialApp com a TelaPerfil em `home:`
└── telas/
    └── tela_perfil.dart   # Tela de Perfil de Usuário (StatefulWidget)
```

## Fases da atividade cobertas na tela

| Fase | Widgets / conceitos utilizados |
| ---- | ------------------------------ |
| 1 | `SafeArea`, `SingleChildScrollView`, `Padding` e `SizedBox` com espaçamento único (`_espacamento = 16`) |
| 2 | `Container` + `BoxDecoration` (cor e `borderRadius`), `Stack` com selo de verificado sobre o avatar, `Row` com `Expanded` e `Spacer`, `Wrap` com chips de interesses |
| 3 | `StatefulWidget`, `SwitchListTile`, `CheckboxListTile`, `FloatingActionButton` (alterna modo de edição), `AnimatedContainer` ligado ao estado |
| 4 | `ListTile` com `leading`, `title` e `trailing`, `Divider`, uso de `const` |

## Como executar

Pré-requisito: [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado.

```bash
flutter pub get
flutter analyze
flutter run            # escolhe o dispositivo conectado
flutter run -d chrome  # ou direto no navegador
```
