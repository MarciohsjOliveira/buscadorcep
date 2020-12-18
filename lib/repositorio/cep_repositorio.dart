import 'package:buscador_cep/modelo/logradouro.dart';
import 'package:dio/dio.dart';

class CepRepositorio {
//metodo para buscar CEP por paramentro
//na API VIA cep
  Future<Logradouro> getLogradouroFromApi(String cep) async {
    //tratando erro para não consumir Api
    if (cep == null || cep.isEmpty) return Future.error('CEP Inválido');

    //removendo caracteres
    final clearCep = cep.replaceAll(RegExp('[^0-9]'), '');
    if (clearCep.length != 8) return Future.error('CEP Inválido');

    //obtendo a Api do Via CEP
    final endpoint = 'http://viacep.com.br/ws/$clearCep/json';

    //Duas fontes de erro sendo tratadas por isso utilizou-se o catch
    try {
      final resposta = await Dio().get(endpoint);

      //Tratando uma exceção caso não exista o CEP

      if (resposta.data.containsKey('erro') && resposta.data['erro'])
        return Future.error('CEP Inválido');

      // Obtendo nome UF da API do IBGE
      //final ufList = await IBGERepositorio().getUFList();

      //Novo objeto logradouro
      return Logradouro(
          cep: resposta.data['cep'],
          logradouro: resposta.data['logradouro'],
          distrito: resposta.data['bairro'],
          localidade: resposta.data['localidade'],
          uf: resposta.data['uf']);
    } catch (e) {
      return Future.error('Falha ao buscar CEP ');
    }
  }
}
