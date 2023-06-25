import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LocalImagesSlider extends StatefulWidget {
  const LocalImagesSlider({
    Key? key,
    required this.images,
    required this.height,
  }) : super(key: key);

  final List<String> images;

  final double height;

  @override
  State<LocalImagesSlider> createState() => _LocalImagesSliderState();
}

class _LocalImagesSliderState extends State<LocalImagesSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(
          height: widget.height,
          child: CarouselSlider(
            items: widget.images
                .map((imageUrl) => InkWell(
                    onTap: () {},
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                      color: Colors.black.withOpacity(.5),
                      colorBlendMode: BlendMode.darken,
                    )))
                .toList(),
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1,
              autoPlay: true,
                autoPlayAnimationDuration : const Duration(seconds: 5),
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayCurve: Curves.ease,
              clipBehavior: Clip.antiAliasWithSaveLayer
            ),
          ),
        ),
      ],
    );
  }
}
