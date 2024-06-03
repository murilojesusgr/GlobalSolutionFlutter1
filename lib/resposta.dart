import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  const Resposta(this.texto, this.quandoSelecionado, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style:  ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 3, 103, 166),
          foregroundColor: const Color.fromARGB(255, 244, 231, 197),
        ),
        onPressed: quandoSelecionado,
        child: Text(texto),
      ),
    );
  }
}

