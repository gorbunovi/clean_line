
import 'package:clean_line/fealure/presentation/camera/view/camera_page.dart';
import 'package:clean_line/fealure/presentation/home/view/home_page.dart';
import 'package:clean_line/fealure/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Тестовое задание',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      // onUnknownRoute: (RouteSettings settings) {
      //   return MaterialPageRoute(builder: (BuildContext context) {
      //     return const MyHomePage();
      //   });
      // },
      getPages: [
        GetPage(
            name: Routes.HOME,
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 500),
            page: () => const MyHomePage()
        ),
        GetPage(
            name: Routes.CAMERA,
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 500),
            page: () => const CameraPage()
        ),
      ],
    );
  }
}


