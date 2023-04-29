import 'package:noodle/pages/Loading/controller.dart';
import 'package:get/get.dart';
class LoadingBinding implements Bindings{

  @override
  void dependencies() {
    // lazyPut 有用到再產生 controller
    Get.lazyPut<LoadingController>(()=>LoadingController());
  }
}