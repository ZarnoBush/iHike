import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hike/DriverSide/driver_home_page.dart';
import 'package:hike/DriverSide/driver_nav_page.dart';
import 'package:hike/DriverSide/driver_ticket_page.dart';
import 'package:hike/DriverSide/driver_user_profile.dart';
import 'package:hike/UserSide/user_driver_profile_page.dart';
import 'package:hike/UserSide/user_home_page.dart';
import 'package:hike/UserSide/user_login_page.dart';
import 'package:hike/UserSide/user_nav_page.dart';
import 'package:hike/UserSide/user_proile.dart';
import 'package:hike/UserSide/user_signup_page.dart';
import 'package:hike/UserSide/user_ticket_page.dart';
import 'package:hike/Utils/my_http_overrides.dart';
import 'package:hike/splash_screen.dart';
import 'package:hike/welcome_page.dart';

void main(List<String> args) async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
   await GetStorage.init(); // Initialize GetStorage
  runApp(HikeApp());
}

class HikeApp extends StatelessWidget {
  const HikeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
        ),
        GetPage(
          name: '/welcome',
          page: () => WelcomePage(),
        ),
        GetPage(
          name: '/user_nav',
          page: () => UserNavPage(),
        ),
        GetPage(
          name: '/user_signup',
          page: () => UserSignupPage(),
        ),
        GetPage(
          name: '/user_login',
          page: () => UserLoginPage(),
        ),
        GetPage(
          name: '/user_home',
          page: () => UserHomePage(),
        ),
        GetPage(
          name: '/user_ticket',
          page: () => UserTicketPage(),
        ),
        // GetPage(
        //   name: '/user_driver_profile',
        //   page: () => UserDriverProfilePage(),
        // ),
        GetPage(
          name: '/user_profile',
          page: () => UserProile(),
        ),
        GetPage(
          name: '/driver_nav',
          page: () => DriverNavPage(),
        ),
        GetPage(
          name: '/driver_home',
          page: () => DriverHomePage(),
        ),
        GetPage(
          name: '/driver_ticket',
          page: () => DriverTicketPage(),
        ),
        GetPage(
          name: '/driver_user_profile',
          page: () => DriverUserProfile(),
        ),

      
      ],
    );
  }
}
