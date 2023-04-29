import 'package:get/get.dart';
import 'package:noodle/common/routes/routes.dart';
import 'package:noodle/pages/Loading/state.dart';
class LoadingController extends GetxController{
  LoadingController();
  
  final title = "大腸麵線";
  String slogan="萬物皆有裂痕 那是光照進來的地方";
  String river_animation="assets/animation_riv/cup_walk.riv";
  
  final state = LoadingState();

  @override
  void onReady(){
    super.onReady();
    Future.delayed(
      const Duration(seconds: 3),()=>Get.offAllNamed(AppRoutes.Message));
  }
}