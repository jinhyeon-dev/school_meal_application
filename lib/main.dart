import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_meal_application/controller/main_controller.dart';
import 'package:school_meal_application/controller/school_controller.dart';
import 'package:school_meal_application/screens/main_screen/main_screen.dart';
import 'package:school_meal_application/screens/search_screen/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: '/',
          page: () => const MainScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(MainController());
            },
          ),
        ),
        GetPage(
          name: '/search',
          page: () => const SearchScreen(),
          binding: BindingsBuilder(() {
            Get.put(SchoolController());
          }),
        ),
      ],
      initialRoute: '/',
    );
  }
}
