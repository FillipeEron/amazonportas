import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const String _token = '3bafd53e2da95f4bd72afb6874d0e563f90b54bf';
const String _format = 'json';

class TinyAPIDocSaida {
  //static const String _token = '3bafd53e2da95f4bd72afb6874d0e563f90b54bf';
  //static const String _format = 'json';
  final String? _idPedido;
  String? _codigoPedido;

  TinyAPIDocSaida(this._idPedido);

  void loadPedido() async {
    try {
      var url = Uri.parse('https://api.tiny.com.br/api2/pedidos.pesquisa.php')
          .replace(queryParameters: {
        'token': _token,
        'formato': _format,
        'numero': _idPedido,
      });

      var response = await http.post(url);
      var data = convert.jsonDecode(response.body);
      _codigoPedido = data['retorno']['pedidos'][0]['pedido']['id'] as String;
    } catch (e) {
      throw 'GET ID FAIL';
    }
  }

  static Future<String> getIdfromAPI(String idPedido) async {
    try {
      var url = Uri.parse('https://api.tiny.com.br/api2/pedidos.pesquisa.php')
          .replace(queryParameters: {
        'token': _token,
        'formato': _format,
        'numero': idPedido,
      });

      var response = await http.post(url);
      var data = convert.jsonDecode(response.body);
      return data['retorno']['pedidos'][0]['pedido']['id'] as String;
    } catch (e) {
      throw 'GET ID FAIL';
    }
  }

  get codigoPedido => _codigoPedido;
}
