import 'package:flutter/material.dart';

import '../../../localization/language_constrants.dart';
import '../../../utill/dimensions.dart';
import '../radio/custom_small_radio_button.dart';

class CustomTextarea extends StatelessWidget {
  final bool isBorder;
  final bool enabled;
  final TextEditingController textEditingController;
  final String labelText;
  final String radioText;
  final String hintText;
  final Color hintTextColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry labelPadding;
  final EdgeInsetsGeometry contentPadding;
  final double labelFontSize;

  CustomTextarea({
    this.isBorder = true,
    this.textEditingController,
    this.enabled = true,
    this.labelText = "",
    this.radioText = "",
    this.hintText = "서비스 이용약관 제1조",
    this.hintTextColor,
    this.padding = const EdgeInsets.all(4),
    this.labelPadding = const EdgeInsets.fromLTRB(2.0, 4.0, 16.0, 2.0),
    this.contentPadding = const EdgeInsets.all(10),
    this.labelFontSize = 15,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: padding,
      margin: EdgeInsets.only(
        left: Dimensions.MARGIN_SIZE_DEFAULT,
        right: Dimensions.MARGIN_SIZE_DEFAULT,
      ),
      child: Column(
        children: [
          Padding(
            padding: labelPadding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //TERMS_OF_SERVICE
                Text(
                  "$labelText",
                  style: TextStyle(
                    fontSize: labelFontSize,
                  ),
                ),
                Text(
                  "",
                  style: TextStyle(
                    color: Color(0xffff0000),
                    fontSize: 10,
                  ),
                ),

                radioText != ""
                    ? CustomSmallRadioButton(
                        value: true,
                        text: radioText,
                        reverse: true,
                      )
                    : Container(),
              ],
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 155.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: isBorder
                    ? Border.all(
                        width: 1,
                        color: Color(0xffeeeeee),
                      )
                    : null,
                // color: Color(0xffdddddd),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                reverse: false,

                // here's the actual text box
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 12.0),
                  child: TextField(
                    enabled: enabled,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    minLines: 10,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          fontSize: 9,
                          color: hintTextColor),
                      hintText: hintText,
                      hintMaxLines: 5,
                      border: InputBorder.none,
                      contentPadding: contentPadding,
                    ),
                    // readOnly: true,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    controller: textEditingController,
                  ),
                ),
                // ends the actual text box
              ),
            ),
          ),
        ],
      ),
    );
  }
}
