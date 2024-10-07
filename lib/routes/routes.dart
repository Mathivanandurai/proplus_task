import 'package:get/get.dart';
import 'package:proplus_task/features/home/home.dart';
import 'package:proplus_task/features/login/login_screen.dart';
import 'package:proplus_task/features/project_view/project_view.dart';
import 'package:proplus_task/features/splash/splash_screen.dart';

class GetPages{
 static final List<GetPage<dynamic>> getPages=[
    GetPage(name: RouteName.login, page: () => const LoginScreen()),
   GetPage(name: RouteName.home, page: () => const HomeScreen()),
   GetPage(name: RouteName.projectView, page: () => const ProjectViewScreen()),
   GetPage(name: RouteName.splash, page: () => const SplashScreen()),
  ];
}

class RouteName{
  static const String login="/login";
  static const String home="/home";
  static const String projectView="/project_view";
  static const String splash="/";
}