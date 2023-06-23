import 'package:get/get.dart';

class ResultImageController extends GetxController {
  List<String> images = [];
  late String selectedImage;

  changeSelectedImage(int i){
    selectedImage = images[i];
    update();
  }

}
