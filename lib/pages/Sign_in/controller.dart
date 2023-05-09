import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noodle/common/routes/routes.dart';
import 'package:noodle/common/value/ColorStandar.dart';
import 'package:noodle/pages/Sign_in/state.dart';
//  GDB connect package
import 'package:noodle/common/DBMS/names.dart';
import 'package:noodle/common/DBMS/query.dart';
import 'package:neo4driver/neo4driver.dart';
// import 'package:http/http.dart' as http;
import 'dart:convert';

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
      //database connect once to add a new user
      try {
        addNewUsr(NicknameController.text, WhisperController.text);
      } catch (error) {
        print(error);
      } finally {}
      /*late NeoClient newConnect;
      try {
        newConnect = NeoClient.withAuthorization(
          username: DBnames.UsrDBUsrName,
          password: DBnames.UsrDBPwd,
          databaseAddress: DBnames.UsrDBAdress,
          databaseName: DBnames.USrDBName,
        );
        print("connect to graph database successfully.");
      } catch (error) {
        print("failed to connect to graph database.");
      } finally {}
      try {
        newConnect.createNode(labels: [
          "person"
        ], properties: {
          '名': NicknameController.text,
        });

        print("adding new node successfully");
      } catch (error) {
        print("failed to add new node.");
      } finally {}*/
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
