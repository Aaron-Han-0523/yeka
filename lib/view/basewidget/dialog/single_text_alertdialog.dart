import 'package:flutter/material.dart';
import 'package:yeka/util/custom_themes.dart';

class SingleTextAlertDialog extends StatelessWidget {
  final String message;

  SingleTextAlertDialog({this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), //this right here
      child: Container(
        height: 70,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(message ?? '', style: titilliumBold),
        ),
      ),
    );
  }
}
