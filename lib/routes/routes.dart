import 'package:allevents/modules/event_detail/event_detail.dart';
import 'package:allevents/modules/event_detail/event_detail_controller.dart';
import 'package:allevents/modules/init_screen.dart';
import 'package:allevents/modules/login/login_screen.dart';
import 'package:allevents/modules/login/login_screen_controller.dart';
import 'package:allevents/modules/main_screen/main_screen.dart';
import 'package:allevents/modules/main_screen/main_screen_controller.dart';
import 'package:allevents/routes/pages.dart';
import 'package:get/get.dart';

abstract class Routes {
  static List<GetPage> pages = [
    GetPage(
      name: Pages.initialRoute,
      page: () => InitScreen() ,
    ),
    GetPage(
      name: Pages.mainScreen,
      page: () => MainScreen(),
      binding: BindingsBuilder(() => Get.lazyPut(() => MainScreenController())),
    ),
    GetPage(
      name: Pages.login,
      page: () => LoginScreen(),
      binding:
          BindingsBuilder(() => Get.lazyPut(() => LoginScreenController())),
    ),
    GetPage(
      name: Pages.eventDetail,
      page: () => EventDetail(),
      binding:
          BindingsBuilder(() => Get.lazyPut(() => EventDetailController())),
    ),
  ];
}
