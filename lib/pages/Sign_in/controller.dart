import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noodle/common/routes/routes.dart';
import 'package:noodle/common/value/ColorStandar.dart';
import 'package:noodle/pages/Sign_in/state.dart';
import 'package:neo4driver/neo4driver.dart';

class SignInController extends GetxController {
  SignInController();
  //some data

  final String back_riv = "assets/animation_riv/background.riv";
  final String first_riv = "assets/animation_riv/cup_walk.riv";

  //controller
  TextEditingController NicknameController = TextEditingController();
  TextEditingController WhisperController = TextEditingController();
  // datetime
  var Birthday = DateTime.now().obs;
  void ChooseDate(DateTime pickdate) async {
    if (pickdate != Birthday.value) {
      print("finish");
      Birthday.value = pickdate;
      print(Birthday.value);
    }
  }

  //check info
  void checkData() {
    if (NicknameController.text.isNotEmpty &&
        Birthday.value.isBefore(DateTime.now()) &&
        WhisperController.text.isNotEmpty) {
      print("ok info complete");
      Get.offAllNamed((AppRoutes.Home));
      //database connect
      try {
        NeoClient.withAuthorization(
          username: 'neo4j',
          password: 'EANSpNiLGgnXTPj8OTQE9HSXJ0b4a2sIVU2b6D44KJs',
          databaseAddress: 'neo4j+s://73b8649a.databases.neo4j.io',
          databaseName: 'Instance01',
        );
        print("connect to graph database successful.");
      } catch (error) {
        print("connect to graph database fail.");
      }
    } else {
      //info not complete
      Get.snackbar(
        "Sing Up",
        "Please complete info!",
        borderRadius: 20,
        icon: const Icon(Icons.person, color: Colors.white),
        margin: const EdgeInsets.all(30),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        colorText: AppColors.SecondText,
        backgroundColor: AppColors.Haveyorange,
        forwardAnimationCurve: Curves.easeOutBack,
        duration: const Duration(seconds: 3),
      );
    }
  }

  final state = SignInState();
  @override
  void onReady() {
    super.onReady();
    print("SignIncontroller");
  }
}
