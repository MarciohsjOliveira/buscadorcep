// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cep_buscador.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CepBuscador on _CepBuscador, Store {
  Computed<String> _$clearCepComputed;

  @override
  String get clearCep => (_$clearCepComputed ??=
          Computed<String>(() => super.clearCep, name: '_CepBuscador.clearCep'))
      .value;

  final _$cepAtom = Atom(name: '_CepBuscador.cep');

  @override
  String get cep {
    _$cepAtom.reportRead();
    return super.cep;
  }

  @override
  set cep(String value) {
    _$cepAtom.reportWrite(value, super.cep, () {
      super.cep = value;
    });
  }

  final _$logradouroAtom = Atom(name: '_CepBuscador.logradouro');

  @override
  Logradouro get logradouro {
    _$logradouroAtom.reportRead();
    return super.logradouro;
  }

  @override
  set logradouro(Logradouro value) {
    _$logradouroAtom.reportWrite(value, super.logradouro, () {
      super.logradouro = value;
    });
  }

  final _$errorAtom = Atom(name: '_CepBuscador.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$carregandoAtom = Atom(name: '_CepBuscador.carregando');

  @override
  bool get carregando {
    _$carregandoAtom.reportRead();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.reportWrite(value, super.carregando, () {
      super.carregando = value;
    });
  }

  final _$_searchCepAsyncAction = AsyncAction('_CepBuscador._searchCep');

  @override
  Future<void> _searchCep() {
    return _$_searchCepAsyncAction.run(() => super._searchCep());
  }

  final _$_CepBuscadorActionController = ActionController(name: '_CepBuscador');

  @override
  void setCep(String value) {
    final _$actionInfo =
        _$_CepBuscadorActionController.startAction(name: '_CepBuscador.setCep');
    try {
      return super.setCep(value);
    } finally {
      _$_CepBuscadorActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _reset() {
    final _$actionInfo =
        _$_CepBuscadorActionController.startAction(name: '_CepBuscador._reset');
    try {
      return super._reset();
    } finally {
      _$_CepBuscadorActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cep: ${cep},
logradouro: ${logradouro},
error: ${error},
carregando: ${carregando},
clearCep: ${clearCep}
    ''';
  }
}
