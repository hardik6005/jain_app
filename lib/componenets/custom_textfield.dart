
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jain_app/utils/app_colors.dart';
import 'package:jain_app/utils/app_utils.dart';
import 'package:jain_app/componenets/custom_lable.dart';
import 'package:jain_app/utils/font_constants.dart';
import 'package:jain_app/utils/image_constant.dart';
import 'package:jain_app/utils/string_constants.dart';
import 'package:dropdown_search/dropdown_search.dart';



class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.context,
    required this.textFieldName,
    required this.numberOfLines,
    required this.controller,
    this.imageName,
    this.onSumitted,
    this.onChange,
    this.textInputAction,
    this.isImage = false,
    this.height,
    this.fontSize,
    this.fillColor,
    this.isSuffixImage = false,
    this.suffixImage,
    this.isObsecure = false,
    this.inputFormatters,
    this.onSuffixTap,
    this.onTap,
    this.allCaps = TextCapitalization.none,
    this.enable,
    this.isDropDown = false,
    this.hintText = "",
    this.prefixWidget,
    this.keboardType = TextInputType.text,
    this.maxLenght = 200,
    this.isDropDownHint = AppConstants.pleaseSelect,
    this.isSearch = false,
    this.style,
  }) : super(key: key);

  final BuildContext context;
  final String textFieldName;
  final int numberOfLines;
  final String? imageName;
  final Function? onSumitted;
  final Function(String)? onChange;
  final Function()? onSuffixTap;
  final Function()? onTap;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  final bool? isImage;
  final double? height;
  final double? fontSize;
  final Color? fillColor;
  final bool? isSuffixImage;
  final String? suffixImage;
  final bool? isObsecure;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? allCaps;
  final bool? enable;
  final bool? isDropDown;
  final String hintText;
  final Widget? prefixWidget;
  final TextInputType? keboardType;
  final int maxLenght;
  final String? isDropDownHint;
  final bool? isSearch;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isSearch!)
          TitleTextView(
            textFieldName,
            fontSize: f13,
          ),
        sb(5),
        GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap!();
            }
          },
          child: TextFormField(
            controller: controller,
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 10),
            decoration: InputDecoration(
              hintText: hintText=="" ? isDropDownHint : hintText,
              isDense: true,
              enabled: enable ?? true,
              counterText: "",
              contentPadding:
                  EdgeInsets.symmetric(vertical: height ?? 10, horizontal: 0),
              hintStyle: TextStyle(
                color: greyColorLight1,
                fontSize: fontSize ?? f15,
              ),
              labelStyle: TextStyle(
                color: clrAppLight2,
                fontSize: fontSize ?? f15,
              ),
              fillColor: whiteColor,
              filled: true,
              prefixIcon: prefixWidget ??
                  (isImage!
                      ? Image.asset(
                          imageName ?? "",
                          width: 50,
                        )
                      : Container()),
              prefixIconConstraints: BoxConstraints(
                maxHeight: 25,
                maxWidth: isImage! ? 150 : 13,
              ),
              suffixIcon: isSuffixImage!
                  ? GestureDetector(
                      onTap: onSuffixTap,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Image.asset(
                          suffixImage ?? "",
                          width: suffixImage == Imagename.downArrow ? 14 : 20,
                          height: suffixImage == Imagename.downArrow ? 14 : 20,
                          color: clrAppLight2,
                        ),
                      ),
                    )
                  : Container(
                      width: 10,
                    ),
              suffixIconConstraints: const BoxConstraints(
                maxHeight: 25,
                maxWidth: 40,
                minWidth: 0,
                minHeight: 0,
              ),
              border: myinputborder(),
              enabledBorder: myinputborder(),
              focusedBorder: myfocusborder(),
              disabledBorder: myinputborder(),
            ),
            obscureText: isObsecure ?? false,
            cursorColor: clrAppLight2,
            style: style ??
                TextStyle(
                  color: blackColor,
                  fontSize: fontSize ?? f155,
                  fontFamily: FontName.nunitoSansSemiBold,
                ),
            textInputAction: textInputAction,
            maxLines: numberOfLines,
            onFieldSubmitted: (v) {
              if (onSumitted != null) {
                onSumitted!();
              }
            },
            // onEditingComplete: onSumitted!(),
            onChanged: (v) {
              if (onChange != null) {
                onChange!(v);
              }
            },
            inputFormatters: inputFormatters,
            maxLength: maxLenght,
            textCapitalization: allCaps!,
            keyboardType: keboardType,
          ),
        )
      ],
    );
  }

  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return OutlineInputBorder(
      borderRadius: radius(4),
      borderSide: BorderSide(
        color: clrAppLight4,
        width: 1,
      ),
    );
  }

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: radius(4),
        borderSide: BorderSide(
          color: clrAppLight1,
          width: 1,
        ));
  }
}

class CustomDropDownField extends StatelessWidget {
  const CustomDropDownField({
    Key? key,
    required this.context,
    required this.textFieldName,
    this.imageName,
    this.onChange,
    this.isImage = false,
    this.height,
    this.fontSize,
    this.fillColor,
    this.isSuffixImage = false,
    this.suffixImage,
    this.isObsecure = false,
    this.onSuffixTap,
    this.onTap,
    this.allCaps = TextCapitalization.none,
    this.hintText = "",
    this.prefixWidget,
    this.isDropDownHint = AppConstants.pleaseSelect,
    this.style,
    required this.list,
    this.apiCall,
    this.fieldKey,
    this.selectedItem,
    this.onChangeInt,
    this.isSubType = false,
    this.isDisable = false,
    this.onValidation,
    this.showSearch = true,
  }) : super(key: key);

  final BuildContext context;
  final String textFieldName;
  final String? imageName;
  final Function(DropDownModel)? onChange;
  final Function(int)? onChangeInt;
  final Function()? onSuffixTap;
  final Function()? onTap;
  final bool? isImage;
  final double? height;
  final double? fontSize;
  final Color? fillColor;
  final bool? isSuffixImage;
  final String? suffixImage;
  final bool? isObsecure;
  final TextCapitalization? allCaps;
  final String hintText;
  final Widget? prefixWidget;
  final String? isDropDownHint;
  final TextStyle? style;
  final List<DropDownModel> list;
  final Future<List<DropDownModel>> Function(dynamic v)? apiCall;
  final GlobalKey<DropdownSearchState<DropDownModel>>? fieldKey;
  final DropDownModel? selectedItem;
  final bool? isSubType;
  final bool? isDisable;
  final Function()? onValidation;
  final bool? showSearch;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isDisable!) {
          onValidation!();
        }
      },
      child: IgnorePointer(
        ignoring: isDisable!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleTextView(
              textFieldName,
              fontSize: f13,
            ),
            sb(5),
            Container(
              // padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: clrAppLight5,
                  width: 0,
                ),
                color: whiteColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: DropdownSearch<DropDownModel>(
                key: fieldKey,

                compareFn: (i, s) => i.isEqual(s),
                asyncItems: apiCall,
                onChanged: (model) {
                  // if (model != null) {
                  if (isSubType!) {
                    onChange!(model ?? DropDownModel());
                  } else {
                    onChangeInt!(model != null ? model.id! : 0);
                  }
                  // }
                },

                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    border: myinputborder(),
                    enabledBorder: myinputborder(),
                    fillColor: Colors.pink,
                    iconColor: Colors.pink,
                    hoverColor: Colors.pink,
                    focusColor: Colors.pink,
                    focusedBorder: myfocusborder(),
                    // prefixIcon: Icon(Icons.restart_alt_outlined),
                    // labelText: "Complaints*",
                    // hintText: "Select an Int",
                    suffix: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Image.asset(
                        suffixImage ?? "",
                        width: 29,
                        height: 12,
                        color: clrAppLight2,
                      ),
                    ),
                    isDense: false,

                    contentPadding: const EdgeInsets.symmetric(vertical: -7),
                    suffixIconColor: Colors.pink,
                    suffixIconConstraints:
                        const BoxConstraints(maxHeight: 0, maxWidth: 0),
                  ),
                ),
                items: list,
                selectedItem: selectedItem,
                dropdownBuilder: (context, item) {
                  return Container(
                    child: (item == null)
                        ? ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 13),
                            title: Text(
                              isDropDownHint!,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: greyColorLight1,
                                fontSize: fontSize ?? f15,
                              ),
                            ),
                          )
                        : ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 13),
                            title: Text(
                              item.name ?? AppConstants.pleaseSelect,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: (item.name != null)
                                    ? blackColor
                                    : greyColorLight1,
                                fontSize: f155,
                                fontFamily: FontName.nunitoSansSemiBold,
                              ),
                            ),
                          ),
                  );
                },
                popupProps: PopupProps.menu(
                  isFilterOnline: true,
                  showSelectedItems: true,
                  showSearchBox: showSearch!,
                  searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(fontSize: 12.0),
                        floatingLabelStyle: const TextStyle(fontSize: 12.0),
                        border: myinputborder(),
                        focusedBorder: myinputborder(),
                        isDense: false,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        hintText: "Search here....",
                      ),
                      cursorColor: clrApp,
                      style: TextStyle(
                        color: blackColor,
                        fontSize: f155,
                        fontFamily: FontName.nunitoSansSemiBold,
                      )),
                  // showSelectedItems: true,
                  itemBuilder: (context, DropDownModel model, isSelected) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 1),
                      padding: const EdgeInsets.all(10),
                      decoration: !isSelected
                          ? null
                          : BoxDecoration(
                              border: Border.all(color: clrApp),
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                      child: Text(
                        model.name ?? "",
                        style: TextStyle(
                          color: blackColor,
                          fontSize: f155,
                          fontFamily: FontName.nunitoSansSemiBold,
                        ),
                      ),
                    );
                  },
                ),
                // popupItemBuilder: (context, isSelected){
                //   return Container(
                //     margin: const EdgeInsets.symmetric(horizontal: 8),
                //     decoration: !isSelected
                //         ? null
                //         : BoxDecoration(
                //       border: Border.all(color: Theme.of(context).primaryColor),
                //       borderRadius: BorderRadius.circular(5),
                //       color: Colors.white,
                //     ),
                //     child: ListTile(
                //       title: Text(item.toString(),
                //           style: const TextStyle(
                //             fontSize: 14,
                //             color: Color.fromARGB(255, 102, 100, 100),
                //           )),
                //     ),
                //   );
                // },

                // onFind: (String? filter) => getData(filter ?? "", storeId: storeId),
                // showClearButton: false,
                // clearButtonBuilder: (_) => const Padding(
                //   padding: EdgeInsets.all(8.0),
                //   child: Icon(Icons.clear, size: 17, color: Colors.black),
                // ),
              ),
            )
          ],
        ),
      ),
    );
  }

  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return OutlineInputBorder(
        borderRadius: radius(4),
        borderSide: BorderSide(
          color: clrAppLight4,
          width: 1,
        ));
  }

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: radius(4),
        borderSide: BorderSide(
          color: clrAppLight1,
          width: 1,
        ));
  }
}

class DropDownModel {
  final int? id;
  final String? name;
  final String? mainId;

  DropDownModel({this.id, this.name, this.mainId});

  factory DropDownModel.fromJson(Map<String, dynamic> json) {
    return DropDownModel(
      id: json["id"],
      name: json["name"],
      mainId: json["mainId"],
    );
  }

  static List<DropDownModel> fromJsonList(List list) {
    return list.map((item) => DropDownModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.id} ${this.name}';
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(DropDownModel model) {
    return this.id == model.id;
  }
}

class SingleDropDownField extends StatelessWidget {
  const SingleDropDownField({
    Key? key,
    required this.context,
    required this.textFieldName,
    this.imageName,
    this.onChange,
    this.isImage = false,
    this.height,
    this.fontSize,
    this.fillColor,
    this.isSuffixImage = false,
    this.suffixImage,
    this.isObsecure = false,
    this.onSuffixTap,
    this.onTap,
    this.allCaps = TextCapitalization.none,
    this.hintText = "",
    this.prefixWidget,
    this.isDropDownHint = AppConstants.pleaseSelect,
    this.style,
    this.fieldKey,
    this.selectedItem,
    this.isSubType = false,
    this.onValidation,
    this.showSearch = true,
  }) : super(key: key);

  final BuildContext context;
  final String textFieldName;
  final String? imageName;
  final Function(String)? onChange;
  final Function()? onSuffixTap;
  final Function()? onTap;
  final bool? isImage;
  final double? height;
  final double? fontSize;
  final Color? fillColor;
  final bool? isSuffixImage;
  final String? suffixImage;
  final bool? isObsecure;
  final TextCapitalization? allCaps;
  final String hintText;
  final Widget? prefixWidget;
  final String? isDropDownHint;
  final TextStyle? style;
  final GlobalKey<DropdownSearchState<String>>? fieldKey;
  final String? selectedItem;
  final bool? isSubType;
  final Function()? onValidation;
  final bool? showSearch;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextView(
          textFieldName,
          fontSize: f13,
        ),
        sb(5),
        Container(
          // padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
              color: clrAppLight4,
              width: 0,
            ),
            color: clrAppLight5,
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: DropdownSearch<String>(
            key: fieldKey,
            compareFn: (i, s) => (i == s),
            onChanged: (model) {
              // if (model != null) {
              onChange!(model ?? "");

              // }
            },
            enabled: false,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                border: myinputborder(),
                enabledBorder: myinputborder(),
                disabledBorder: myinputborder(),
                fillColor: Colors.pink,
                iconColor: Colors.pink,
                hoverColor: Colors.pink,
                focusColor: Colors.pink,
                focusedBorder: myfocusborder(),
                // prefixIcon: Icon(Icons.restart_alt_outlined),
                // labelText: "Complaints*",
                // hintText: "Select an Int",
                // suffix: Padding(
                //   padding: const EdgeInsets.only(right: 5),
                //   child: Image.asset(
                //     suffixImage ?? "",
                //     width: 29,
                //     height: 12,
                //     color: clrAppLight2,
                //   ),
                // ),
                isDense: false,

                contentPadding: const EdgeInsets.symmetric(vertical: -7),
                suffixIconColor: Colors.pink,
                suffixIconConstraints:
                    const BoxConstraints(maxHeight: 0, maxWidth: 0),
              ),
            ),
            selectedItem: selectedItem,
            dropdownBuilder: (context, item) {
              return Container(
                child: (item == "")
                    ? ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 13),
                        title: Text(
                          isDropDownHint!,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: greyColorLight1,
                            fontSize: fontSize ?? f15,
                          ),
                        ),
                      )
                    : ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 13),
                        title: Text(
                          item ?? AppConstants.pleaseSelect,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color:
                                (item != null) ? blackColor : greyColorLight1,
                            fontSize: f155,
                            fontFamily: FontName.nunitoSansSemiBold,
                          ),
                        ),
                      ),
              );
            },
          ),
        )
      ],
    );
  }

  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return OutlineInputBorder(
        borderRadius: radius(4),
        borderSide: BorderSide(
          color: clrAppLight4,
          width: 1,
        ));
  }

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: radius(4),
        borderSide: BorderSide(
          color: clrAppLight1,
          width: 1,
        ));
  }
}
