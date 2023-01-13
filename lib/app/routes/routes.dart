import 'package:get/get.dart';
import 'package:news_paper_app/app/views/account_screen.dart';
import 'package:news_paper_app/app/views/auth/login_screen.dart';
import 'package:news_paper_app/app/views/auth/phone_verification_screen.dart';
import 'package:news_paper_app/app/views/auth/register_screen.dart';
import 'package:news_paper_app/app/views/home/home_screen.dart';
import 'package:news_paper_app/app/views/main_screen.dart';
import 'package:news_paper_app/app/views/news/bookmark_screen.dart';
import 'package:news_paper_app/app/views/news/details_screen.dart';
import 'package:news_paper_app/app/views/splash_screen.dart';

class GetRoutes{

  static const String splash="/splash";
  static const String home= "/home";
  static const String login = "/login";
  static const String signup = "/signup";
  static const String phone="/phone";
  static const String account="/account";
  static const String details="/details";
  static const String bookmark="/bookmark";
  static const String main="/main";


  static List<GetPage> routes =[
    GetPage(name: GetRoutes.splash, page: ()=> SplashScreen()),
    GetPage(name: GetRoutes.home, page: ()=> HomeScreen()),
    GetPage(name: GetRoutes.login, page: ()=> LoginScreen()),
    GetPage(name: GetRoutes.signup, page: ()=> RegisterScreen()),
    GetPage(name: GetRoutes.phone, page: ()=> PhoneVerifyScreen()),
    GetPage(name: GetRoutes.account, page: ()=> AccountScreen()),
    GetPage(name: GetRoutes.details, page: ()=> DetailsScreen()),
    GetPage(name: GetRoutes.bookmark, page: ()=> BookMarkScreen()),
    GetPage(name: GetRoutes.main, page: ()=> MainScreen()),

  ];

}