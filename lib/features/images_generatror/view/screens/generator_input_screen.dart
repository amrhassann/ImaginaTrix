import 'package:ai_images_generator/core/manager/assets_manager.dart';
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
          LocalImagesSlider(
            height: Get.height,
            images: AssetsManager.homeSliderImages,
          ),
          const _Content(),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {

  const _Content();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 35.0,horizontal: 10),
          child: Row(
            children: [
              Opacity(opacity: .4,
              child: Image.asset(AssetsManager.appIcon,width: 70,)),
              const Spacer(),
               Text('History',style: TextStyle(color: Colors.grey.shade300,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
        const Spacer(),
        GetBuilder<MyController>(
          builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.max,
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

                    Container(
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
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if(!controller.loading){
                        controller.generateImages();
                      }
                    },
                    child: Text(
                      controller.loading?"Generating...":'Generate',
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            );
          }
        ),
      ],
    );
  }
}