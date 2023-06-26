import 'package:hive/hive.dart';
part 'generate_model.g.dart';

@HiveType(typeId: 0)
class GenerateModel {
  @HiveField(0)
  final String prompt;

  @HiveField(1)
  final String size;

  @HiveField(2)
  final List<String> images;

  GenerateModel({
    required this.prompt,
    required this.size,
    required this.images,
  });
}
