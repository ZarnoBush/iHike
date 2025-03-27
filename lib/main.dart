import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hike/Colors/app_colors.dart';
import 'package:hike/Driver/driver_home_page.dart';
import 'package:hike/Firebase/firebase_messaging.dart';
import 'package:hike/Pages/login_page.dart';
import 'package:hike/Pages/ride_requests_page.dart';
import 'package:hike/Pages/schedule_form_page.dart';
import 'package:hike/Pages/signup_page.dart';
import 'package:hike/Utils/my_http_overrides.dart';
import 'package:hike/Pages/splash_screen.dart';
import 'package:hike/Pages/welcome_page.dart';
import 'package:hike/Rider/rider_home_page.dart';
import 'package:hike/firebase_options.dart';

void main(List<String> args) async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupFirebaseMessaging();
  await GetStorage.init(); // Initialize GetStorage
  runApp(HikeApp());
}

class HikeApp extends StatelessWidget {
  const HikeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.primary,
        textTheme: TextTheme(
            bodyLarge: TextStyle(color: AppColors.text),
            bodyMedium: TextStyle(color: AppColors.text)),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
          titleTextStyle: TextStyle(color: AppColors.text),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        // GetPage(
        //   name: '/',
        //   page: () => SplashScreen(),
        // ),
        GetPage(
          name: '/',
          page: () => WelcomePage(),
        ),

        //Rider Pages
        GetPage(
          name: '/rider_signup',
          page: () => RiderSignupPage(),
        ),
        GetPage(
          name: '/rider_login',
          page: () => RiderLoginPage(),
        ),

        //Rider Pages
        GetPage(
          name: '/rider_home_page',
          page: () => RiderHomePage(),
        ),

        //Driver Pages
        GetPage(
          name: '/driver_home_page',
          page: () => DriverHomePage(),
        ),
        GetPage(
          name: '/schedule_form_page',
          page: () => ScheduleFormPage(),
        ),
        GetPage(
          name: '/request_page',
          page: () => RideRequestsPage(),
        ),
      ],
    );
  }
}
