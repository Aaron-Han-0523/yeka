import 'package:flutter/material.dart';

class CustomElevatedButton_SMALL extends StatelessWidget {
  final Function onTap;
  final String buttonText;
  final Color backgroundColor;
  final Color textColor;
  final Widget child;

  CustomElevatedButton_SMALL({
    @required this.onTap,
    @required this.buttonText,
    this.backgroundColor = const Color(0XFF707070),
    this.textColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
      // textStyle: const TextStyle(
      //   fontSize: 12,
      // ),
      minimumSize: Size.fromHeight(20),
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(25.0),

      ),
        ),
        onPressed: onTap,
        child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: child != null
          ? child
          : Text(
              buttonText,
              style: TextStyle(
                fontSize: 12,
                color: textColor,
              ),
            ),
        ),
      ),
    );
  }
}
