import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:school_meal_application/controller/main_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("오늘의 급식은?"),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed('/search')?.then((value) {
              if (value != null) {
                Get.find<MainController>().schoolInfo = value;
              }
            }),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: Obx(
                () {
                  return Text.rich(
                    TextSpan(
                      text: "안녕하세요.\n",
                      style: Theme.of(context).textTheme.labelLarge,
                      children: [
                        TextSpan(
                          text: Get.find<MainController>().schoolInfo.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        TextSpan(text: "입니다."),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.find<MainController>().previousMealType();
                  },
                  icon: Icon(Icons.chevron_left),
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Obx(
                        () {
                          MainController controller =
                              Get.find<MainController>();
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                controller.mealType.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              FutureBuilder<String>(
                                future: controller.getMeal(
                                    controller.mealType, controller.schoolInfo),
                                builder: (context, snapshot) {
                                  return Text(
                                    snapshot.data ?? '',
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.find<MainController>().nextpreviousMealType();
                  },
                  icon: Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
