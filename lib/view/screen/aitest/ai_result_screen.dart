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
import '../../basewidget/button/custom_outlined_button.dart';
import '../../basewidget/radio/custom_radio_button.dart';
import '../home/home_screens.dart';

class AIResultPage extends StatefulWidget {
  @override
  State<AIResultPage> createState() => _AIResultPageState();
}

class _AIResultPageState extends State<AIResultPage>
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
              CustomSliverAppBar("AI 테스트 결과").getAppbar(),

              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width + 100,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(
                        height: 5,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Colors.black12,
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Center(
                        child: Text(
                          "OOO님의 AI 테스트 결과입니다.",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Center(
                        child: Text(
                          "당신은 Spring 봄 라이트 입니다.",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      Center(
                        child: Text(
                          "맑고 따뜻한 색이 잘 어울리는 봄 라이트",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),

                      // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Center(
                        child: Text(
                          "#가벼운 #여성스러운 #싱그러운 #따뜻한 #아기자기한 #로멘틱한",
                          style: TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    color: Colors.lightGreenAccent,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    color: Colors.lightGreenAccent,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    color: Colors.lightGreenAccent,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    color: Colors.lightGreenAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 230,
                              width: 230,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(230),
                                ),
                                color: Colors.lightGreenAccent,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    color: Colors.lightGreenAccent,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    color: Colors.lightGreenAccent,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    color: Colors.lightGreenAccent,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50),
                                    ),
                                    color: Colors.lightGreenAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Images.consult,
                            height: 25,
                            color: Colors.black,
                          ),
                          Text(
                            "봄 라이트 사람들이 베이직하게 쓸 수 있는 컬러",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.all(
                                //   Radius.circular(50),
                                // ),
                                color: Colors.lightGreenAccent,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.all(
                                //   Radius.circular(50),
                                // ),
                                color: Colors.lightGreenAccent,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.all(
                                //   Radius.circular(50),
                                // ),
                                color: Colors.lightGreenAccent,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.all(
                                //   Radius.circular(50),
                                // ),
                                color: Colors.lightGreenAccent,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          // height: 50,
                          // width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                              style: BorderStyle.solid,
                            ),
                            // color: Colors.lightGreenAccent,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      Images.consult,
                                      height: 25,
                                      color: Colors.black,
                                    ),
                                    Text("봄 라이트", style: TextStyle(fontSize: 20, color: Colors.black,),),
                                  ],
                                ),
                                Text("맑고 따뜻한 색이 잘 어울리는 봄 라이트", style: TextStyle(fontSize: 11, color: Colors.grey,),),
                                Text("#가벼운 #여성스러운 #싱그러운 # 따뜻한 #아기자기한 #밝은 #로맨틱한", style: TextStyle(fontSize: 11, color: Colors.grey,),),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              color: Colors.lightGreenAccent,
                            ),
                            child: Center(
                              child: Text(
                                "1",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "패션",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      Text(
                        "따뜻한 파스텔 계열이 잘 어울리는 봄 라이트는 밝은 색이 중요하기에 어둡거나 선명한 색상은 피하는게 좋습니다. 대비감이 어울리지 않기에 비슷한 느낌의 색상으로 자연스럽게 매치하는 것이 좋습니다. 옷의 패턴과 악세사리는 꽃, 하트, 땡땡이 리본과 곡선적인 라인이 좋고 큰 사이즈보다는 중간 ~ 작은 사이즈가 좋고 악세사리는 로즈골드, 샴페인골드 색상이 좋습니다.",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              color: Colors.lightGreenAccent,
                            ),
                            child: Center(
                              child: Text(
                                "2",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "헤어",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      Text(
                        "허니 브라운, 밀크 브라운, 내추럴 브라운, 애쉬 브라운, 라이트 브라운 과 같이 밝은 브라운이 잘 어울리고 너무 노란 골드 브라운, 채도가 높은 체리레드, 명도가 낮은 블랙은 피해주시는게 좋습니다.",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                      Text(
                        "* 데이터와 질문지를 조합한 결과이므로 정확하지 않을 수 있습니다.",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 0.0, 4.0, 0.0),
                              child: CustomElevatedButton(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              HomePage()),
                                          (route) => false);
                                },
                                buttonText: "${getTranslated('CONFIRM', context)}",
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(
                                  4.0, 0.0, 0.0, 0.0),
                              child: CustomOutlinedButton(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                buttonText: "${getTranslated('CANCEL', context)}",
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      FooterPage(),
                    ],
                  ),
                ),
              )
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
