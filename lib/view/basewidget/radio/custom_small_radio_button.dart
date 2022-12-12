import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSmallRadioButton extends StatelessWidget {
  final bool value;
  final String text;
  final bool reverse;
  final EdgeInsetsGeometry padding;

  CustomSmallRadioButton({
    this.value,
    this.text,
    this.reverse = false,
    this.padding = const EdgeInsets.fromLTRB(20, 0, 0, 0),
  });

  @override
  Widget build(BuildContext context) {
    return reverse
        ? Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 2.0),
                // width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  text,
                  // maxLines: 4,
                  style: TextStyle(
                      fontSize: 9,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                // padding: const EdgeInsets.all(8.0),
                child: value
                    ? SvgPicture.asset(
                        "assets/icons/radio_button_checked_FILL0_wght400_GRAD0_opsz48.svg",
                        width: 14,
                        color: Color(0XFF000000),
                      )
                    : SvgPicture.asset(
                        "assets/icons/radio_button_unchecked_FILL0_wght400_GRAD0_opsz48.svg",
                        width: 14,
                        color: Color(0XFF000000),
                      ),
              ),
            ],
          )
        : Padding(
          padding: padding,
          child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  // padding: const EdgeInsets.all(8.0),
                  child: value
                      ? SvgPicture.asset(
                          "assets/icons/radio_button_checked_FILL0_wght400_GRAD0_opsz48.svg",
                          width: 14,
                          color: Color(0XFF000000),
                        )
                      : SvgPicture.asset(
                          "assets/icons/radio_button_unchecked_FILL0_wght400_GRAD0_opsz48.svg",
                          width: 14,
                          color: Color(0XFF000000),
                        ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 2.0),
                  // width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    text,
                    // maxLines: 4,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
        );
  }
}
