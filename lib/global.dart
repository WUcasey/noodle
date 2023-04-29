import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:noodle/common/services/services.dart';
import 'package:noodle/common/store/user.dart';

class Global{
  //各種初始化
  static Future init() async{
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      // Orientations 不讓螢幕選轉
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    //user info memory 初始化 putAsync代表是 Async controller
    await Get.putAsync<StorageService>(() => StorageService().init());
    // user info  初始化 put代表一開始就要準備好controller
    Get.put<UserStore>(UserStore());
    
  }
}