import 'package:ai_images_generator/core/manager/colors_manager.dart';
import 'package:ai_images_generator/features/images_generatror/data/data_sources/remote_data_source.dart';
import 'package:ai_images_generator/features/images_generatror/data/models/create_image_params.dart';
import 'package:ai_images_generator/features/result_images/result_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  ///[Inputs_handling]
  List<String> items = [
    '256x256',
    '512x512',
    '1024x1024',
  ];

  final TextEditingController promptController = TextEditingController();
  String selectedValue = '1024x1024';

  void changeMenu(String value) {
    selectedValue = value;
    update();
  }

  ///[Outputs_handling]
  List<String> images = [];

  navigateToResult() {
    Get.to(
      () => ResultImage(images: images),
      transition: Transition.fadeIn,
    );
  }

  final CreateImageRemoteDataSource _source = CreateImageRemoteDataSource();
  bool loading = false;

  changeLoadingValue() {
    loading = !loading;
    update();
  }

  CreateImageParams _generateParams() {
    return CreateImageParams(
      prompt: promptController.text,
      size: selectedValue,
    );
  }

  generateImages() async {
    changeLoadingValue();
    final result = await _source.execute(
      _generateParams(),
    );
    changeLoadingValue();

    if (!result.containError) {
      update();
      if (result.data != null) {
        images = result.data!;
        navigateToResult();
      }
    } else {
      Get.snackbar(
        "",
        result.errorMessage!,
        snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 6),
        backgroundColor: ColorsManager.scaffoldBg,
        colorText: Colors.white
      );
    }
  }
}
