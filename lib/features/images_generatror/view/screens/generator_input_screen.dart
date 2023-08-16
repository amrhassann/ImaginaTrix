import 'package:ai_images_generator/core/manager/assets_manager.dart';
import 'package:ai_images_generator/core/manager/colors_manager.dart';
import 'package:ai_images_generator/core/manager/constants.dart';
import 'package:ai_images_generator/features/images_generatror/controller/home_controller.dart';
import 'package:ai_images_generator/features/images_generatror/view/widgets/input_field.dart';
import 'package:ai_images_generator/shared_widgets/faded_images_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Get.put(MyController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: Get.height,
          child: ImageSlider(
            images: AssetsManager.homeSliderImages,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: Get.height,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: false,
              title: Opacity(
                  opacity: .4,
                  child: Image.asset(
                    AssetsManager.appIcon,
                    width: 70,
                  )),

              actions: [
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                //   child: Text(
                //     'History',
                //     style: TextStyle(
                //         color: Colors.grey.shade300, fontWeight: FontWeight.bold),
                //   ),
                // )
              ],
            ),
            body: _Content(),
          ),
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
   _Content();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyController>(builder: (controller) {

      return Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
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
                InputField(controller: controller.promptController,requiredField: true,),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.0),
                      borderRadius: BorderRadius.circular(kBorderRadius)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.black54,
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
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.grey),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (newValue) => controller.changeMenu(newValue!),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!controller.loading) {
                        if(_formKey.currentState!.validate()){
                          controller.generateImages();

                        }
                      }
                    },
                    child: Text(
                      controller.loading ? "Generating..." : 'Generate',
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      );
    });
  }
}
