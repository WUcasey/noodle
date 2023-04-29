import 'package:get/get.dart';
import 'package:noodle/common/routes/routes.dart';
import 'package:noodle/pages/Clothes/state.dart';
class ClothesController extends GetxController{
  ClothesController();
  
  String river_animation="assets/animation_riv/cup_walk.riv";
  String lock_icon="assets/animation_riv/lock_icon.riv";

  String burger="assets/food/cheeseburger.png";
  String burger_name="漢堡";

  String chicken="assets/food/chicken.png";
  String chicken_name="雞腿";

  String croissant="assets/food/croissant.png";
  String croissant_name="麵包";

  String frenchfries="assets/food/frenchfries.png";
  String frenchfries_name="薯條";

  String pretzel="assets/food/pretzel.png";
  String pretzel_name="餅乾";

  //food 顯示位置 1
  var food_1="".obs;
  void change_food_1(String data){
    food_1.value=data;
  }
  
  final state = ClothesState();

  @override
  void onReady(){
    super.onReady();
    
  }
}