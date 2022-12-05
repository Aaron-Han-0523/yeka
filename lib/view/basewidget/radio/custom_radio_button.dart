import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utill/images.dart';

class CustomRadioButton extends StatelessWidget {
  final bool _value;
  final String text;
  final Color color;

  CustomRadioButton(this._value, this.text, [this.color]);

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            // padding: const EdgeInsets.all(4.0),
            // color: Colors.red,
            child: _value
                ? SvgPicture.asset(
                    Images.radio_button_checked,
                    width: 22,
                    color: Color(0XFF2434D7),
                  )
                : SvgPicture.asset(
                    Images.radio_button_unchecked,
                    width: 22,
                    color: color == null ? Colors.grey : color,
                  )),
        Container(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 12.0),
          // color: Colors.lightBlue,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: color == null ? Colors.black87 : color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
