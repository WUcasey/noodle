import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noodle/common/routes/routes.dart';
import 'package:noodle/common/value/ColorStandar.dart';
import 'package:noodle/pages/Sign_in/state.dart';
class SignInController extends GetxController{
  SignInController();
  //some data
  
  final String back_riv="assets/animation_riv/background.riv";
  final String first_riv="assets/animation_riv/cup_walk.riv";


  //controller
  TextEditingController NicknameController = TextEditingController();
  TextEditingController WhisperController = TextEditingController();
  // datetime
  var Birthday=DateTime.now().obs;
  void ChooseDate(DateTime pickdate) async{
    if(pickdate!=Birthday.value){
      print("finish");
      Birthday.value=pickdate;
      print(Birthday.value);
    }
  }
  //check info
  void checkData(){
    if(NicknameController.text.isNotEmpty && Birthday.value.isBefore(DateTime.now()) && WhisperController.text.isNotEmpty){
      print("ok info complete");
      // Get.offAllNamed((AppRoutes.Home));
      //database connect
    }
    else{
      //info not complete
      Get.snackbar(
        "Sing Up", 
        "Please complete info!",
        borderRadius: 20,
        icon: const Icon(Icons.person, color: Colors.white),
        margin: const EdgeInsets.all(30),
        isDismissible: true,
        dismissDirection:DismissDirection.horizontal,
        colorText: AppColors.SecondText,
        backgroundColor: AppColors.Haveyorange,
        forwardAnimationCurve: Curves.easeOutBack,
        duration: const Duration(seconds: 3),
      );
    }

  }

  
  final state = SignInState();
  @override
  void onReady(){
    super.onReady();
    print("SignIncontroller");
  }
}