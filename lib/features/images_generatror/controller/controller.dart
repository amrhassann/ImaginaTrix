import 'package:get/get.dart';

class MyController extends GetxController {
  List<String> items = [
    '1024 x 768',
    '1280 x 1024',
    '1920 x 1080',
  ];

  String selectedValue = '1280 x 1024';
  void changeMenu(String value) {
    selectedValue = value;
    update();
  }







}
