import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:previsao_tempo/binding.dart';
import 'package:previsao_tempo/home.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Tempo agora',
      initialRoute: '/home',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/home', page: () => const HomePage(), binding: Binding())
      ],
    ),
  );
}
