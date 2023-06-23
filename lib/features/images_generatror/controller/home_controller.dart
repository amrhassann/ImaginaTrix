import 'package:ai_images_generator/features/images_generatror/view/screens/result_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  List<String> items = [
    '1024 x 768',
    '1280 x 1024',
    '1920 x 1080',
  ];

  List<String> images = [
    'https://mj-gallery.com/e36c80ef-bcbf-4b91-a5c2-d1d0f38f728d/grid_0_640_N.webp',
    'https://mj-gallery.com/63bd4685-9667-44e4-9596-7f7ed2df2c55/grid_0_640_N.webp',
    'https://dallery.gallery/wp-content/uploads/2022/08/Midjourney-classic-AI-art-style-1-585x1024.jpg',
   ];

  final TextEditingController promptController = TextEditingController();

  String selectedValue = '1280 x 1024';
  void changeMenu(String value) {
    selectedValue = value;
    update();
  }

  navigateToResult() {
    Get.to(
          () => ResultImage(images: images),
      transition: Transition.fadeIn,
    );
  }
}