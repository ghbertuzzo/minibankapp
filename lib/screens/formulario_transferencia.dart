import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/editor.dart';
import '../models/transferencia.dart';


const _tituloAppBar = 'Criando Transferência';

const _rotuloNumConta = 'Número da Conta';
const _dicaNumConta = '0000';

const _rotuloValor = 'Valor da Transferência';
const _dicaValor = '0,00';

const _textButtonConfirmar = 'Confirmar';


class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  void _criaTransferencia(BuildContext context) {
    final double? valor = double.tryParse(_controladorCampoValor.text);
    final int? conta = int.tryParse(_controladorCampoNumeroConta.text);
    if (conta != null && valor != null) {
      final transferCriada = Transferencia(valor, conta);
      Navigator.pop(context, transferCriada);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: _rotuloNumConta,
                dica: _dicaNumConta),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: _rotuloValor,
                dica: _dicaValor,
                icone: Icons.monetization_on),
            ElevatedButton(
                onPressed: () => _criaTransferencia(context),
                child: Text(_textButtonConfirmar))
          ],
        )));
  }
}
