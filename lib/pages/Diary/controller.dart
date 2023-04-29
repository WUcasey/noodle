import 'package:get/get.dart';
import 'package:noodle/common/routes/routes.dart';
import 'package:noodle/pages/Diary/state.dart';
class DiaryController extends GetxController{
  DiaryController();
  
  String river_animation="assets/animation_riv/cup_walk.riv";
  String lock_icon="assets/animation_riv/lock_icon.riv";
  String diary_title="日記內容";
  String diary_content="日記是以日期為排列順序的筆記。一開始的日記是人們用日記來記錄天氣、事件一直到個人心理感受以及思想深處。日記可以是記錄將要做的事情的，也能記錄已經發生的事情和心情。 已知最早的類似日記的書是《梅勒日記》，這是一本古埃及航海日誌，其作者描述了石灰石從圖拉到吉薩的運輸，很可能覆蓋在大金字塔的外";
  DateTime date=DateTime.now();
  //record diary status
  int status_unlock=1;
  int status_lock=0;

  
  final state = DiaryState();

  @override
  void onReady(){
    super.onReady();
    print("okready");
    
  }
}