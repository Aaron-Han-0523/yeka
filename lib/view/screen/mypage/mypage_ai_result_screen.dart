import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeka/data/model/response/image_model.dart';
import 'package:yeka/provider/image_provider.dart';
import 'package:yeka/util/color_resources.dart';
import 'package:yeka/util/dimensions.dart';
import 'package:yeka/view/basewidget/appbar/custom_sliver_app_bar.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';

import '../../../data/model/response/personal_color_model.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/personal_color_provider.dart';
import '../../../util//images.dart';
import '../../../util/app_constants.dart';
import '../../basewidget/button/custom_outlined_button.dart';
import '../home/home_screens.dart';
import '../product/product_list_screen.dart';

class MyPageAIResultPage extends StatefulWidget {
  const MyPageAIResultPage({
    Key key,
  }) : super(key: key);

  @override
  State<MyPageAIResultPage> createState() => _MyPageAIResultPageState();
}

class _MyPageAIResultPageState extends State<MyPageAIResultPage>
    with TickerProviderStateMixin {
  String name;
  PersonalColorModel personalColorModel;
  ImageModel imageModel;

  Future<void> _loadData(BuildContext context, bool reload) async {
    Map map = await Provider.of<AuthProvider>(context, listen: false).getUser();
    imageModel = ImageModel(user_id: map["id"], image_type: 5);

    name = map['name'];
    var season = map["season"];
    var detail_season_type = map["detail_season_type"];

    personalColorModel = PersonalColorModel(
      season: season,
      detail_season_type: detail_season_type,
    );
    personalColorModel =
        await Provider.of<PersonalColorProvider>(context, listen: false)
            .getPersonalColorCondition(personalColorModel);
    personalColorModel =
        await Provider.of<PersonalColorProvider>(context, listen: false)
            .personalColor;
    Provider.of<CustomImageProvider>(context, listen: false).getUserImage(imageModel);
    imageModel = Provider.of<CustomImageProvider>(context, listen: false).image;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await _loadData(context, false);
    setState(() {
      personalColorModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    var season = "";
    var seasonKor = "";
    var detailSeasonType = "";

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

    if (personalColorModel != null) {
      personalColorModel.season != null ? personalColorModel.season : -1;
      personalColorModel.detail_season_type != null
          ? personalColorModel.detail_season_type
          : -1;

      if (personalColorModel.season == 0) {
        season = "Spring";
        seasonKor = "봄";
        switch (personalColorModel.detail_season_type) {
          case 0:
            detailSeasonType = "라이트";
            break;
          case 1:
            detailSeasonType = "소프트";
            break;
          case 2:
            detailSeasonType = "브라이트";
            break;
        }
      } else if (personalColorModel.season == 1) {
        season = "Summer";
        seasonKor = "여름";
        switch (personalColorModel.detail_season_type) {
          case 0:
            detailSeasonType = "라이트";
            break;
          case 1:
            detailSeasonType = "뮤트";
            break;
          case 2:
            detailSeasonType = "브라이트";
            break;
        }
      } else if (personalColorModel.season == 2) {
        season = "Fall";
        seasonKor = "가을";
        switch (personalColorModel.detail_season_type) {
          case 0:
            detailSeasonType = "뮤트";
            break;
          case 1:
            detailSeasonType = "딥";
            break;
          case 2:
            detailSeasonType = "스트롱";
            break;
        }
      } else if (personalColorModel.season == 3) {
        season = "Winter";
        seasonKor = "겨울";
        switch (personalColorModel.detail_season_type) {
          case 0:
            detailSeasonType = "브라이트";
            break;
          case 1:
            detailSeasonType = "딥";
            break;
          case 2:
            detailSeasonType = "페일";
            break;
        }
      }

      if (personalColorModel.matching_color_array != null &&
          personalColorModel.matching_color_array.split(",").length > 11) {
        matchingColorList = personalColorModel.matching_color_array.split(",");
      }
    }

    return Scaffold(
      backgroundColor: ColorResources.getHomeBg(context),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            CustomSliverAppBar(
              "${getTranslated('RESULT_AT_TEST', context)}",
              isMyPageHidden: true,
            ),

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${name ?? ""}",
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
                          " ${detailSeasonType ?? ""}", //형광
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
                        "${personalColorModel != null ? personalColorModel.description : ""}",
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xffCCCCCC),
                        ),
                      ),
                    ),
                    // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    Center(
                      child: Text(
                        "${personalColorModel != null ? personalColorModel.tag : ""}",
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
                            height: MediaQuery.of(context).size.width * 0.53,
                            width: MediaQuery.of(context).size.width * 0.53,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(230),
                              ),
                              color: Colors.lightGreenAccent,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(150.0),
                              child: FadeInImage.assetNetwork(
                                placeholder: Images.placeholder1,
                                image: imageModel != null
                                    ? AppConstants.BASE_URL +
                                        "/" +
                                        imageModel.path
                                    : AppConstants.BASE_URL,
                                fit: BoxFit.cover,
                                width: 150,
                                height: 150,
                                imageErrorBuilder: (BuildContext context,
                                    Object exception, StackTrace stackTrace) {
                                  return Container(
                                    // padding: const EdgeInsets.all(10.0),
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(0xfff1f1f1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Image.asset(
                                        Images.upload,
                                      ),
                                    ),
                                  );
                                },
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
                            height: MediaQuery.of(context).size.width * 0.058,
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
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
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
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(7, 0, 15, 0),
                                    child: Image.asset(
                                      Images.chk,
                                      height:
                                          MediaQuery.of(context).size.width *
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
                                padding: const EdgeInsets.fromLTRB(9, 0, 0, 0),
                                child: Text(
                                  "${personalColorModel != null ? personalColorModel.description : ""}",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(9, 0, 0, 0),
                                child: Text(
                                  "${personalColorModel != null ? personalColorModel.tag : ""}",
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
                        "${personalColorModel != null ? personalColorModel.fashion : ""}",
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
                        "${personalColorModel != null ? personalColorModel.hair : ""}",
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Container(
                        height: 40,
                        child: CustomOutlinedButton(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (_) => HomePage()),
                                (route) => false);

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProductListScreen(),
                              ),
                            );
                          },
                          buttonText:
                              "${getTranslated('MY_GO_TO_PRODUCT', context)}",
                        ),
                      ),
                    ),

                    SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),

                    FooterPage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
