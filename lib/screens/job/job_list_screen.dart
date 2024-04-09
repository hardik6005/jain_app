import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:jain_app/componenets/custom_appbar.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/componenets/custom_textfield.dart';
import 'package:jain_app/componenets/loader_widget.dart';
import 'package:jain_app/screens/job/model/search_job_list_model.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';


class JobListScreen extends StatefulWidget {
  SearchJobListModel? searchJobListModel;

  JobListScreen({Key? key, this.searchJobListModel}) : super(key: key);

  @override
  State<JobListScreen> createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: appBar(
            context,
            "Jobs",
            Imagename.icBack,
            "",
            whiteIntColor,
            leadingAction: () {
              pop(context);
            },
            action: [homeWidget(context)],
          ),
          body: commonShapeContainer(bodyView()),
          backgroundColor: clrApp,
          resizeToAvoidBottomInset: false,
        ),
      ),
    );
  }

  Widget bodyView() {
    return Container(
      height: 100.h,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        child: (widget.searchJobListModel != null &&
                widget.searchJobListModel!.data != null &&
                widget.searchJobListModel!.data!.jobSeeker != null &&
                widget.searchJobListModel!.data!.jobSeeker!.isNotEmpty)
            ? ListView.builder(
                itemCount: widget.searchJobListModel!.data!.jobSeeker!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return buildImageCard(index, widget.searchJobListModel!.data!.jobSeeker![index]);
                },
              )
            : noDataView(),
      ),
    );
  }

  Widget buildImageCard(int index, JobSeeker jobSeeker, ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 10)
          .copyWith(top: (index == 0) ? 2.h : 1.h),
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        color: clrOrange4,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Column(
        children: [
          sb(0.5.h),
          TitleTextView(
            jobSeeker.name,
            color: clrApp,
            fontFamily: FontName.nunitoSansBold,
            fontSize: f20,
          ),
          sb(1.h),
          GestureDetector(
            onTap: ()async{
              if(jobSeeker.mobileNumber!.isNotEmpty) {
                await launch('tel:${jobSeeker.mobileNumber}');
              }
            },
            child: TitleTextView(
              jobSeeker.mobileNumber,
              color: blueColor,
              fontFamily: FontName.nunitoSansSemiBold,
            ),
          ),
          sb(0.5.h),
          TitleTextView(jobSeeker.residentialAddress, fontSize: f16, textAlign: TextAlign.center,),
          sb(1.3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleTextView(
                "Qualification : ",
                color: blackColor,
                fontFamily: FontName.nunitoSansBold,
              ),
              TitleTextView(jobSeeker.educationalQualification)
            ],
          ),
          sb(0.3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleTextView(
                "Job Type : ",
                color: blackColor,
                fontFamily: FontName.nunitoSansBold,
              ),
              TitleTextView(jobSeeker.jobType)
            ],
          ),
          sb(0.3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleTextView(
                "Location : ",
                color: blackColor,
                fontFamily: FontName.nunitoSansBold,
              ),
              TitleTextView(jobSeeker.city!.name)
            ],
          ),
          sb(1.h),
          Container(
            color: clrApp,
            height: 6,
          )
        ],
      ),
    );
  }
}
