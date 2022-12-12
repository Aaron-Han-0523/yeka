import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:yeka/utill/color_resources.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/view/basewidget/appbar/custom_sliver_app_bar.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';

import '../../../localization/language_constrants.dart';
import '../../../utill/images.dart';
import '../home/home_screens.dart';
import 'ox_screen.dart';

class ImageUploadPage extends StatefulWidget {
  @override
  State<ImageUploadPage> createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage>
    with TickerProviderStateMixin {
  bool _radioValue = true;
  bool _inputFormValue = false;
  TextEditingController _textEditingController = TextEditingController();

  void setStateButtonValue(value) {
    setState(() {
      _inputFormValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.getHomeBg(context),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar
              CustomSliverAppBar("AI 테스트").getAppbar(),

              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width + 100,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const Divider(
                      //   height: 5,
                      //   thickness: 1,
                      //   indent: 0,
                      //   endIndent: 0,
                      //   color: Colors.black12,
                      // ),
                      // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Container(
                        // height: 500,
                        decoration: BoxDecoration(
                          // border: Border.all(
                          //   width: 2,
                          //   color: Color(0XFF2434D7),
                          // ),
                          // borderRadius:
                          // BorderRadius.all(Radius.circular(8.0)),
                          color: Color(0xff333333),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Text(
                                        "AI TEST",
                                        style: TextStyle(
                                          fontSize: 72,
                                          color: Color(0xff444444),
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 5,
                                        ),
                                      ),
                                      Center(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                height: Dimensions
                                                    .PADDING_SIZE_DEFAULT),
                                            SizedBox(
                                                height: Dimensions
                                                    .PADDING_SIZE_DEFAULT),
                                            SizedBox(
                                                height: Dimensions
                                                    .PADDING_SIZE_DEFAULT),
                                            SizedBox(
                                                height: Dimensions
                                                    .PADDING_SIZE_DEFAULT),
                                            Container(
                                              child: Text(
                                                "${getTranslated('PLEASE_UPLOAD_PICTURE', context)}",
                                                style: TextStyle(
                                                  fontSize: 26,
                                                  color: Color(0xffFFFFFF),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "${getTranslated('FRONT_PICTURE', context)}",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xffFFFFFF),
                                                // fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "${getTranslated('CORRECT_PICTURE', context)}",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xffFFFFFF),
                                                // fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            Container(
                              height: 340,
                              child: Padding(
                                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                        height:
                                            MediaQuery.of(context).size.width * 0.8,
                                        decoration: BoxDecoration(
                                          // border: Border.all(
                                          //   width: 2,
                                          //   color: Color(0XFF2434D7),
                                          // ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                          color: Color(0xffF1F1F1),
                                        ),
                                        child: Center(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(15.0),
                                              child: Image.asset(
                                                Images.help,
                                                width: 23,
                                              ),
                                            ),
                                            Text(
                                                "${getTranslated('REGISTRATION_IMAGE', context)}",
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w900
                                              ),
                                            ),

                                          ],
                                        ))),
                                  )),
                            ),
                            // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => OXPage()),
                              );
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xff121212),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      Images.cloud,
                                      height: 38,
                                      color: Colors.black,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                      child: Text(
                                        "${getTranslated('START', context)}",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: "SB Aggro",
                                          // fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      // SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      FooterPage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              // title: new Text("Dialog Title"),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                  Row(
                    children: [
                      Text(
                        "폐차 진행 중입니다.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text("취소"),
                  onPressed: () {
                    return Navigator.pop(context);
                  },
                ),
                Container(
                  child: CupertinoDialogAction(
                    child: Container(
                      child: Text(
                        "확인",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => HomePage()),
                          (route) => false);
                    },
                  ),
                  decoration: BoxDecoration(
                    color: Color(0XFF2434D7),
                  ),
                ),
              ],
            ));
  }
}
