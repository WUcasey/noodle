import 'package:get/get.dart';
import 'package:noodle/common/routes/routes.dart';
import 'package:noodle/pages/Chat/state.dart';
class ChatController extends GetxController{
  ChatController();
  
  String river_animation="assets/animation_riv/cup_walk.riv";
  
  final state = ChatState();

  @override
  void onReady(){
    super.onReady();
    
  }
}