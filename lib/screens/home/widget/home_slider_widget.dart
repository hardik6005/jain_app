import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/screens/home/model/slider_model.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:sizer/sizer.dart';



class CarouselWithIndicator extends StatefulWidget {
  final List<SliderData> data;

  const CarouselWithIndicator({Key? key, required this.data}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;
  late List<Widget> imageSliders;
  @override
  void initState() {
    imageSliders = widget.data
        .map(
          (item) => Container(
            margin: const EdgeInsets.all(10),
            height: 15.h,
            // width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child:  GestureDetector(
                onTap: (){
                  // launchUrl(Uri.parse(item.link!), mode: LaunchMode.externalApplication);
                },
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Image.asset(item.link!, fit: BoxFit.fitWidth),
                ),
              ),
            ),
          ),
        )
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 16 / 8,
            autoPlay: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayInterval: Duration(seconds: 3),
            enlargeCenterPage: true,
            onPageChanged: (index, reason){
              setState(() {
                _current = index;
              });
            }
          ),
          items: widget.data.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 0.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: Image.asset(
                      image.link!,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),

        sb(13),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.data.map((url) {
            int index = widget.data.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin:
              const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index ? clrApp : clrAppLight3,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class CarouselModel {
  CarouselModel({required this.id, required this.image});

  final String id;
  final String image;

  CarouselModel.fromJson(Map<String, Object?> json)
      : this(id: json['title']! as String, image: json['image']! as String);

  Map<String, Object?> toJson() {
    return {
      'title': id,
      'image': image,
    };
  }
}
