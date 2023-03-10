import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeka/data/model/response/consulting_model.dart';
import 'package:yeka/util/color_resources.dart';
import 'package:yeka/util/dimensions.dart';
import 'package:yeka/view/basewidget/appbar/custom_sliver_app_bar.dart';
import 'package:yeka/view/screen/auth/auth_screen.dart';
import 'package:yeka/view/screen/consultant/consultant_list_screen.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';

import '../../../data/model/response/image_model.dart';
import '../../../data/model/response/personal_color_model.dart';
import '../../../data/model/response/user_model.dart';
import '../../../helper/date_converter.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/image_provider.dart';
import '../../../provider/personal_color_provider.dart';
import '../../../provider/user_provider.dart';
import '../../../util//images.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/button/custom_outlined_button.dart';
import '../home/home_screens.dart';
import 'image_upload_screen.dart';

class AIResultPage extends StatefulWidget {
  final int season;
  final int detailSeasonType;
  final ConsultingModel consultingModel;
  final bool loggedIn;

  const AIResultPage(
      {Key key,
      this.season,
      this.detailSeasonType,
      this.consultingModel,
      this.loggedIn})
      : super(key: key);

  @override
  State<AIResultPage> createState() => _AIResultPageState();
}

class _AIResultPageState extends State<AIResultPage>
    with TickerProviderStateMixin {
  bool loggedIn = false;
  Map map = Map();
  PersonalColorModel personalColorModel;

  Future<void> _loadData(BuildContext context, bool reload) async {
    personalColorModel = PersonalColorModel(
      season: widget.season,
      detail_season_type: widget.detailSeasonType,
    );

    personalColorModel =
        await Provider.of<PersonalColorProvider>(context, listen: false)
            .getPersonalColorCondition(personalColorModel);

    await Provider.of<PersonalColorProvider>(context, listen: false).addPersonalColor(personalColorModel);

    loggedIn =
        await Provider.of<AuthProvider>(context, listen: false).isLoggedIn();

    map = Provider.of<AuthProvider>(context, listen: false).getUser();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await _loadData(context, false);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var season = "";
    var seasonKor = "";
    var detailSeasonType = "";

    if (personalColorModel.season == 0) {
      season = "Spring";
      seasonKor = "???";
      switch(personalColorModel.detail_season_type) {
        case 0:
          detailSeasonType = "?????????";
          break;
        case 1:
          detailSeasonType = "?????????";
          break;
        case 2:
          detailSeasonType = "????????????";
          break;
      }
    } else if (personalColorModel.season == 1) {
      season = "Summer";
      seasonKor = "??????";
      switch(personalColorModel.detail_season_type) {
        case 0:
          detailSeasonType = "?????????";
          break;
        case 1:
          detailSeasonType = "??????";
          break;
        case 2:
          detailSeasonType = "????????????";
          break;
      }
    } else if (personalColorModel.season == 2) {
      season = "Fall";
      seasonKor = "??????";
      switch(personalColorModel.detail_season_type) {
        case 0:
          detailSeasonType = "??????";
          break;
        case 1:
          detailSeasonType = "???";
          break;
        case 2:
          detailSeasonType = "?????????";
          break;
      }
    } else if (personalColorModel.season == 3) {
      season = "Winter";
      seasonKor = "??????";
      switch(personalColorModel.detail_season_type) {
        case 0:
          detailSeasonType = "????????????";
          break;
        case 1:
          detailSeasonType = "???";
          break;
        case 2:
          detailSeasonType = "??????";
          break;
      }
    }


    var matchingColorList = [
      "#FF22FF",
      "#FF22FF",
      "#FF22FF",
      "#FF22FF",
      "#FF22FF",
      "#FF22FF",
      "#FF22FF",
      "#FF22FF",
      "#FF22FF",
      "#FF22FF",
      "#FF22FF",
      "#FF22FF",
    ];

    if (personalColorModel.matching_color_array != null &&
        personalColorModel.matching_color_array.split(",").length > 11) {
      matchingColorList = personalColorModel.matching_color_array.split(",");
    }


    return Scaffold(
      backgroundColor: ColorResources.getHomeBg(context),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: CustomScrollView(
          physics: loggedIn
              ? AlwaysScrollableScrollPhysics()
              : NeverScrollableScrollPhysics(),
          slivers: [
            // App Bar
            CustomSliverAppBar("${getTranslated('RESULT_AT_TEST', context)}"),

            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Container(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${map["name"]}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff0123B4),
                              ),
                            ),
                            Text(
                              "${getTranslated('AI_TEST_RESULT', context)}",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${getTranslated('YOU', context)} ${season} ${seasonKor} ",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              " ${detailSeasonType}", //??????
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              " ${getTranslated('IS', context)}",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),

                        // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                        Center(
                          child: Text(
                            "${personalColorModel.description}",
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xffCCCCCC),
                            ),
                          ),
                        ),

                        // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                        Center(
                          child: Text(
                            "${personalColorModel.tag}",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xff0123B4),
                            ),
                          ),
                        ),
                        SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                        Container(
                          // height: MediaQuery.of(context).size.width * 0.598,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    for (var i = 0; i < 4; i++)
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 0, 26, 18),
                                        child: Container(
                                          height: 42.5,
                                          width: 42.5,
                                          decoration: BoxDecoration(
                                            color: Color(int.parse(
                                                'FF${matchingColorList[i].replaceAll('#', '')}',
                                                radix: 16)),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(50),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.width * 0.53,
                                width: MediaQuery.of(context).size.width * 0.53,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(230),
                                  ),
                                  color: Colors.lightGreenAccent,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(150.0),
                                  child: Image.file(
                                    File(
                                      widget.consultingModel.client_image,
                                    ),
                                    fit: BoxFit.cover,
                                    height: MediaQuery.of(context).size.width *
                                        0.85,
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    // color: Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    for (var i = 4; i < 8; i++)
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 0, 26, 18),
                                        child: Container(
                                          height: 42.5,
                                          width: 42.5,
                                          decoration: BoxDecoration(
                                            color: Color(int.parse(
                                                'FF${matchingColorList[i].replaceAll('#', '')}',
                                                radix: 16)),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(50),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                        Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 9, 0),
                              child: Image.asset(
                                Images.painting,
                                height:
                                    MediaQuery.of(context).size.width * 0.058,
                              ),
                            ),
                            Text(
                              "${seasonKor} ${detailSeasonType} ${getTranslated('PEOPLE_CAN_USE_BASICALLY', context)}",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                          child: Row(
                            children: [
                              for (var i = 8; i < 12; i++)
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Color(
                                        int.parse(
                                            'FF${matchingColorList[i].replaceAll('#', '')}',
                                            radix: 16),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),

                        SizedBox(height: Dimensions.MARGIN_SIZE_EXTRA_LARGE),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Container(
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
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                          7,
                                          0,
                                          15,
                                          0,
                                        ),
                                        child: Image.asset(
                                          Images.chk,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                        ),
                                      ),
                                      Text(
                                        "${seasonKor} ${detailSeasonType}",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(9, 0, 0, 0),
                                    child: Text(
                                      "${personalColorModel.description}",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(9, 0, 0, 0),
                                    child: Text(
                                      "${personalColorModel.tag}",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: Dimensions.MARGIN_SIZE_EXTRA_LARGE),

                        Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  color: Color(0xffFECB03),
                                ),
                                child: Center(
                                  child: Text(
                                    "${getTranslated('ONE', context)}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffEEEEEE),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "${getTranslated('FASHION', context)}",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 26),
                          child: Text(
                            "${personalColorModel.fashion}",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                        Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  color: Color(0xffFECB03),
                                ),
                                child: Center(
                                  child: Text(
                                    "${getTranslated('TWO', context)}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffEEEEEE),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "${getTranslated('HAIR', context)}",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 26),
                          child: Text(
                            "${personalColorModel.hair}",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Text(
                            "${getTranslated('IS_NOT_PRECISE', context)}",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff0123B4),
                            ),
                          ),
                        ),
                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 40.0,
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 0.0, 4.0, 0.0),
                                child: CustomElevatedButton(
                                  onTap: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (_) => ImageUploadPage()),
                                        (route) => false);
                                  },
                                  buttonText:
                                      "${getTranslated('DO_OVER', context)}",
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: Container(
                                  height: 40,
                                  child: CustomOutlinedButton(
                                    onTap: () async {
                                      // UserModel userModel = UserModel(
                                      //   id: map["id"],
                                      //   season: widget.season,
                                      //   detail_season_type: widget.detailSeasonType,
                                      // );
                                      //
                                      // await Provider.of<UserProvider>(context, listen: false).updateUser(userModel);
                                      //
                                      // ImageModel imageModel = ImageModel(
                                      //   user_id: map["id"],
                                      //   title: "user personal color data",
                                      //   content: "id : ${map["id"]}, name : ${map["name"]}, username : ${map["username"]}",
                                      //   path: widget.consultingModel.client_image,
                                      //   create_date: DateConverter.formatDate(DateTime.now()),
                                      // );
                                      //
                                      // await Provider.of<CustomImageProvider>(context, listen: false)
                                      //     .addImage(imageModel);

                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (_) => HomePage(),
                                          ),
                                          (route) => false);

                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ConsultantListScreen(),
                                        ),
                                      );
                                    },
                                    buttonText:
                                        "${getTranslated('CONSULT_WITH_CONSULTANT', context)}",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),

                        // FooterPage(),
                      ],
                    ),
                  ),
                  !loggedIn
                      ? Positioned(
                          // bottom: -220,
                          // width: MediaQuery.of(context).size.width,
                          // height: MediaQuery.of(context).size.height,
                          child: Align(
                            // alignment: Alignment.bottomLeft,
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 10.0,
                                sigmaY: 10.0,
                              ),
                              child: Container(),
                            ),
                          ),
                        )
                      : Container(),
                  !loggedIn
                      ? Positioned(
                          child: Container(
                            height: MediaQuery.of(context).size.height - 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "${getTranslated('FOR_RESULT', context)}",
                                  style: TextStyle(fontSize: 22),
                                ),
                                Text(
                                  "${getTranslated('NEED_TO_LOGIN', context)}",
                                  style: TextStyle(fontSize: 22),
                                ),
                                Container(
                                  width: 200,
                                  child: CustomOutlinedButton(
                                    onTap: () async {
                                      final value =
                                          await Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AuthScreen(initialPage: 1, consultingModel: widget.consultingModel),
                                        ),
                                      );

                                      setState(() {});
                                    },
                                    buttonText: "${getTranslated('LOGIN', context)}",
                                  ),
                                ),
                                SizedBox(
                                    height: Dimensions.PADDING_SIZE_OVER_LARGE),
                                FooterPage(),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FooterPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
