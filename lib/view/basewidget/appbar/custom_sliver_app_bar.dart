import 'package:flutter/material.dart';

import '../../../utill/images.dart';
import '../button/home_button.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String titleText;

  CustomSliverAppBar(this.titleText);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      elevation: 0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Text(
        titleText,
        style: TextStyle(color: Colors.black),
      ),
      leading: BackButton(color: Colors.black),
      actions: [HomeButton(Colors.black)],
    );
  }

  Widget getAppbar() {
    return SliverAppBar(
      floating: true,
      elevation: 0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      leading: Container(
        padding: const EdgeInsets.fromLTRB(
          8.0,
          0.0,
          0.0,
          0.0,
        ),
        child: BackButton(color: Colors.black,),
      ),
      title: Center(
        child: Text(
          titleText,
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 4.0, 4.0, 4.0),
            child: Image.asset(
              Images.login_id,
              height: 17,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 4.0, 12.0, 4.0),
            child: InkWell(
              onTap: () => {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => AuthScreen()))
              },
              child: Image.asset(
                Images.mypage,
                height: 17,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
