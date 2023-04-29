import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noodle/pages/Chat/index.dart';
import 'package:noodle/common/value/ColorStandar.dart';
import 'package:rive/rive.dart';

class ChatPage extends GetView<ChatController>{
  const ChatPage({Key? key}):super(key:key);
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:AppColors.PrimaryColor_1,
      body: Center(
       child: Text("chat"),
      ),
    );
  }
}