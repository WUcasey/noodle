import 'package:noodle/pages/Home/controller.dart';
import 'package:get/get.dart';
class HomeBinding implements Bindings{

  @override
  void dependencies() {
    // lazyPut 有用到再產生 controller
    Get.lazyPut<HomeController>(()=>HomeController());
  }
}