import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function onTap;
  final String buttonText;
  final Color backgroundColor;
  final Color textColor;
  final Widget child;
  final EdgeInsets padding;

  CustomElevatedButton({
    @required this.onTap,
    @required this.buttonText,
    this.backgroundColor = const Color(0XFF121212),
    this.textColor,
    this.child,
    this.padding = const EdgeInsets.fromLTRB(20, 0, 20, 0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Padding(
        padding: padding, // 20, 38.5, 20, 0
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
      ),
    );
  }
}
