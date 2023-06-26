import 'package:ai_images_generator/features/images_generatror/data/models/generate_model/generate_model.dart';
import 'package:hive_flutter/adapters.dart';

import 'constants.dart';

class HiveHelper {
  static hiveInit() async {
    await Hive.initFlutter();
    Hive.registerAdapter(GenerateModelAdapter());
    await Hive.openBox(kGenerationsBox);
  }
}
//flutter pub run build_runner build
