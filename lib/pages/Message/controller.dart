import 'package:get/get.dart';
import 'package:noodle/pages/Message/state.dart';
class MessageController extends GetxController{
  MessageController();
  final state = MessageState();
  @override
  void onReady(){
    super.onReady();
    print("Messagecontroller");
  }
}