import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:yeka/utill/color_resources.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/view/basewidget/appbar/custom_sliver_app_bar.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';

import '../../../localization/language_constrants.dart';
import '../../../utill/images.dart';
import 'ai_result_screen.dart';

class OXPage extends StatefulWidget {
  @override
  State<OXPage> createState() => _OXPageState();
}

class _OXPageState extends State<OXPage> with TickerProviderStateMixin {
  var testList = [
    "1. dkdk",
    "2. dkdk",
    "3. dkdk",
    "4. dkdk",
    "5. dkdk",
    "6. dkdk",
    "7. dkdk",
    "8. dkdk",
    "9. dkdk",
    "10. dkdk",
    "11. dkdk",
    "12. dkdk",
    "13. dkdk",
    "14. dkdk",
    "15. dkdk",
  ];

  int stage = 0;

  List<bool> stageValues = [];

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
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xff333333),
                        ),
                        child: Container(
                          height: 475,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 117,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              12.0, 5.0, 12.0, 0.0),
                                          child: Text(
                                            "AI TEST",
                                            style: TextStyle(
                                              fontSize: 70,
                                              color: Color(0xff444444),
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                height: 340,
                                child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        24.0, 0.0, 24.0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.asset(
                                        Images.ai_test2,
                                        fit: BoxFit.cover,
                                        height:
                                        MediaQuery.of(context).size.width *
                                            0.85,
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.85,
                                        // color: Colors.black,
                                      ),
                                    )),
                              ),
                              SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                            ],
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Image.asset(
                                Images.ball2on,
                                fit: BoxFit.fill,
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                MediaQuery.of(context).size.width * 0.22,
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  140.0, 5.0, 12.0, 0.0),
                              child: Text(
                                "${testList[stage]}",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Color(0xffEEEEEE),
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  stageValues.add(true);
                                  if (stage > 13) {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => AIResultPage(),
                                      ),
                                    );
                                  } else {
                                    setState(() {
                                      stage++;
                                    });
                                  }
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      "${getTranslated('YES_BUTTON', context)}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                Images.yes_bt,
                                                height: 57,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  stageValues.add(false);
                                  if (stage > 13) {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => AIResultPage(),
                                      ),
                                    );
                                  } else {
                                    setState(() {
                                      stage++;
                                    });
                                  }
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      "${getTranslated('NO_BUTTON', context)}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                Images.no_bt,
                                                height: 57,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      FooterPage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
