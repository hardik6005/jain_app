import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:jain_app/componenets/custom_appbar.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/screens/matrimonial/model/match_profile_list_model.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/string_constants.dart';
import 'package:sizer/sizer.dart';

class MatriSearchListScreen extends StatefulWidget {
  final MatchProfileListModel? matchProfileListModel;
  const MatriSearchListScreen({Key? key, this.matchProfileListModel}) : super(key: key);

  @override
  State<MatriSearchListScreen> createState() => _MatriSearchListScreenState();
}

class _MatriSearchListScreenState extends State<MatriSearchListScreen> {

  List<MatchMatri> list = [];

  @override
  void initState() {
    super.initState();
    list = widget.matchProfileListModel!.data!.data!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: appBar(
            context,
            "Matched Profiles",
            Imagename.icBack,
            "",
            whiteIntColor,
            leadingAction: () {
              pop(context);
            },
            action: [homeWidget(context)],
          ),
          body: commonShapeContainer(bodyView()),
          backgroundColor: clrOrange4,
          resizeToAvoidBottomInset: false,
        ),
      ),
    );
  }

  Widget bodyView() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      color: clrOrange4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (list.isNotEmpty)?
          Expanded(
            child: ListView.builder(
                itemCount: list.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return listItemView(index);
                }),
          ):noDataView(),
        ],
      ),
    );
  }

  Widget listItemView(int index) {
    final image = NetworkImage(StaticList.url);

    final model = list[index];

    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 10)
          .copyWith(top: (index == 0) ? 2.h : 1.h),
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        color: clrOrange4,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sb(0.5.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: clrApp,
                      child: CircleAvatar(
                        backgroundImage: image as ImageProvider,
                        radius: 50,
                        backgroundColor: clrApp,
                        child: Image.network(model.photographUrl??"", fit: BoxFit.fill,),
                      ),
                    ),
                    sb(15),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              color: clrApp),
                          padding: EdgeInsets.all(5),
                          child: Image.asset(
                            Imagename.show,
                            color: whiteColor,
                          ),
                        ),
                        sbw(10),
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              color: clrApp),
                          padding: EdgeInsets.all(5),
                          child: Image.asset(
                            Imagename.icContact,
                            color: whiteColor,
                            height: 25,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                sbw(10),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TitleTextView(
                            "${model.firstName!} ${model.middleName!} ${model.lastName!}",
                            fontFamily: FontName.nunitoSansExtraBold,
                            fontWeight: FontWeight.w600,
                            fontSize: f20,
                          ),
                        ],
                      ),
                      sb(2.h),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleTextView(
                                  "Age : ",
                                  fontFamily: FontName.nunitoSansBold,
                                ),
                                Expanded(
                                  child: TitleTextView(
                                    model.age,
                                    fontFamily: FontName.nunitoSansRegular,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleTextView(
                                  "Weight : ",
                                  fontFamily: FontName.nunitoSansBold,
                                ),
                                Expanded(
                                  child: TitleTextView(
                                    model.weight.toString(),
                                    fontFamily: FontName.nunitoSansRegular,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      sb(0.9.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleTextView(
                            "Height : ",
                            fontFamily: FontName.nunitoSansBold,
                          ),
                          Expanded(
                            child: TitleTextView(
                              model.height??"",
                              fontFamily: FontName.nunitoSansRegular,
                            ),
                          ),
                        ],
                      ),
                      sb(0.9.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleTextView(
                            "Marital Status : ",
                            fontFamily: FontName.nunitoSansBold,
                          ),
                          Expanded(
                            child: TitleTextView(
                              model.maritalStatus??"",
                              fontFamily: FontName.nunitoSansRegular,
                            ),
                          ),
                        ],
                      ),
                      sb(0.9.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleTextView(
                            "Mother Tongue : ",
                            fontFamily: FontName.nunitoSansBold,
                          ),
                          Expanded(
                            child: TitleTextView(
                              model.motherTongue??"",
                              fontFamily: FontName.nunitoSansRegular,
                            ),
                          ),
                        ],
                      ),
                      sb(0.9.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleTextView(
                            "Location : ",
                            fontFamily: FontName.nunitoSansBold,
                          ),
                          Expanded(
                            child: TitleTextView(
                              model.city!.name??"",
                              fontFamily: FontName.nunitoSansRegular,
                            ),
                          ),
                        ],
                      ),
                      sb(0.9.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleTextView(
                            "Education Type : ",
                            fontFamily: FontName.nunitoSansBold,
                          ),
                          Expanded(
                            child: TitleTextView(
                              model.educationType??"",
                              fontFamily: FontName.nunitoSansRegular,
                            ),
                          ),
                        ],
                      ),
                      sb(0.9.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleTextView(
                            "Education Field : ",
                            fontFamily: FontName.nunitoSansBold,
                          ),
                          Expanded(
                            child: TitleTextView(
                              model.educationField??"",
                              fontFamily: FontName.nunitoSansRegular,
                            ),
                          ),
                        ],
                      ),
                      sb(2.h),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            color: clrApp,
            height: 6,
          )
        ],
      ),
    );
  }
}
