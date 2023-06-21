import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NetworkImagesSlider extends StatefulWidget {
  const NetworkImagesSlider({
    Key? key,
    required this.images,
    required this.height,
  }) : super(key: key);

  final List<String> images;

  final double height;

  @override
  State<NetworkImagesSlider> createState() => _NetworkImagesSliderState();
}

class _NetworkImagesSliderState extends State<NetworkImagesSlider> {
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
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      color: Colors.black.withOpacity(.5),
                      colorBlendMode: BlendMode.darken,
                    )))
                .toList(),
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1.0,
              autoPlay: true,
                autoPlayAnimationDuration : const Duration(seconds: 2),
              autoPlayCurve: Curves.ease
            ),
          ),
        ),
      ],
    );
  }
}
