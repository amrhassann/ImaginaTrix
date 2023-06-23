import 'package:ai_images_generator/core/utils/functions.dart';
import 'package:ai_images_generator/features/images_generatror/controller/result_image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultImage extends StatefulWidget {
  final List<String> images;

  const ResultImage({super.key, required this.images});

  @override
  State<ResultImage> createState() => _ResultImageState();
}

class _ResultImageState extends State<ResultImage> {
  final ResultImageController controller = Get.put(ResultImageController());

  @override
  void initState() {
    controller.images = widget.images;
    controller.selectedImage = widget.images[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResultImageController>(
      builder: (cc) {
        return Scaffold(
          appBar: AppBar(),
          body: SizedBox(
            height: Get.height,
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    cc.selectedImage,
                    fit: BoxFit.contain,
                    loadingBuilder: (c,s,x)=>imageNetworkLoadingBuilder(c,s,x),

                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 140,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (c, i) {
                      final bool isSelected =
                          cc.images[i] == cc.selectedImage;
                      return InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          cc.changeSelectedImage(i);
                        },
                        child: Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              cc.images[i],
                              fit: BoxFit.cover,
                              color: isSelected
                                  ? Colors.black.withOpacity(.6)
                                  : null,
                              colorBlendMode: BlendMode.darken,
                              loadingBuilder: (c,s,x)=>imageNetworkLoadingBuilder(c,s,x),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (c, i) => const SizedBox(width: 10),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
