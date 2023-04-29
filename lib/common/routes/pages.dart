
import 'package:noodle/pages/Loading/index.dart';
import 'package:noodle/pages/Message/index.dart';
import 'package:noodle/pages/Sign_in/index.dart';
import 'package:noodle/pages/Home/index.dart';
import 'package:noodle/pages/Chat/index.dart';
import 'package:noodle/pages/Diary/index.dart';
import 'package:noodle/pages/Clothes/index.dart';

import '../middleware/router_auth.dart';
import 'routes.dart';
import 'package:get/get.dart';

class AppPages{
  static const INITIAL = AppRoutes.INITIAL;
  static List<String> history=[];

  static final List<GetPage> routes =[
    GetPage(
      name: AppRoutes.INITIAL,
      page: ()=>const LoadingPage(),
      binding: LoadingBinding(),
      transition: Transition.fade
    ),
    GetPage(
      name:AppRoutes.Message,
      page: () => const MessagePage(),
      binding: MessageBinding(),
      middlewares: [
        // middleware 會比name page binding 先執行
        // router condition
        RouteAuthMiddleware(priority:1),
      ]
    ),
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: ()=> const SignInPage(),
      binding: SignInBinding(),
      transition: Transition.fade
    ),
    GetPage(
      name: AppRoutes.Home, 
      page: ()=> const HomePage(),
      binding: HomeBinding(),
      transitionDuration: const Duration(seconds:1),
      transition: Transition.fade
    ),
    GetPage(
      name: AppRoutes.Clothes, 
      page: ()=> const ClothesPage(),
      binding: ClothesBinding(),
      transitionDuration: const Duration(seconds:1),
      transition: Transition.fade
    ),
    GetPage(
      name: AppRoutes.Chat, 
      page: ()=> const ChatPage(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: AppRoutes.Diary, 
      page: ()=> const DiaryPage(),
      binding: DiaryBinding(),
      transitionDuration: const Duration(seconds: 1),
      transition: Transition.leftToRightWithFade
    )
      

  ];
}