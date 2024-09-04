import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DogImageController extends GetxController {
  var imageUrl = ''.obs;
  var isLoading = false.obs;
  final Dio _dio = Dio();

  @override
  void onInit() {
    fetchRandomDogImage();
    super.onInit();
  }

  Future<void> fetchRandomDogImage() async {
    try {
      isLoading(true);
      final response =
          await _dio.get('https://dog.ceo/api/breeds/image/random');
      print(response);
      if (response.statusCode == 200) {
        imageUrl.value = response.data['message'];
      } else {
        throw Exception('Failed to load image');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}

class LearnController extends GetxController {
  var count = 0.obs;
  var name = "Learn".obs;
  var nameMax = "Learn".obs;

  void increment() {
    if (count < 10) {
      count.value++;
      nameMax.value = "Learn";
    } else {
      nameMax.value = "Đã đạt giới hạn";
    }
  }

  void decrement() {
    if (count > 0) {
      count.value--;
      name.value = "Learn";
    } else {
      name.value = "Không được nhỏ hơn 0";
    }
  }
}

class Learn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LearnController());
    Get.lazyPut(() => DogImageController());
    final LearnController controller = Get.find();
    final DogImageController controller_dog = Get.find();
    return Scaffold(
      appBar: AppBar(title: const Text('Learn GetX')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text(
                  '${controller.count}',
                  style: const TextStyle(fontSize: 30),
                )),
            ElevatedButton(
              onPressed: controller.increment,
              child: Obx(() => Text(controller.nameMax.value)),
            ),
            ElevatedButton(
              onPressed: controller.decrement,
              child: Obx(() => Text(controller.name.value)),
            ),
            ElevatedButton(
                onPressed: controller_dog.fetchRandomDogImage,
                child: const Text(
                  'Tải hình ảnh mới',
                  style: TextStyle(fontSize: 20),
                )),
            Obx(() => Image.network(
                  controller_dog.imageUrl.value,
                  fit: BoxFit.cover,
                ))
          ],
        ),
      ),
    );
  }
}
