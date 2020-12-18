import 'package:brasil_fields/brasil_fields.dart';
import 'package:buscador_cep/cep_buscador/cep_buscador.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Buscador extends StatelessWidget {
  final CepBuscador cepBuscador = CepBuscador();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Column(children: [
          TextFormField(
            onChanged: cepBuscador.setCep,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CepInputFormatter(),
            ],
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              labelText: "Digite seu CEP",
              hintText: 'exemplo: 01001000',
              alignLabelWithHint: true,
            ),
          ),
          Observer(builder: (_) {
            if (cepBuscador.logradouro == null &&
                cepBuscador.error == null &&
                !cepBuscador.carregando)
              return Container();
            else if (cepBuscador.logradouro == null &&
                cepBuscador.error == null)
              return LinearProgressIndicator();
            else if (cepBuscador.error != null)
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.red.withAlpha(100),
                  height: 50,
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    cepBuscador.error,
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.red),
                  ),
                ),
              );
            else {
              final a = cepBuscador.logradouro;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: Colors.blue.withAlpha(100),
                  height: 100,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Localização: '
                        '${a.logradouro}',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      Text(
                        'Bairro: '
                        '${a.distrito}',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      Text(
                        'Cidade: '
                        '${a.localidade}',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                      Text(
                        'UF: '
                        '${a.uf}',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
        ]),
      ),
    );
  }
}
