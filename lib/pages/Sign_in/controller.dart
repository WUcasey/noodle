import 'package:get/get.dart';
import 'package:noodle/pages/Sign_in/state.dart';
class SignInController extends GetxController{
  SignInController();

  String back_riv="assets/animation_riv/background.riv";
  String first_riv="assets/animation_riv/cup_walk.riv";

  RxString nickname="".obs;
  DateTime? birthday;

  
  final state = SignInState();
  @override
  void onReady(){
    super.onReady();
    print("SignIncontroller");
  }
}