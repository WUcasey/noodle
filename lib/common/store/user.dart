import 'dart:convert';
import 'package:get/get.dart';
import 'package:noodle/common/entities/user.dart';
import 'package:noodle/common/routes/routes.dart';
import 'package:noodle/common/services/services.dart';
import 'package:noodle/common/value/storage.dart';
class UserStore extends GetxController{
  static UserStore get to => Get.find();

  // 是否登入
  final _isLogin = false.obs;
  // token
  String token = "";
  // user profile
  final _profile = UserItem().obs;

  
  bool get isLogin => _isLogin.value;
  UserItem get profile => _profile.value;
  bool get hasToken => token.isNotEmpty;

  @override
  void onInit(){
    super.onInit();
    token = StorageService.to.getString(STORAGE_USER_TOKEN_KEY);
    var profileOffline = StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
    // to check if user have profile 
    if(profileOffline.isNotEmpty){
      // 有login 且取得profile 
      _isLogin.value = true;
      _profile(UserItem.fromJson(jsonDecode(profileOffline)));
    }
  }

  //saving token 保存到 StorageService
  Future<void> setToken(String value) async{
    await StorageService.to.setString(STORAGE_USER_TOKEN_KEY, value);
    token = value;
  }

  // get profile
  Future<String> getProfile() async{
    if(token.isEmpty) return "";
    return StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
  }

  //saving profile
  Future<void> saveProfile(UserItem profile) async{
    _isLogin.value=true;
    StorageService.to.setString(STORAGE_USER_PROFILE_KEY, jsonEncode(profile));
    _profile(profile);
    // !表示保證給他值 而不可能是空的
    setToken(profile.access_token!);
  }

  // logout
  Future<void> onLogout() async{
    await StorageService.to.remove(STORAGE_USER_PROFILE_KEY);
    await StorageService.to.remove(STORAGE_USER_TOKEN_KEY);
    _isLogin.value=false;
    token='';
    // router 重新導向 sign in 
    Get.offNamed(AppRoutes.SIGN_IN);
  }
}