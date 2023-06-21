import 'package:ai_images_generator/core/manager/constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color:Colors.white.withOpacity(.7),
          borderRadius: BorderRadius.circular(
            kBorderRadius,
          )),
      margin: const EdgeInsets.all(5),
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
            hintText: 'eg \'A Monkey On The Moon\'',
            hintStyle: TextStyle(fontSize: 15)),
      ),
    );
  }
}
