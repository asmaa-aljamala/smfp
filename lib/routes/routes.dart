import 'package:get/get.dart';
import 'package:smfp/logic/binding/auth_biniding.dart';
import 'package:smfp/logic/controller/auth_controller.dart';
import 'package:smfp/logic/middlewares/auth_middleware.dart';
import 'package:smfp/view/screens/auth/change_phone_screen.dart';
import 'package:smfp/view/screens/auth/forgot_password_screen.dart';
import 'package:smfp/view/screens/auth/register_screen.dart';
import 'package:smfp/view/screens/auth/reset_password_screen.dart';
import 'package:smfp/view/screens/main/notification.dart';
import 'package:smfp/view/screens/main/main_screen.dart';
import 'package:smfp/view/screens/main/children_screen.dart';
import 'package:smfp/view/screens/more/complaint_screen.dart';
import 'package:smfp/view/screens/more/reports_screen.dart';
import 'package:smfp/view/screens/more/transfer_screen.dart';
import 'package:smfp/view/screens/more/who_screen.dart';

import '../view/screens/auth/login_screen.dart';
import '../view/screens/main/chat_screen.dart';
import '../view/screens/main/pepole_chat.dart';

class AppRoutes {
  //initialRoutes
  static const login = Routes.loginScreen;
  static const notify = Routes.notify;
  static const main = Routes.mainScreen;
  static const children = Routes.childrenScreen;
  static const pepole = Routes.pepoleScreen;
  static const chat = Routes.chatScreen;



  //getPages
  static final routes = [
    GetPage(
      middlewares: [AuthMiddleWare()],
      binding: AuthBinding(),
      name: Routes.loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routes.childrenScreen,
      page: () => ChildrenScreen(),
    ),
    GetPage(
      name: Routes.notify,
      page: () => PushNotify(),
    ),
    GetPage(
      name: Routes.registerScreen,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
    ),
    GetPage(
      name: Routes.resetPasswordScreen,
      page: () => ResetPasswordScreen(
        phone: '',
      ),
    ),
    GetPage(
      name: Routes.changephoneScreen,
      page: () => ChangePhoneScreen(),
    ),
    GetPage(
      name: Routes.childrenScreen,
      page: () => ChildrenScreen(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
    ),
    GetPage(
      name: Routes.complaintScreen,
      page: () => ComplaintScreen(),
    ),
    GetPage(
      name: Routes.reportScreen,
      page: () => ReportScreen(),
    ),
    GetPage(
      name: Routes.transferStudentScreen,
      page: () => TransferStudentScreen(),
    ),
    GetPage(
      name: Routes.whoScreen,
      page: () => WhoScreen(),
    ),
    GetPage(
      name: Routes.pepoleScreen,
      page: () => PepoleChat(),
    ),
    GetPage(
      name: Routes.chatScreen,
      page: () => ChatScreen(),
    ),
  ];

}

class Routes {
  static const loginScreen = '/loginScreen';
  static const chatScreen = '/chatScreen';
  static const notify = '/notify';
  static const registerScreen = '/registerScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const resetPasswordScreen = '/resetPasswordScreen';
  static const changephoneScreen = '/changePhoneScreen';
  static const childrenScreen = '/childrenScreen';
  static const mainScreen = '/mainScreen';
  static const complaintScreen = '/complaintScreen';
  static const reportScreen = '/reportScreen';
  static const transferStudentScreen = '/transferStudentScreen';
  static const whoScreen = '/whoScreen';
  static const pepoleScreen = '/pepoleScreen';

}
