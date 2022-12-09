import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function onTap;
  final String buttonText;
  final Color backgroundColor;
  final Color textColor;
  final Widget child;
  final EdgeInsetsGeometry padding;

  CustomElevatedButton({
    @required this.onTap,
    @required this.buttonText,
    this.backgroundColor = const Color(0Xff121212),
    this.textColor,
    this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: 30,
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
                color: Color(0Xffffffff),
              ),
            ),
        ),
      ),
    );
  }
}
