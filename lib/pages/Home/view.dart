import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noodle/common/routes/routes.dart';
import 'package:noodle/pages/Home/controller.dart';
import 'package:noodle/common/value/ColorStandar.dart';
import 'package:rive/rive.dart';

class HomePage extends GetView<HomeController>{
  const HomePage({Key? key}):super(key:key);
  
  Widget Mybuttom(String type,String content){
    return Material(
      color: AppColors.SecondText,
      borderRadius: BorderRadius.all(Radius.circular(50.w)),
      child: InkWell(
        onTap: () {
          if(type==controller.but1_type){
            //chat
            Get.toNamed(AppRoutes.Chat);
          }
          else if(type==controller.but2_type){
            //Diary
            Get.toNamed(AppRoutes.Diary);

          }
          else if(type==controller.but3_type){
            //Clothes
            Get.toNamed(AppRoutes.Clothes);
          }
          
          
        },
        //removw 水波紋
        splashColor: Colors.transparent,
        child: Container(
          alignment: Alignment.center,
          width: 320*0.9.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                type,
                style: TextStyle(
                  color: AppColors.PrimaryText,
                  letterSpacing: 5.0,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp
                ),
              ),
              Text(
                content,
                style: TextStyle(
                  color: AppColors.PrimaryText,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w600,
                  fontSize: 10.sp
                ),)
            ],
          ),
        ),

      ),
    );
  }
  
  @override
  Widget build(BuildContext context){
    List<Widget> buttom=[Mybuttom(controller.but2_type,controller.but2_content),Mybuttom(controller.but1_type,controller.but1_content),
    Mybuttom(controller.but3_type,controller.but3_content)];
    return Scaffold(
      backgroundColor:AppColors.PrimaryColor_1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 90.w,
            height: 90.h,
            decoration: BoxDecoration(
              color: AppColors.SecondText,
              borderRadius: BorderRadius.all(Radius.circular(50.w))
            ),
          ),
          Container(
            height: 660*0.5.h,
            width: 320*0.9.w,
            decoration: BoxDecoration(
              color: AppColors.SecondText,
              borderRadius: BorderRadius.all(Radius.circular(40.w))
            ),
            child: RiveAnimation.asset(controller.river_animation),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: MyCarouselSlider(dataList: buttom),
          )

        ],
      )
    );
  }
}

class MyCarouselSlider extends StatefulWidget{
  const MyCarouselSlider({Key? key, required this.dataList}):super(key: key);

  final List<Widget> dataList;

  @override
  State<MyCarouselSlider> createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider>{

  int _current = 1;

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Carousel page
        SizedBox(
          height: 90.h,
          child: CarouselSlider(
            items: widget.dataList,
            carouselController: CarouselController(),
            options: CarouselOptions(
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              viewportFraction: .8,
              height: 90.h,
              initialPage: 1,
              aspectRatio:16/9,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index,reason){
                setState(() {
                  _current = index;
                });
              }
            ),
          ),
        ),
        //indicator
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.dataList.length, 
              (index) =>Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: AnimatedContainer(
                curve: Curves.easeIn,
                duration: const Duration(milliseconds: 500),
                width: index == _current ? 30.w:12.w,
                height: 10.h,
                decoration: BoxDecoration(
                  color: index == _current ? AppColors.Haveyorange:AppColors.SecondText,
                  borderRadius: BorderRadius.circular(12)
                ), 
                ),
              ),  
            ),
          ),
        ),
      ],
    );
  }
}