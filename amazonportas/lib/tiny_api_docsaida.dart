import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const String _token = '3bafd53e2da95f4bd72afb6874d0e563f90b54bf';
const String _format = 'json';

class Info {
  final String razaoSocial;

  const Info({
    required this.razaoSocial,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    final String razaoSocial =
        json['retorno']['conta']['razao_social'] as String;

    return Info(razaoSocial: razaoSocial);
  }
}

Future<Info> fetchInformation() async {
  final url = Uri.parse('https://api.tiny.com.br/api2/info.php')
      .replace(queryParameters: {
    'token': _token,
    'formato': _format,
  });

  final response = await http.post(url);
  if (response.statusCode == 200) {
    return Info.fromJson(
        convert.jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('FAILED REQUEST: STATUS CODE $response.statusCode');
  }
}
