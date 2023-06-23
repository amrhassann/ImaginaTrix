import 'package:flutter/material.dart';

imageSaver(String imageUrl){

}
imageNetworkLoadingBuilder(BuildContext context, Widget child,
    ImageChunkEvent? loadingProgress) {

    if (loadingProgress == null) {
      return child;
    }else{
      return const Center(child: CircularProgressIndicator());
    }
}