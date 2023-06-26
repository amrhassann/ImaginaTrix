import 'package:ai_images_generator/core/manager/colors_manager.dart';
import 'package:ai_images_generator/core/manager/constants.dart';
import 'package:ai_images_generator/core/utils/hive_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/images_generatror/view/screens/generator_input_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await HiveHelper.hiveInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: ColorsManager.scaffoldBg,
          appBarTheme: const AppBarTheme(
            backgroundColor: ColorsManager.appBarBg,
            elevation: 0.0,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              ColorsManager.primary.withOpacity(.8),
            ),
            padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  kBorderRadius,
                ),
              ),
            ),
          ))),
    );
  }
}
