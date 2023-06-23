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
    'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs3/306830510/original/a6330ab0e17b52eb88c6ae46e34bbea3c62496fd/make-an-art-for-you-using-midjourney.png',
    'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs2/297877722/original/4a20d40005609fc966525447c683827e6c1c8ce1/create-a-realistic-3d-image-using-midjourney-ai.png',
    'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs2/297877722/original/4a20d40005609fc966525447c683827e6c1c8ce1/create-a-realistic-3d-image-using-midjourney-ai.png',
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