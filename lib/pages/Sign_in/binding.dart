
import 'package:get/get.dart';
import 'package:noodle/pages/Sign_in/controller.dart';


class SignInBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<SignInController>(()=>SignInController());
  }
}