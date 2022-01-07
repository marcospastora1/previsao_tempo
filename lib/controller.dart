import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Controller extends GetxController {
  final info = 'Informe a cidade e estado'.obs;

  var statusError = false.obs;

  final controlleCidade = TextEditingController();
  final controlleEstado = TextEditingController();

  Widget buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      style: const TextStyle(fontSize: 25),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontSize: 20),
      ),
    );
  }

  void limpar() {
    controlleCidade.text = '';
    controlleEstado.text = '';
    info.value = 'informe a cidade e estado';
  }

  tempoAgora() async {
    try {
      final cidade = controlleCidade.text;
      final estado = controlleEstado.text;

      final url =
          'https://api.hgbrasil.com/weather?key=694f75e1&city_name=$cidade,$estado/';

      http.Response resposta = await http.get(Uri.parse(url));
      //pegando os dados da url que retornam um dado futuro

      final retorno = json.decode(resposta.body) as Map<String, dynamic>;
      //convertendo o corpo da resposta em json

      final city = retorno['results']['city'];
      final temperatura = retorno['results']['temp'];
      final descricao = retorno['results']['description'];
      final data = retorno['results']['date'];
      final hora = retorno['results']['time'];

      if (city == null &&
          temperatura == null &&
          descricao == null &&
          data == null &&
          hora == null) {
        throw Exception();
      } else {
        info.value =
            'Hoje ($data) em $city está com o tempo $descricao, com temperatura $temperaturaº.\n Ultima medição: $hora ';
      }
    } catch (err) {
      statusError.value = true;
      info.value = 'Erro ao buscar dados';
    }
  }
}
