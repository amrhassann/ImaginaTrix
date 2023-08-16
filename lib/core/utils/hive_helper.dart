// import 'dart:developer';
//
// import 'package:ai_images_generator/features/images_generatror/data/models/generate_model/generate_model.dart';
// import 'package:hive_flutter/adapters.dart';
//
// import 'constants.dart';
//
// class HiveHelper {
//   static Box<List<GenerateModel>>? _box;
//
//   static Future<void> hiveInit() async {
//
//     await Hive.initFlutter();
//     Hive.registerAdapter(GenerateModelAdapter());
//     _box = await Hive.openBox(kGenerated_images_list_box);
//   }
//
//   static List<GenerateModel> getAllGeneratedModels() {
//     final List<GenerateModel> models = [];
//     if (_box != null && _box!.isOpen) {
//       final List<GenerateModel>? storedList = _box!.get(kGenerated_images_list_box);
//       if (storedList != null) {
//         models.addAll(storedList);
//       }
//     }
//     log('all generated images is : $models');
//     return models;
//   }
//
//   static Future<void> addGeneratedModel(GenerateModel model) async {
//     if (_box != null && _box!.isOpen) {
//       final List<GenerateModel>? storedList = _box!.get(kGenerated_images_list_box);
//       if (storedList != null) {
//         storedList.add(model);
//         await _box!.put(kGenerated_images_list_box, storedList);
//         getAllGeneratedModels();
//       }
//     }
//   }
// }
