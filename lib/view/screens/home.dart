import 'package:ai_images_generator/controller/controller.dart';
import 'package:ai_images_generator/view/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyController()); // YOU MUST USE THIS WITH GETBUILDER
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff000000),
        body: Container(
          padding: const EdgeInsets.only(
            top: 60,
            right: 15,
            left: 15,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'AI Image Generator',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xff8338ec),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                      ),
                    ),
                    child: const Text('My Arts'),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: InputField(),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GetBuilder<MyController>(
                    builder: (controller) {
                      return Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          // borderRadius: BorderRadius.circular()
                        ),
                        child: DropdownButton<String>(
                          dropdownColor: Colors.grey,
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          value: controller.selectedValue,
                          items: controller.items
                              .map(
                                (String value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                ),
                              )
                              .toList(),
                          onChanged: (newValue) =>
                              controller.changeMenu(newValue!),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(
                  20,
                ),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xff8338ec),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Generate',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  // decoration: BoxDecoration(
                  //     borderRadius:
                  //         BorderRadius.only(topLeft: Radius.circular(20))),
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
