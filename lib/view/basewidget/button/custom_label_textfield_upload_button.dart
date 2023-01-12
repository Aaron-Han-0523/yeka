import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../util//dimensions.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class CustomLabelTextFieldUploadButton extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String essentialLabelText;
  final String hintText;
  final TextInputType textInputType;
  final int maxLine;
  final FocusNode focusNode;
  final FocusNode nextNode;
  final TextInputAction textInputAction;
  final bool isPhoneNumber;
  final bool isValidator;
  final String validatorMessage;
  final Color fillColor;
  final TextCapitalization capitalization;
  final bool isBorder;
  final Color borderColor;
  final double borderRadius;
  final TextAlign textAlign;
  final Color textColor;
  final Color boxColor;
  final double height;
  final bool enabled;

  CustomLabelTextFieldUploadButton({
    this.labelText = "",
    this.essentialLabelText = "",
    this.hintText = "",
    this.controller,
    this.textInputType,
    this.maxLine,
    this.focusNode,
    this.nextNode,
    this.textInputAction,
    this.isPhoneNumber = false,
    this.isValidator = false,
    this.validatorMessage,
    this.capitalization = TextCapitalization.none,
    this.fillColor,
    this.isBorder = true,
    this.borderColor = const Color(0Xffdddddd),
    this.borderRadius = 3.0,
    this.textAlign = TextAlign.start,
    this.textColor = const Color(0xff555555),
    // this.boxColor = const Color(0xffeeeeee),
    this.boxColor = Colors.white,
    this.height = 35,
    this.enabled = true,
  });

  @override
  Widget build(context) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.MARGIN_SIZE_DEFAULT,
        right: Dimensions.MARGIN_SIZE_DEFAULT,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 4.0, 16.0, 2.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  labelText,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  essentialLabelText,
                  style: TextStyle(
                    color: Color(0xffff0000),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                // padding: const EdgeInsets.all(8.0),
                // margin: const EdgeInsets.all(8.0),
                width: 95,
                height: height,
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Color(0xff121212)),
                  ),
                  child: Text('파일 선택',style: TextStyle(fontSize: 12),),
                  onPressed: () async {
                    var picked = await FilePicker.platform.pickFiles();

                    if (picked != null) {
                      print(picked.files.first.name);
                      this.controller.text = picked.files.first.name;
                    }
                  },
                ),
              ),
              Expanded(
                child: Container(
                  // width: double.infinity,
                  // padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                  height: height,
                  decoration: BoxDecoration(
                    border: isBorder
                        ? Border.all(width: 1, color: borderColor)
                        : null,
                    color: boxColor,
                    borderRadius: isPhoneNumber
                        ? BorderRadius.only(
                            topRight: Radius.circular(6),
                            bottomRight: Radius.circular(6))
                        : BorderRadius.all(Radius.circular(borderRadius)),
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: Colors.grey.withOpacity(0.1),
                    //       spreadRadius: 1,
                    //       blurRadius: 3,
                    //       offset: Offset(0, 1)) // changes position of shadow
                    // ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      enabled: enabled,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: textColor,
                      ),
                      textAlign: textAlign,
                      controller: controller,
                      maxLines: maxLine ?? 1,
                      textCapitalization: capitalization,
                      maxLength: isPhoneNumber ? 15 : null,
                      focusNode: focusNode,
                      keyboardType: textInputType ?? TextInputType.text,
                      //keyboardType: TextInputType.number,
                      initialValue: null,
                      textInputAction: textInputAction ?? TextInputAction.next,
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(nextNode);
                      },
                      //autovalidate: true,
                      inputFormatters: [
                        isPhoneNumber
                            ? FilteringTextInputFormatter.digitsOnly
                            : FilteringTextInputFormatter.singleLineFormatter
                      ],
                      validator: (input) {
                        if (input.isEmpty) {
                          if (isValidator) {
                            return validatorMessage ?? "";
                          }
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: hintText ?? '',
                        hintStyle: TextStyle(fontSize: 9),
                        filled: fillColor != null,
                        fillColor: fillColor,
                        contentPadding: EdgeInsets.fromLTRB(8.0, 2.0, 4.0, 2.0),
                        // contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
                        isDense: true,
                        counterText: '',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        // hintStyle: titilliumRegular.copyWith(color: Theme.of(context).hintColor),
                        errorStyle: TextStyle(height: 1.5),
                        border: InputBorder.none,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
