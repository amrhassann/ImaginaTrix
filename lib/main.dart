import 'package:ai_images_generator/core/manager/colors_manager.dart';
import 'package:ai_images_generator/core/manager/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/images_generatror/view/screens/generator_input_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: ColorsManager.primary),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        elevatedButtonTheme:  ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              ColorsManager.primary.withOpacity(.8),
            ),
            padding: MaterialStateProperty.all(EdgeInsets.all(15)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  kBorderRadius,
                ),
              ),
            ),
          )
        )
      ),
    );
  }
}
