import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noodle/common/routes/routes.dart';

import '../store/user.dart';

// to check if user have to sign in 
class RouteAuthMiddleware extends GetMiddleware{
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route){
    if(UserStore.to.isLogin || route == AppRoutes.INITIAL || route == AppRoutes.SIGN_IN){
      return null;
    } else{
      // no sign in 
      Future.delayed(
        const Duration(seconds: 2),()=>Get.snackbar("Message", "Hello bitch pls t sign in"));
      return const RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }  
}