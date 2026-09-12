import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';

class TelaPerfil extends StatefulWidget {
  const TelaPerfil({super.key});

  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  bool _perfilPublico = true;
  bool _receberNotificacoes = false;
  bool _modoEdicao = false;

  static const double _espacamento = 16;

  static const Color _fundo = Color(0xFFF2F2F7);
  static const Color _cartao = Colors.white;
  static const Color _azul = Color(0xFF007AFF);
  static const Color _verde = Color(0xFF34C759);
  static const Color _laranja = Color(0xFFFF9500);
  static const Color _texto = Color(0xFF1C1C1E);
  static const Color _textoSecundario = Color(0xFF8E8E93);
  static const Color _separador = Color(0xFFD1D1D6);
  static const double _raio = 14;

  void _alternarModoEdicao() {
    setState(() {
      _modoEdicao = !_modoEdicao;
      if (!_modoEdicao) {
        _receberNotificacoes = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _fundo,
      appBar: AppBar(
        backgroundColor: _fundo,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text(
          'Perfil',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: _texto,
            letterSpacing: -0.4,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _alternarModoEdicao,
        tooltip: _modoEdicao ? 'Concluir edição' : 'Editar perfil',
        backgroundColor: _modoEdicao ? _verde : _azul,
        foregroundColor: Colors.white,
        elevation: 2,
        shape: const StadiumBorder(),
        icon: Icon(
          _modoEdicao ? CupertinoIcons.checkmark_alt : CupertinoIcons.pencil,
          size: 20,
        ),
        label: Text(
          _modoEdicao ? 'Concluir' : 'Editar',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(_espacamento),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Meu Perfil',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: _texto,
                  letterSpacing: -0.8,
                ),
              ),
              const SizedBox(height: _espacamento),
              _buildCartaoPerfil(),
              const SizedBox(height: _espacamento),
              _buildEstatisticas(),
              const SizedBox(height: _espacamento),
              _buildBlocoAnimado(),
              const SizedBox(height: _espacamento * 1.5),
              _buildTituloSecao('Interesses'),
              _buildInteresses(),
              const SizedBox(height: _espacamento * 1.5),
              _buildTituloSecao('Preferências'),
              _buildPreferencias(),
              const SizedBox(height: _espacamento * 1.5),
              _buildTituloSecao('Contato'),
              _buildInformacoesContato(),
              const SizedBox(height: _espacamento * 5),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTituloSecao(String titulo) {
    return Padding(
      padding: const EdgeInsets.only(
        left: _espacamento,
        bottom: _espacamento / 2,
      ),
      child: Text(
        titulo.toUpperCase(),
        style: const TextStyle(
          fontSize: 13,
          color: _textoSecundario,
          letterSpacing: 0.2,
        ),
      ),
    );
  }

  BoxDecoration _decoracaoCartao() {
    return BoxDecoration(
      color: _cartao,
      borderRadius: BorderRadius.circular(_raio),
    );
  }

  Widget _buildSeparador() {
    return const Divider(
      height: 0.5,
      thickness: 0.5,
      indent: _espacamento,
      color: _separador,
    );
  }

  Widget _buildCartaoPerfil() {
    return Container(
      padding: const EdgeInsets.all(_espacamento),
      decoration: _decoracaoCartao(),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              const CircleAvatar(
                radius: 38,
                backgroundColor: _fundo,
                backgroundImage: AssetImage('assets/imagens/foto_perfil.jpeg'),
              ),
              Positioned(
                right: -4,
                bottom: -4,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: _cartao,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    CupertinoIcons.checkmark_seal_fill,
                    color: _azul,
                    size: 22,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: _espacamento),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Rafael Diniz',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: _texto,
                    letterSpacing: -0.4,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Desenvolvedor de software',
                  style: TextStyle(fontSize: 15, color: _textoSecundario),
                ),
                Text(
                  'Palmas, TO',
                  style: TextStyle(fontSize: 15, color: _textoSecundario),
                ),
              ],
            ),
          ),
          const SizedBox(width: _espacamento / 2),
          const Icon(CupertinoIcons.chevron_right, size: 18, color: _separador),
        ],
      ),
    );
  }

  Widget _buildEstatisticas() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: _espacamento),
      decoration: _decoracaoCartao(),
      child: Row(
        children: [
          const Spacer(),
          _buildEstatisticaItem('12', 'Projetos'),
          const Spacer(),
          _buildDivisorVertical(),
          const Spacer(),
          _buildEstatisticaItem('340', 'Seguidores'),
          const Spacer(),
          _buildDivisorVertical(),
          const Spacer(),
          _buildEstatisticaItem('180', 'Seguindo'),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildDivisorVertical() {
    return Container(width: 0.5, height: 32, color: _separador);
  }

  Widget _buildEstatisticaItem(String valor, String rotulo) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          valor,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: _texto,
            letterSpacing: -0.4,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          rotulo,
          style: const TextStyle(fontSize: 13, color: _textoSecundario),
        ),
      ],
    );
  }

  Widget _buildInteresses() {
    const interesses = [
      'Flutter',
      'Java',
      'Spring Boot',
      'Backend',
      'Geoprocessamento',
      'UI/UX',
    ];

    return Container(
      padding: const EdgeInsets.all(_espacamento),
      decoration: _decoracaoCartao(),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: interesses
            .map(
              (item) => Chip(
                label: Text(item),
                labelStyle: const TextStyle(
                  color: _azul,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                backgroundColor: _azul.withValues(alpha: 0.12),
                side: BorderSide.none,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(horizontal: 6),
                visualDensity: VisualDensity.compact,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildPreferencias() {
    return Container(
      decoration: _decoracaoCartao(),
      child: Column(
        children: [
          SwitchListTile.adaptive(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: _espacamento,
              vertical: 2,
            ),
            activeTrackColor: _verde,
            title: const Text(
              'Perfil público',
              style: TextStyle(fontSize: 17, color: _texto),
            ),
            subtitle: const Text(
              'Outras pessoas podem ver seu perfil',
              style: TextStyle(fontSize: 13, color: _textoSecundario),
            ),
            value: _perfilPublico,
            onChanged: (valor) {
              setState(() {
                _perfilPublico = valor;
              });
            },
          ),
          _buildSeparador(),
          CheckboxListTile.adaptive(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: _espacamento,
              vertical: 2,
            ),
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: _azul,
            title: const Text(
              'Receber notificações',
              style: TextStyle(fontSize: 17, color: _texto),
            ),
            subtitle: const Text(
              'Novidades e atualizações por e-mail',
              style: TextStyle(fontSize: 13, color: _textoSecundario),
            ),
            value: _receberNotificacoes,
            onChanged: (valor) {
              setState(() {
                _receberNotificacoes = valor ?? false;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildIconeContato(IconData icone, Color cor) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Icon(icone, size: 18, color: Colors.white),
    );
  }

  Widget _buildInformacoesContato() {
    return Container(
      decoration: _decoracaoCartao(),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: _espacamento,
            ),
            leading: _buildIconeContato(CupertinoIcons.mail_solid, _azul),
            title: const Text(
              'E-mail',
              style: TextStyle(fontSize: 17, color: _texto),
            ),
            trailing: _buildValorContato('rafaeldiniz@unitins.br'),
          ),
          _buildSeparador(),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: _espacamento,
            ),
            leading: _buildIconeContato(CupertinoIcons.phone_fill, _verde),
            title: const Text(
              'Telefone',
              style: TextStyle(fontSize: 17, color: _texto),
            ),
            trailing: _buildValorContato('(63) 9 9999-0000'),
          ),
        ],
      ),
    );
  }

  Widget _buildValorContato(String valor) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          valor,
          style: const TextStyle(fontSize: 15, color: _textoSecundario),
        ),
        const SizedBox(width: 6),
        const Icon(CupertinoIcons.chevron_right, size: 16, color: _separador),
      ],
    );
  }

  Widget _buildBlocoAnimado() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(
        horizontal: _espacamento,
        vertical: _espacamento * 0.75,
      ),
      width: double.infinity,
      height: _modoEdicao ? 92 : 64,
      decoration: BoxDecoration(
        color: _modoEdicao
            ? _laranja.withValues(alpha: 0.15)
            : _azul.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(_raio),
      ),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Icon(
            _modoEdicao
                ? CupertinoIcons.pencil_circle_fill
                : CupertinoIcons.info_circle_fill,
            color: _modoEdicao ? _laranja : _azul,
            size: 26,
          ),
          const SizedBox(width: _espacamento * 0.75),
          Expanded(
            child: Text(
              _modoEdicao
                  ? 'Modo de edição ativo: altere suas preferências e toque em Concluir para salvar.'
                  : 'Toque em Editar para atualizar seu perfil.',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: _modoEdicao ? const Color(0xFF8A4B00) : _azul,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
