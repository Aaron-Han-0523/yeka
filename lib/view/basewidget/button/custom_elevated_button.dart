import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function onTap;
  final String buttonText;
  final Color backgroundColor;
  final Color textColor;
  final Widget child;

  CustomElevatedButton({
    @required this.onTap,
    @required this.buttonText,
    this.backgroundColor = const Color(0XFF121212),
    this.textColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            // textStyle: const TextStyle(
            //   fontSize: 12,
            // ),
            padding: const EdgeInsets.all(4.0),
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
                      fontSize: 10,
                      color: textColor,
                    ),
                  ),
          ),
        )),
      ],
    );
  }
}
