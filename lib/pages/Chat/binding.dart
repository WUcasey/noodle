import 'package:noodle/pages/Chat/controller.dart';
import 'package:get/get.dart';
class ChatBinding implements Bindings{

  @override
  void dependencies() {
    // lazyPut 有用到再產生 controller
    Get.lazyPut<ChatController>(()=>ChatController());
  }
}