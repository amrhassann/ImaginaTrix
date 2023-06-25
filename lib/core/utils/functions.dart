import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

downloadImage(String imageUrl)async{
  try {
    await GallerySaver.saveImage(imageUrl);
    log('image saved successfully');
    // successSnackBar(msg: 'Image saved successfully');
  } catch (e) {
    print(e);
    // errSnackBar('Failed to save image');
  }

}





imageNetworkLoadingBuilder(BuildContext context, Widget child,
    ImageChunkEvent? loadingProgress) {

    if (loadingProgress == null) {
      return child;
    }else{
      return const Center(child: CircularProgressIndicator());
    }
}