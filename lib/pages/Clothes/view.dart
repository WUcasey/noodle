import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noodle/pages/Clothes/index.dart';
import 'package:noodle/common/value/ColorStandar.dart';
import 'package:rive/rive.dart';

class ClothesPage extends GetView<ClothesController>{
  const ClothesPage({Key? key}):super(key:key);

  //img 照片 type 代表配件可擺放的位置限定
  Widget _Showcloth(String img,String name,int type,int status){
    return Padding(
      padding: EdgeInsets.only(left:8.0.w),
      child: status==1?//判斷是否lock
       Draggable(
        //只能垂直拖拉
        affinity: Axis.vertical,
        //拖曳開始後，跟著拖曳路徑一路顯示的 widget
        feedback: SizedBox(
          height: 660*0.1.h,
          width: 320*0.2.w,
          child: Image.asset(
            img,
            fit:BoxFit.scaleDown
          ),
        ),
        //當拖曳開始後，在原本 Draggable 的位置要顯示的 widget
        childWhenDragging:SizedBox(height: 0.h,width: 0.w,),
        //傳遞資料給麵線
        data:[img,type],
        //可拖曳元件外觀
        child: Container(
          height: 660*0.15.h,
          width: 320*0.38.w,
          decoration: BoxDecoration(
            color:AppColors.SecondText,
            borderRadius: BorderRadius.all(Radius.circular(30.w)) 
          ),
          child: Stack(
            alignment: Alignment.center,
            children:[ 
              //顯示圖片和名稱
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 660*0.1.h,
                    width: 320*0.25.w,
                    child: Image.asset(
                      img,
                      fit:BoxFit.scaleDown
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6.h),
                    child: Text(
                      name,
                      style: TextStyle(
                        color: AppColors.PrimaryText,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w600,
                        fontSize: 11.0.sp
                      ),
                    ),
                  )
                ],
              ),
            ]
          ),
        ),
      )
      //else
      :Container(
        height: 660*0.15.h,
        width: 320*0.38.w,
        decoration: BoxDecoration(
          color:AppColors.SecondText,
          borderRadius: BorderRadius.all(Radius.circular(30.w)) 
        ),
        child:Stack(
            alignment: Alignment.center,
            children:[ 
              //顯示圖片和名稱
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 660*0.1.h,
                    width: 320*0.25.w,
                    child: Image.asset(
                      img,
                      fit:BoxFit.scaleDown
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6.h),
                    child: Text(
                      name,
                      style: TextStyle(
                        color: AppColors.PrimaryText,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w600,
                        fontSize: 11.0.sp
                      ),
                    ),
                  )
                ],
              ),
              //未開放
              Container(
                height: 660*0.15.h,
                width: 320*0.3.w,
                decoration: BoxDecoration(
                  color: AppColors.Restrict,
                  borderRadius: BorderRadius.all(Radius.circular(30.w))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "不可食用",
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w700,
                        fontSize: 11.0.sp
                      ),
                    ),
                    SizedBox(
                      height: 660*0.09.h,
                      child: RiveAnimation.asset(
                        controller.lock_icon,
                        controllers: [SimpleAnimation("Example")],
                      ),
                    )
                  ],
                ),
              )
            ]
        ), 
      )
    );
  }

  Widget _items_button(String type){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: SizedBox(
        width: 320*0.2.w,
        child: ElevatedButton(
          onPressed: (){
            print("${type} click");
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: AppColors.SecondText,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            )
          ),
          child: Text(
            type,
            style: TextStyle(
              color: AppColors.PrimaryText,
              letterSpacing: 2.0,
              fontWeight: FontWeight.w600,
              fontSize: 12.0.sp
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:AppColors.PrimaryColor_1,
      body: Column(
        children: [
          Stack(
            children:[
              //麵線本人 在三種配料的下層
               Center(
                child: SizedBox(
                  width: 320*0.8.w,
                  height: 660*0.6.h,
                  child: RiveAnimation.asset(controller.river_animation),
                ),
              ),
              // DragTarget(
              //   builder: (context, candidateData, rejectedData) {
              //     return Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         SizedBox(
              //           //偵測範圍
              //           height: 660*0.2.h,
              //           width: 320*0.4.w,
              //           child: Column(
              //             children: [
              //               SizedBox(
              //                 //顯示範圍
              //                 height: 660*0.1.h,
              //                 width: 320*0.2.w,
              //                 child:Obx(() => 
              //                   Image.asset(
              //                   controller.food_1.value,
              //                   fit: BoxFit.scaleDown,
              //                   ),
              //                 )
              //               ),
              //               SizedBox(
              //                 //佔據未顯示範圍 要不然會顯示大小和偵測範圍一樣
              //                 height: 660*0.1.h,
              //                 width: 320*0.2.w
              //               )
              //             ],
              //           ),
              //         )
              //       ],
              //     );
              //   },
              //   //當拖動路徑進入 DragTarget 上方時觸發 檢查型別
              //   onWillAccept: (data) {
              //     print(data);
              //     return true;
              //   },
              //   //當 onWillAccept 回傳 true 時觸發
              //   onAccept: (data) {
              //     print("accept");
              //     controller.change_food_1((data as Map)[0]);
              //   },
              // )
            ]
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Row(
              children: [
                _items_button("配料"),
                _items_button("飲品"),
                _items_button("餐具"),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            height: 660*0.2.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _Showcloth(controller.burger,controller.burger_name,1,1),
                _Showcloth(controller.chicken,controller.chicken_name,1,1),
                _Showcloth(controller.croissant,controller.croissant_name,1,1),
                _Showcloth(controller.frenchfries,controller.frenchfries_name,1,0),
                _Showcloth(controller.pretzel,controller.pretzel_name,1,0),
              ],
            ),
          )
          
          
        ],)
    );
  }
}