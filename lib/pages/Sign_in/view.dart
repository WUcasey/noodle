import 'dart:async';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noodle/common/routes/routes.dart';
import 'package:noodle/pages/Sign_in/index.dart';
import 'package:noodle/common/value/ColorStandar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rive/rive.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({Key? key}) : super(key: key);

  //nickname
  Widget FirstPage() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 320 * 0.8.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(17.w)),
              color: AppColors.RegBacckground,
              border: Border.all(width: 8.w, color: AppColors.SecondText)),
          child: Column(
            children: [
              SizedBox(
                height: 180.h,
                width: 180.w,
                child: RiveAnimation.asset(
                  controller.first_riv,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Container(
                  height: 660 * 0.07.h,
                  decoration: BoxDecoration(
                    color: AppColors.SecondText,
                    border: Border.all(color: Colors.white10),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextField(
                      //controller 取得nickname
                      controller: controller.NicknameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "告訴麵線你的暱稱吧",
                          hintStyle: TextStyle(
                              color: AppColors.PrimaryText,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w600,
                              fontSize: 11.0.sp)),
                      style: TextStyle(
                          color: AppColors.PrimaryText,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w600,
                          fontSize: 11.0.sp),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        //small circle
        Container(
          width: 30.w,
          height: 30.h,
          decoration: BoxDecoration(
              color: AppColors.SecondText,
              borderRadius: BorderRadius.all(Radius.circular(15.w))),
        )
      ],
    );
  }

  //date
  Widget SecondPage(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 320 * 0.8.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(17.w)),
              color: AppColors.RegBacckground,
              border: Border.all(width: 8.w, color: AppColors.SecondText)),
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  // await DatePicker.showDatePicker(context, onChanged: (value) {
                  //   if (value.toString().isNotEmpty) {
                  //     controller.ChooseDate(value);
                  //   }
                  // },
                  //     showTitleActions: true,
                  //     maxTime: DateTime(2024, 12, 31),
                  //     minTime: DateTime(1980, 1, 1),
                  //     theme: DatePickerTheme(
                  //       doneStyle: TextStyle(
                  //           color: AppColors.PrimaryText,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 15.sp),
                  //       cancelStyle: TextStyle(
                  //           color: AppColors.PrimaryText,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 15.sp),
                  //       itemStyle: TextStyle(
                  //           color: AppColors.PrimaryText,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 15.sp),
                  //       headerColor: AppColors.SecondText,
                  //       backgroundColor: AppColors.SecondText,
                  //     ));
                },
                child: SizedBox(
                  height: 180.h,
                  width: 180.w,
                  child: RiveAnimation.asset(
                    controller.first_riv,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Text(
                  "點點麵線\n告訴麵線你的生日吧!",
                  style: TextStyle(
                    color: AppColors.PrimaryText,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w600,
                    fontSize: 11.0.sp,
                  ),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
              Obx(() => Text(
                    controller.Birthday.value.toString().substring(0, 10),
                    style: TextStyle(
                      color: AppColors.PrimaryText,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w600,
                      fontSize: 11.0.sp,
                    ),
                    textAlign: TextAlign.center,
                  ))
            ],
          ),
        ),
        //small circle
        Container(
            width: 30.w,
            height: 30.h,
            decoration: BoxDecoration(
                color: AppColors.SecondText,
                borderRadius: BorderRadius.all(Radius.circular(15.w))))
      ],
    );
  }

  //whisper
  Widget ThirdPage() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 320 * 0.8.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(17.w)),
              color: AppColors.RegBacckground,
              border: Border.all(width: 8.w, color: AppColors.SecondText)),
          child: Column(
            children: [
              SizedBox(
                height: 180.h,
                width: 180.w,
                child: RiveAnimation.asset(
                  controller.first_riv,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Container(
                  height: 660 * 0.07.h,
                  decoration: BoxDecoration(
                    color: AppColors.SecondText,
                    border: Border.all(color: Colors.white10),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextField(
                      controller: controller.WhisperController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "說個悄悄話",
                          hintStyle: TextStyle(
                              color: AppColors.PrimaryText,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w600,
                              fontSize: 11.0.sp)),
                      style: TextStyle(
                          color: AppColors.PrimaryText,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w600,
                          fontSize: 11.0.sp),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        //small circle
        Container(
          width: 30.w,
          height: 30.h,
          decoration: BoxDecoration(
              color: AppColors.SecondText,
              borderRadius: BorderRadius.all(Radius.circular(15.w))),
        )
      ],
    );
  }

  Widget GetStart() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 320 * 0.8.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(17.w)),
              color: AppColors.RegBacckground,
              border: Border.all(width: 8.w, color: AppColors.SecondText)),
          child: Column(
            children: [
              SizedBox(
                height: 180.h,
                width: 180.w,
                child: RiveAnimation.asset(
                  controller.first_riv,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Container(
                  height: 660 * 0.08.h,
                  decoration: BoxDecoration(
                    color: AppColors.Haveyorange,
                    border: Border.all(color: Colors.white10),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // print(controller.NicknameController.text);
                      // print(controller.WhisperController.text);
                      // print(controller.Birthday.value);
                      controller.checkData();
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.Haveyorange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: Center(
                      child: Text(
                        "製作麵線",
                        style: TextStyle(
                            color: AppColors.SecondText,
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0.sp),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        //small circle
        Container(
          width: 30.w,
          height: 30.h,
          decoration: BoxDecoration(
              color: AppColors.SecondText,
              borderRadius: BorderRadius.all(Radius.circular(15.w))),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //解決 KeepAliveWrapper 的問題
    List<Widget> page = [
      KeepAliveWrapper(child: FirstPage()),
      KeepAliveWrapper(child: SecondPage(context)),
      KeepAliveWrapper(child: ThirdPage()),
      GetStart()
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false, //避免鍵盤彈出引響布局
      backgroundColor: AppColors.PrimaryColor_1,
      body: Stack(
        alignment: Alignment.center,
        children: [
          //background riv
          SizedBox(
            width: 320.w,
            height: 660.h,
            child: RiveAnimation.asset(
              controller.back_riv,
              fit: BoxFit.contain,
            ),
          ),
          MyCarouselSlider(dataList: page)
        ],
      ),
    );
  }
}

class MyCarouselSlider extends StatefulWidget {
  const MyCarouselSlider({Key? key, required this.dataList}) : super(key: key);

  final List<Widget> dataList;

  @override
  State<MyCarouselSlider> createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Carousel page
        SizedBox(
          height: 350.h,
          child: CarouselSlider(
            items: widget.dataList,
            carouselController: CarouselController(),
            options: CarouselOptions(
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: .8,
                height: 660 * 0.5.h,
                aspectRatio: 16 / 9,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        //indicator
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.dataList.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: AnimatedContainer(
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 500),
                  width: index == _current ? 30.w : 12.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                      color: index == _current
                          ? AppColors.SecondText
                          : AppColors.Thirdcolor,
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//緩存
class KeepAliveWrapper extends StatefulWidget {
  const KeepAliveWrapper({
    Key? key,
    this.keepAlive = true,
    required this.child,
  }) : super(key: key);
  final bool keepAlive;
  final Widget child;

  @override
  _KeepAliveWrapperState createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  void didUpdateWidget(covariant KeepAliveWrapper oldWidget) {
    if (oldWidget.keepAlive != widget.keepAlive) {
      // keepAlive 状态需要更新，实现在 AutomaticKeepAliveClientMixin 中
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
//bottom feedback

