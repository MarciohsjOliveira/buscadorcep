import 'package:buscador_cep/modelo/logradouro.dart';
import 'package:buscador_cep/repositorio/cep_repositorio.dart';
import 'package:mobx/mobx.dart';

part "cep_buscador.g.dart";

class CepBuscador = _CepBuscador with _$CepBuscador;

abstract class _CepBuscador with Store {
  _CepBuscador() {
    autorun((_) {
      if (clearCep.length != 8) {
        _reset();
      } else {
        _searchCep();
      }
    });
  }

  @observable
  String cep = '';

  @action
  void setCep(String value) => cep = value;

  @computed
  String get clearCep => cep.replaceAll(RegExp('[^0-9]'), '');

  @observable
  Logradouro logradouro;

  @observable
  String error;

  @observable
  bool carregando = false;

  @action
  Future<void> _searchCep() async {
    carregando = true;
    try {
      logradouro = await CepRepositorio().getLogradouroFromApi(clearCep);
      error = null;
    } catch (e) {
      error = e;
      logradouro = null;
    }
    carregando = false;
  }

  @action
  void _reset() {
    logradouro = null;
    error = null;
  }
}
