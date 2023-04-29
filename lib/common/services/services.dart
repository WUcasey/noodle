
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService{
  //SharedPreferences是Android和iOS应用程序用来在分配的空间中存储简单数据的，可以存取一些基本的少量資料存到手機端的xml文件中
  //这些数据即使在应用程序关闭和再次启动时也存在
  // 當new page時 getcntroller 才會被產生 但getservice是 下在app後 一直都會存在
  static StorageService get to => Get.find();
  late final SharedPreferences _prefs;

  Future<StorageService> init() async{
    //實體化 SharedPreferences
    _prefs = await SharedPreferences.getInstance();
    return this;
  }
  //設定寫入 SharedPreferences 資料
  // key 是儲存的名字，value 是儲存的資料
  Future<bool> setString(String key,String value) async{
    return await _prefs.setString(key, value);
  }

  Future<bool> setBool(String key,bool value) async{
    return await _prefs.setBool(key, value);
  }

  Future<bool> setList(String key,List<String> value) async{
    return await _prefs.setStringList(key, value);
  }
  //讀取 SharedPreferences 資料

  String getString(String key){
    return _prefs.getString(key) ?? '';
  }

  bool getBool(String key){
    return _prefs.getBool(key) ?? false;
  }

  List<String> getList(String key){
    return _prefs.getStringList(key) ?? [];
  }
  //刪除資料

  Future<bool> remove(String key) async{
    return await _prefs.remove(key);
  }
}