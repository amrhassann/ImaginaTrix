import 'package:ai_images_generator/features/images_generatror/controller/result_image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultImage extends StatefulWidget {
  final List<String> images;

  const ResultImage({super.key, required this.images});

  @override
  State<ResultImage> createState() => _ResultImageState();
}

class _ResultImageState extends State<ResultImage> {
  final ResultImageController controller = Get.put(ResultImageController());
  @override
  void initState() {
    controller.images = widget.images;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(controller.images[0]),
    );
  }
}
