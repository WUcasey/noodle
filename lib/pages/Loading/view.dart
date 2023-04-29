import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noodle/pages/Loading/index.dart';
import 'package:noodle/common/value/ColorStandar.dart';
import 'package:rive/rive.dart';

class LoadingPage extends GetView<LoadingController>{
  const LoadingPage({Key? key}):super(key:key);
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:AppColors.PrimaryColor_1,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 180.h,
              width: 180.w,
              child: RiveAnimation.asset(controller.river_animation,
                alignment: Alignment.center,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              controller.title,
              style: TextStyle(
                fontSize: 18.sp,
                color:AppColors.PrimaryText,
                letterSpacing: 8.0,
                fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding:const EdgeInsets.fromLTRB(30, 10, 30, 0) ,
              child: Text(
                controller.slogan,
                style: TextStyle(
                  fontSize: 11.0.sp,
                  color: AppColors.SecondText,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}