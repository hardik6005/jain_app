import 'package:flutter/material.dart';
import 'package:jain_app/componenets/custom_image.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/string_constants.dart';

import 'custom_lable.dart';

class BrowseDialogue extends StatefulWidget {
  final bool? boolVideo;
  final Function(String)? value;
  const BrowseDialogue({this.value, this.boolVideo = false, super.key});

  @override
  State<StatefulWidget> createState() => BrowseDialogueState();
}

class BrowseDialogueState extends State<BrowseDialogue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30).copyWith(bottom: 30),
      color: whiteColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              itemView(
                Imagename.icCamera,
                AppConstants.camera,
                onTap: () {
                  widget.value!(TAG.camera);
                },
              ),
              itemView(
                Imagename.icGallery,
                AppConstants.gallery,
                onTap: () {
                  widget.value!(TAG.gallery);
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  //common browse item view
  Widget itemView(String image, String text, {required Function() onTap}) {
    return Expanded(
      child: InkWell(
        onTap: () => onTap(),
        child: Column(
          children: [
            image != ""
                ? MyImage(
                    image: image,
                    height: 50,
                    ontap: () => onTap(),
                  )
                : Container(),
            sb(5),
            TitleTextView(
              text,
            )
          ],
        ),
      ),
    );
  }
}
