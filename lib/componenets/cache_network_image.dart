// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jain_app/utils/app_utils.dart';

class CacheNetworkImage extends StatelessWidget {
  String image;
  String? placeHolderImage;
  double? imageHeight;
  double? radiuss;
  CacheNetworkImage(
    this.image, {
    Key? key,
    this.placeHolderImage,
    this.imageHeight,
    this.radiuss = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double doubleCircleSize1 = (MediaQuery.of(context).size.width - 50) / 7;
    return CachedNetworkImage(
      height: imageHeight ?? doubleCircleSize1,
      fit: BoxFit.cover,
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        height: imageHeight ?? doubleCircleSize1,
        width: imageHeight ?? doubleCircleSize1,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: radius(radiuss!),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      placeholder: (context, url) => placeHolder(placeHolderImage!),
      errorWidget: (context, url, error) => placeHolder(placeHolderImage!),
    );
  }
}
