
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_map/route/app_route.dart';

Future<void> main() async {


    runApp(const MyApp());
  }


  class MyApp extends StatelessWidget  {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Firebase Otp',
      debugShowMaterialGrid: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouteGenerate.splash,
      getPages: AppRouteGenerate.screen,
    );
  }
}
