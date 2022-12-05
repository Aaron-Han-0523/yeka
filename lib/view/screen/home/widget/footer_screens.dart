import 'package:flutter/material.dart';

import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/utill/images.dart';

import '../../../../localization/language_constrants.dart';
import '../../chat/chat_screen.dart';

class FooterPage extends StatefulWidget {
  @override
  State<FooterPage> createState() => _FooterPageState();
}

class _FooterPageState extends State<FooterPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width + 100,
      decoration: BoxDecoration(color: Color(0xFF121212),),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
                Text(
                  "${getTranslated('FOOTER_TEXT1', context)}",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 6,
                  ),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
                Text(
                  "${getTranslated('FOOTER_TEXT2', context)}",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 6,
                  ),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
                Text(
                  "${getTranslated('FOOTER_TEXT3', context)}",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 6,
                  ),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
                Text(
                  "${getTranslated('FOOTER_TEXT4', context)}",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 6,
                  ),
                ),
                // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                // Text(
                //   "${getTranslated('FOOTER_TEXT5', context)}",
                //   style: TextStyle(
                //     color: Color(0xFFFFFFFF),
                //     fontSize: 10,
                //   ),
                // ),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Column(
                children: [
                  Image(
                    image: AssetImage(
                      Images.logo_w,
                    ),
                    height: 33,
                  ),
                  //SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
