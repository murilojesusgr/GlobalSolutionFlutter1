import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      //Texto para apresentar o projeto
      'texto': 'O que é a Econômia Azul?\n\n' 'Desenvolvimento sustentável dos oceanos, promovendo crescimento econômico, inclusão social e preservação ambiental. Visa explorar os recursos marinhos de forma inteligente e sustentável, evitando a degradação dos ecossistemas.',
      'respostas': [
        {'texto': 'Vamos Juntos Salvar O Oceano!', 'pontuacao': 0},
      ]
    },
    {
      //Primeira Pergunta: O20
      'texto': 'Do que se trata o O20?',
      'respostas': [
        {'texto': 'Redução da poluição e proteção da biodiversidade marinha.', 'pontuacao': 10},
        {'texto': 'Aumento da atividade de pesca industrial sem regulamentação.', 'pontuacao': 0},
        {'texto': 'Expansão das plataformas de petróleo offshore.', 'pontuacao': 0},
      ],
    },
    {
      //Segunda Pergunta: Econômia Azul
      'texto': 'O que é a Economia Azul?',
      'respostas': [
        {'texto': 'Uma iniciativa para aumentar o turismo nas praias.', 'pontuacao': 0},
        {'texto': 'Um conjunto de práticas para utilizar os recursos oceânicos de forma sustentável e promover crescimento econômico.', 'pontuacao': 10},
        {'texto': 'Um programa para construir mais portos comerciais.', 'pontuacao': 0},
      ],
    },
    {
      //Terceira Pergunta: O20
      'texto': 'Como o projeto Oceans 20 pode ajudar a combater as mudanças climáticas?',
      'respostas': [
        {'texto': 'Incentivando a pesca em larga escala.', 'pontuacao': 0},
        {'texto': 'Aumentando a quantidade de cruzeiros marítimos.', 'pontuacao': 0},
        {'texto': 'Promovendo a conservação de ecossistemas marinhos que atuam como sumidouros de carbono.', 'pontuacao': 10},
      ],
    },
    {
      //Quarta Pergunta: Econômia Azul
      'texto': 'Marque benefícios da Economia Azul:',
      'respostas': [
        {'texto': 'Melhoria dos meios de subsistência e criação de empregos sustentáveis.', 'pontuacao': 10},
        {'texto': 'Poluição plástica nos oceanos', 'pontuacao': 0},
        {'texto': 'Aumento da exploração mineral submarina.', 'pontuacao': 0},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          //Título Alterado
          title: const Text('Oceans 20: FIAP 2024'),
          //Barra do Título
          backgroundColor: const Color.fromARGB(255, 3, 103, 166),
          //Cor do Título
          foregroundColor: const Color.fromARGB(255, 244, 231, 197),
        ),
        //Cor do Aplicativo
        backgroundColor: const Color.fromARGB(255, 108, 171, 223),
        body: 
        Column(
            children: <Widget>[
              Image.asset(
                'images/imagem1.png',
                height: 150,
                width: 150,
              ),
        temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
