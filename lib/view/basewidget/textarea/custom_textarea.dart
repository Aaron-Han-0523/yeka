import 'package:flutter/material.dart';

import '../../../util//dimensions.dart';
import '../radio/custom_small_radio_button.dart';

class CustomTextarea extends StatefulWidget {
  final bool isBorder;
  final bool enabled;
  final TextEditingController textEditingController;
  final String labelText;
  final String radioText;
  final double label_fontSize;
  final EdgeInsets padding;
  final String hintText;
  final EdgeInsetsGeometry contentPadding;
  final double hintSize;
  final Color hintColor;
  final Widget radioButton;
  final double maxHeight;

  CustomTextarea({
    this.isBorder = true,
    this.textEditingController,
    this.enabled = true,
    this.labelText = "",
    this.radioText = "",
    this.label_fontSize = 15,
    this.padding = const EdgeInsets.fromLTRB(2.0, 4.0, 16.0, 2.0),
    this.hintText = '서비스 이용약관 제1조',
    this.contentPadding = const EdgeInsets.all(10),
    this.hintSize = 9,
    this.hintColor,
    this.radioButton,
    this.maxHeight = 155.0,
  });

  @override
  State<CustomTextarea> createState() => _CustomTextareaState();
}

class _CustomTextareaState extends State<CustomTextarea> {
  bool innerRadioButton = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(4.0),
      margin: EdgeInsets.only(
        left: Dimensions.MARGIN_SIZE_DEFAULT,
        right: Dimensions.MARGIN_SIZE_DEFAULT,
      ),
      child: Column(
        children: [
          Padding(
            padding: this.widget.padding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //TERMS_OF_SERVICE
                Text(
                  "${widget.labelText}",
                  style: TextStyle(
                    fontSize: this.widget.label_fontSize,
                  ),
                ),
                Text(
                  "",
                  style: TextStyle(
                    color: Color(0xffff0000),
                    fontSize: 10,
                  ),
                ),
                widget.radioText != ""
                    ? widget.radioButton == null
                        ? CustomSmallRadioButton(
                            value: innerRadioButton,
                            text: widget.radioText,
                            reverse: true,
                          )
                        : widget.radioButton
                    : Container(),
              ],
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: widget.maxHeight,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: widget.isBorder
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
                    enabled: widget.enabled,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    minLines: 10,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        fontSize: widget.hintSize,
                        color: Color(0xffdddddd),
                      ),
                      hintText: widget.hintText,
                      hintMaxLines: 5,
                      border: InputBorder.none,
                      contentPadding: widget.contentPadding,
                    ),
                    // readOnly: true,
                    style: TextStyle(
                      fontSize: widget.hintSize,
                      color: widget.hintColor,
                    ),
                    controller: widget.textEditingController,
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
