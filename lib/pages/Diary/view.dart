
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noodle/pages/Diary/index.dart';
import 'package:noodle/common/value/ColorStandar.dart';
import 'package:rive/rive.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DiaryPage extends GetView<DiaryController>{
  const DiaryPage({Key? key}):super(key:key);

  Widget _Diary(BuildContext context,String title,String content,DateTime date,int status){
    return Stack(
      children:[
        Container(
          width: 320*0.7.w,
          height: 660*0.47.h,
          decoration: BoxDecoration(
            color: AppColors.SecondText,
            borderRadius: BorderRadius.all(Radius.circular(40.w))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //小圓點
              Padding(
                padding: EdgeInsets.fromLTRB(180.w,10.w,0,0),
                child: Container(
                  width: 20.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: AppColors.PrimaryColor_1,
                    borderRadius: BorderRadius.circular(20.w)
                  ),
                ),
              ),
              //diary title
              Padding(
                padding: EdgeInsets.fromLTRB(30.w,5.w,0,5.w),
                child: Text(
                  title,
                  style: TextStyle(
                    color: AppColors.PrimaryText,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w700,
                    fontSize: 15.0.sp
                  ),
                ),
              ),
              // diary date
              Padding(
                padding: EdgeInsets.only(left: 32.w),
                child: Text(
                  "${date.year}-${date.month}-${date.day}",
                  style: TextStyle(
                    color: AppColors.PrimaryText,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w600,
                    fontSize: 10.0.sp
                  ),
                ),
              ),
              //分割線
              Divider(
                height: 20.h,
                thickness: 2.h,
                indent: 25.w,
                endIndent: 25.w,
                color: AppColors.Haveyorange,
              ),
              //diary content 點選全部內容顯示
              GestureDetector(
                onTap: () {
                  if(status==1){
                    ShowContent(context,title,content,date);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Container(
                    width: 320*0.55.w,
                    height: 660*0.27.h,
                    decoration: BoxDecoration(
                      color: AppColors.DiarycontentBackground,
                      borderRadius: BorderRadius.all(Radius.circular(30.w))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        content,
                        maxLines: 8,
                        style: TextStyle(
                          color: AppColors.PrimaryText,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 10.0.sp
                        ),
                      ),
                    ),
                  ),
                ),
              )
      
            ],
          ),
        ),
        //diary unlock
        if(status==0)Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Container(
            width: 320*0.6.w,
            height: 660*0.4.h,
            decoration: BoxDecoration(
              color: AppColors.Restrict,
              borderRadius: BorderRadius.all(Radius.circular(60.w))
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 50.h),
              child: Column(
                children: [
                  Text(
                    "秘笈尚未開放",
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.0.sp
                    ),
                  ),
                  SizedBox(
                    height: 660*0.2.h,
                    child: RiveAnimation.asset(
                        controller.lock_icon,
                        controllers: [SimpleAnimation("Example")],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]
    );
  }
  
  @override
  Widget build(BuildContext context){
    List<Widget> diary=[
      _Diary(context,controller.diary_title,controller.diary_content, controller.date,controller.status_unlock),
      _Diary(context,controller.diary_title,controller.diary_content, controller.date,controller.status_unlock),
      _Diary(context,controller.diary_title,controller.diary_content, controller.date,controller.status_unlock),
      _Diary(context,controller.diary_title,controller.diary_content, controller.date,controller.status_unlock),
      _Diary(context,controller.diary_title,controller.diary_content, controller.date,controller.status_lock),
      _Diary(context,controller.diary_title,controller.diary_content, controller.date,controller.status_lock),
      _Diary(context,controller.diary_title,controller.diary_content, controller.date,controller.status_lock),
    ];
    return Scaffold(
      backgroundColor:AppColors.PrimaryColor_1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Center(
              child: SizedBox(
                width: 320*0.8.w,
                height: 660*0.4.h,
                child: RiveAnimation.asset(controller.river_animation),
              ),
            ),
          ),
          CarouselSlider(
            items: diary,
            options: CarouselOptions(
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              viewportFraction: .8,
              height: 660*0.55.h,
              scrollDirection: Axis.horizontal
            ),

          ),
        ],
      )
    );
  }
  
  
}

//點選日記內容跳出
ShowContent(BuildContext context,String title, String content, DateTime date) {
  return showDialog(
    context: context, 
    builder: (context){
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            height: 660*0.65.h,
            width: 320*0.8.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.w)),
              color: AppColors.SecondText
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //小圓點
                Padding(
                  padding: EdgeInsets.fromLTRB(200.w,20.w,0,0),
                  child: Container(
                    width: 25.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                      color: AppColors.PrimaryColor_1,
                      borderRadius: BorderRadius.circular(25.w)
                    ),
                  ),
                ),
                //title
                Padding(
                  padding: EdgeInsets.only(left:25.w),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: AppColors.PrimaryText,
                      letterSpacing: 4.0,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0.sp
                    ),
                  ),
                ),
                //date
                Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: Text(
                    "${date.year}-${date.month}-${date.day}",
                    style: TextStyle(
                      color: AppColors.PrimaryText,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w600,
                      fontSize: 11.0.sp
                    ),
                  ),
                ),
                Divider(
                  height: 20.h,
                  thickness: 2.h,
                  indent: 25.w,
                  endIndent: 25.w,
                  color: AppColors.Haveyorange,
                ),
                //content
                Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: SizedBox(
                    width: 320*0.65.w,
                    height: 660*0.4.h,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                          content+content,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                          color: AppColors.PrimaryText,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.0.sp
                        ),
                      ),
                    ),
                  ),
                )
              ]),
          ),
        ),
      );
    }
  );

}

