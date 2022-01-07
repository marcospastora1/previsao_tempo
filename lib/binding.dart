import 'package:get/get.dart';
import 'package:previsao_tempo/controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controller>(() => Controller());
  }
}