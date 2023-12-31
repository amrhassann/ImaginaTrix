import 'package:ai_images_generator/core/manager/colors_manager.dart';
import 'package:ai_images_generator/core/manager/constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.controller,
    this.requiredField = false
  });

  final TextEditingController controller;

  final bool requiredField;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.1),
          borderRadius: BorderRadius.circular(
            kBorderRadius,
          )),
      margin: const EdgeInsets.all(5),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        maxLines: 5,

        textInputAction: TextInputAction.done,
        validator: requiredField
            ? (value) {
          if (value == null || value.isEmpty) {
            return 'Required field';
          }
          return null;
        }
            : null,
        cursorColor: ColorsManager.primary,
        decoration:  InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            hintText: 'eg \'A Monkey On The Moon\'',
            hintStyle: TextStyle(fontSize: 15,color: Colors.grey.shade300),

        ),
      ),
    );
  }
}
