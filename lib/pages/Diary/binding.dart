import 'package:noodle/pages/Diary/controller.dart';
import 'package:get/get.dart';
class DiaryBinding implements Bindings{

  @override
  void dependencies() {
    // lazyPut 有用到再產生 controller
    Get.lazyPut<DiaryController>(()=>DiaryController());
  }
}