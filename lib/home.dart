import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:previsao_tempo/controller.dart';

class HomePage extends GetView<Controller> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tempo agora'),
        actions: [
          IconButton(
              onPressed: controller.limpar, icon: const Icon(Icons.refresh))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            const Icon(Icons.cloud, size: 120),
            controller.buildTextField('Cidade', controller.controlleCidade),
            controller.buildTextField('Estado (sigla)', controller.controlleEstado),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Obx(() {
                if (controller.statusError.value = false) {
                  return Text(controller.info.value,
                      style: const TextStyle(fontSize: 20));
                } else {
                  return Text(controller.info.value,
                      style: const TextStyle(fontSize: 20));
                }
              }),
            ),
            SizedBox(
              height: 40,
              width: 100,
              child: ElevatedButton(
                onPressed: controller.tempoAgora,
                child: const Text(
                  'Ver',
                  style: TextStyle(fontSize: 20),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
