import 'package:get/get.dart';

import 'package:noodle/pages/Home/state.dart';
class HomeController extends GetxController{
  HomeController();
  
  final state = HomeState();
  final String river_animation="assets/animation_riv/cup_walk.riv";

  final String but1_type="來碗麵線";
  final String but1_content="麵線想你了 跟麵線聊聊天吧";
  
  final String but2_type="獨家秘方";
  final String but2_content="想知道有關麵線的小祕密嗎";
  
  final String but3_type="加點配料";
  final String but3_content="想換換麵線的口味嗎";


  @override
  void onReady(){
    super.onReady();
    
  }
}