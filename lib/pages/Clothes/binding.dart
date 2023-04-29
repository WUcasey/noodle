import 'package:noodle/pages/Clothes/controller.dart';
import 'package:get/get.dart';
class ClothesBinding implements Bindings{

  @override
  void dependencies() {
    // lazyPut 有用到再產生 controller
    Get.lazyPut<ClothesController>(()=>ClothesController());
  }
}