import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:yeka/utill/color_resources.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/view/basewidget/appbar/custom_sliver_app_bar.dart';
import 'package:yeka/view/basewidget/textfield/custom_car_number_textfield.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import 'package:provider/provider.dart';

import '../../../data/model/response/process_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/process_provider.dart';
import '../../../utill/images.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/radio/custom_radio_button.dart';
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
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 15.0, 0.0, 0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Text(
                                        "AI TEST",
                                        style: TextStyle(
                                          fontSize: 60,
                                          color: Color(0xff444444),
                                        ),
                                      ),
                                      Center(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                                            Text(
                                              "${getTranslated('PLEASE_UPLOAD_PICTURE', context)}",
                                              style: TextStyle(
                                                fontSize: 26,
                                                color: Color(0xffFFFFFF),
                                                fontWeight: FontWeight.bold,
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
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Container(
                                height: MediaQuery.of(context).size.width * 0.9,
                                  decoration: BoxDecoration(
                                    // border: Border.all(
                                    //   width: 2,
                                    //   color: Color(0XFF2434D7),
                                    // ),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                    color: Color(0xfff1f1f1),
                                  ),
                                  child: Center(child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Image.asset(
                                          Images.help,
                                          width: 23,
                                        ),
                                      ),
                                      Text("${getTranslated('REGISTRATION_IMAGE', context)}"),
                                    ],
                                  ))
                              )
                            ),
                            SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => OXPage()),);
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.green,
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
                                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
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
                      MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
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
