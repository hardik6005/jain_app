import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/image_constant.dart';

class DisplayImage extends StatelessWidget {
  final String networkImage;
  final String captureImage;
  final VoidCallback onPressed;
  bool? isValidate;


  // Constructor
  DisplayImage({
    Key? key,
    required this.networkImage,
    required this.captureImage,
    required this.onPressed,
    this.isValidate = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          buildImage(clrApp),
          Positioned(
            right: 4,
            top: 10,
            child: buildEditIcon(clrApp),
          )
        ],
      ),
    );
  }

  // Builds Profile Image
  Widget buildImage(Color color) {
    final image =  captureImage.isNotEmpty && !captureImage.contains("http")?
         FileImage(File(captureImage)): networkImage.isNotEmpty
        ? NetworkImage(networkImage) :
    "";

    return CircleAvatar(
      radius: 75,
      backgroundColor: (isValidate!)
          ? clrApp
          : (networkImage == "" && captureImage == "")
              ? redColor
              : clrApp,
      child: (image.toString().isEmpty)?CircleAvatar(
        radius: 70,
        backgroundColor: clrApp,
        child: Image.asset(Imagename.appLogo),
      ):CircleAvatar(
        backgroundImage: image as ImageProvider,
        radius: 70,
        backgroundColor: clrApp,
      ),
    );
  }

  // Builds Edit Icon on Profile Picture
  Widget buildEditIcon(Color color) => buildCircle(
      all: 8,
      child: Icon(
        Icons.edit,
        color: color,
        size: 20,
      ));

  // Builds/Makes Circle for Edit Icon on Profile Picture
  Widget buildCircle({
    required Widget child,
    required double all,
  }) =>
      ClipOval(
          child: Container(
        padding: EdgeInsets.all(all),
        color: Colors.white,
        child: child,
      ));
}
