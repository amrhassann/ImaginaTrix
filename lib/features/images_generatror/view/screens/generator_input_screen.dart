import 'package:ai_images_generator/core/manager/colors_manager.dart';
import 'package:ai_images_generator/core/manager/constants.dart';
import 'package:ai_images_generator/features/images_generatror/controller/home_controller.dart';
import 'package:ai_images_generator/features/images_generatror/view/widgets/input_field.dart';
import 'package:ai_images_generator/shared_widgets/network_images_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyController());
    return Scaffold(
      backgroundColor: ColorsManager.scaffoldBg,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          NetworkImagesSlider(
            height: Get.height,
            images: const [
              'https://mj-gallery.com/e36c80ef-bcbf-4b91-a5c2-d1d0f38f728d/grid_0_640_N.webp',
              'https://mj-gallery.com/63bd4685-9667-44e4-9596-7f7ed2df2c55/grid_0_640_N.webp',
              'https://dallery.gallery/wp-content/uploads/2022/08/Midjourney-classic-AI-art-style-1-585x1024.jpg'
            ],
          ),
          _Content(),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final MyController controller = Get.find();

  _Content();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: RichText(
            text: const TextSpan(
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'AI Image Generators That Make You 10x More',
                ),
                TextSpan(
                  text: ' Creative ',
                  style: TextStyle(
                    color: ColorsManager.primary,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'And ',
                ),
                TextSpan(
                  text: 'Productive',
                  style: TextStyle(
                    color: ColorsManager.primary,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 35),
        Row(
          children: [
             Expanded(
              child: InputField(controller: controller.promptController),
            ),
            const SizedBox(
              width: 5,
            ),
            GetBuilder<MyController>(
              builder: (controller) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.7),
                      borderRadius: BorderRadius.circular(kBorderRadius)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.grey,
                      borderRadius: BorderRadius.circular(
                        kBorderRadius,
                      ),
                      value: controller.selectedValue,
                      items: controller.items
                          .map(
                            (String value) => DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      )
                          .toList(),
                      onChanged: (newValue) => controller.changeMenu(newValue!),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              controller.navigateToResult();
            },
            child: const Text(
              'Generate',
              style: TextStyle(fontSize: 17),
            ),
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}