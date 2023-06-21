import 'package:get/get.dart';

class MyController extends GetxController {
  List<String> items = [
    'Option 1',
    'Option 2',
    'Option 3',
  ];

  String selectedValue = 'Option 1';
  void changeMenu(String value) {
    selectedValue = value;

    update(); // in order to update you MUST FIRST build the one responsible to update
  }
}
