import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return MaterialApp(
          title: 'Weather Map',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            bottomNavigationBar: SizedBox(
              height: 100,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Obx(() {
                          if (controller.weatherList.isEmpty) {
                            return const Center(
                                child: Text('No data available'));
                          }
                          final weather = controller.weatherList[0];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Temperature : '),
                                  Text(
                                      '${controller.weatherList.first.temp}°C'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('description : '),
                                  Text(
                                      '${controller.weatherList.first.description}'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Temperature : '),
                                  Text(
                                      '${controller.weatherList.first.name}°C'),
                                ],
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              title: const Text('Weather Map'),
            ),
            body: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: controller.initialCameraPosition,
                  onTap: controller.onMapClicked,
                ),
                Obx(
                  () => Center(
                    child: Text(
                      controller.weather.value,
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
