import 'package:flutter/material.dart';

/// Tela de Perfil de Usuário
///
/// Atividade Aula 04 - Programação para Dispositivos Móveis I
/// Cobre as 4 fases pedidas:
///  Fase 1 - SafeArea, SingleChildScrollView, Padding/SizedBox consistentes
///  Fase 2 - Container+BoxDecoration, Stack, Row (Expanded/Spacer), Wrap
///  Fase 3 - StatefulWidget, SwitchListTile, CheckboxListTile,
///           FloatingActionButton, AnimatedContainer
///  Fase 4 - ListTile, Divider, const
class TelaPerfil extends StatefulWidget {
  const TelaPerfil({super.key});

  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  // ---- Estado da tela (Fase 3) ----
  bool _perfilPublico = true;
  bool _receberNotificacoes = false;
  bool _modoEdicao = false;

  // Espaçamento único usado na tela inteira (Fase 1 - "repare no detalhe")
  static const double _espacamento = 16;

  void _alternarModoEdicao() {
    setState(() {
      _modoEdicao = !_modoEdicao;
      // Efeito visível do FAB: ao sair do modo edição, desliga notificações.
      if (!_modoEdicao) {
        _receberNotificacoes = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
      ),
      // ---- Fase 3: FloatingActionButton com efeito visível ----
      floatingActionButton: FloatingActionButton(
        onPressed: _alternarModoEdicao,
        tooltip: _modoEdicao ? 'Concluir edição' : 'Editar perfil',
        child: Icon(_modoEdicao ? Icons.check : Icons.edit),
      ),
      // ---- Fase 1: SafeArea envolvendo a área útil ----
      body: SafeArea(
        // ---- Fase 1: rolagem na raiz do corpo ----
        child: SingleChildScrollView(
          // ---- Fase 1: Padding consistente ----
          padding: const EdgeInsets.all(_espacamento),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildCartaoPerfil(),
              const SizedBox(height: _espacamento),
              _buildEstatisticas(),
              const SizedBox(height: _espacamento),
              _buildInteresses(),
              const SizedBox(height: _espacamento),
              const Divider(),
              const SizedBox(height: _espacamento / 2),
              _buildPreferencias(),
              const SizedBox(height: _espacamento),
              const Divider(),
              const SizedBox(height: _espacamento / 2),
              _buildInformacoesContato(),
              const SizedBox(height: _espacamento),
              _buildBlocoAnimado(),
              const SizedBox(height: _espacamento * 2),
            ],
          ),
        ),
      ),
    );
  }

  /// Fase 2: Container + BoxDecoration (cor de fundo e borderRadius) e
  /// Stack sobrepondo um selo de "verificado" no avatar.
  Widget _buildCartaoPerfil() {
    return Container(
      padding: const EdgeInsets.all(_espacamento),
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // ---- Fase 2: Stack sobrepondo camadas em 1 ponto da tela ----
          Stack(
            clipBehavior: Clip.none,
            children: [
              const CircleAvatar(
                radius: 36,
                backgroundColor: Colors.indigo,
                child: Icon(Icons.person, size: 40, color: Colors.white),
              ),
              Positioned(
                right: -2,
                bottom: -2,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.verified,
                    color: Colors.blue,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: _espacamento),
          // ---- Fase 2: Row usando Expanded ----
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Rafael Diniz',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'Desenvolvedor de software · Palmas, TO',
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Fase 2: Row com Expanded e Spacer distribuindo estatísticas.
  Widget _buildEstatisticas() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: _espacamento / 2),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Spacer(),
          _buildEstatisticaItem('12', 'Projetos'),
          const Spacer(),
          _buildEstatisticaItem('340', 'Seguidores'),
          const Spacer(),
          _buildEstatisticaItem('180', 'Seguindo'),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildEstatisticaItem(String valor, String rotulo) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          valor,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(rotulo, style: const TextStyle(fontSize: 12, color: Colors.black54)),
      ],
    );
  }

  /// Fase 2: Wrap com 3 ou mais etiquetas que quebram de linha.
  Widget _buildInteresses() {
    const interesses = [
      'Flutter',
      'Java',
      'Spring Boot',
      'Backend',
      'Geoprocessamento',
      'UI/UX',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Interesses',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: _espacamento / 2),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: interesses
              .map(
                (item) => Chip(
                  label: Text(item),
                  backgroundColor: Colors.indigo.shade50,
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  /// Fase 3: SwitchListTile e CheckboxListTile respondendo ao toque.
  Widget _buildPreferencias() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Preferências',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Perfil público'),
          subtitle: const Text('Outras pessoas podem ver seu perfil'),
          value: _perfilPublico,
          onChanged: (valor) {
            setState(() {
              _perfilPublico = valor;
            });
          },
        ),
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text('Receber notificações'),
          subtitle: const Text('Novidades e atualizações por e-mail'),
          value: _receberNotificacoes,
          onChanged: (valor) {
            setState(() {
              _receberNotificacoes = valor ?? false;
            });
          },
        ),
      ],
    );
  }

  /// Fase 4: ListTile com leading, title e trailing preenchidos.
  Widget _buildInformacoesContato() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contato',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(Icons.email_outlined),
          title: Text('E-mail'),
          trailing: Text('rafael@grpagency.com'),
        ),
        const Divider(height: 1),
        const ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(Icons.phone_outlined),
          title: Text('Telefone'),
          trailing: Text('(63) 9 9999-0000'),
        ),
      ],
    );
  }

  /// Fase 3: AnimatedContainer ligado ao estado, com duration definido.
  Widget _buildBlocoAnimado() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(_espacamento),
      width: double.infinity,
      height: _modoEdicao ? 100 : 64,
      decoration: BoxDecoration(
        color: _modoEdicao ? Colors.amber.shade100 : Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        _modoEdicao
            ? 'Modo de edição ativo: altere suas preferências acima e toque no botão de novo para concluir.'
            : 'Toque no botão de edição para atualizar seu perfil.',
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }
}
