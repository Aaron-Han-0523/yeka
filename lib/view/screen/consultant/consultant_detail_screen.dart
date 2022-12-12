import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:yeka/utill/color_resources.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/utill/images.dart';
import 'package:yeka/view/basewidget/rating_bar.dart';
import 'package:yeka/view/basewidget/textarea/custom_textarea.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import 'package:provider/provider.dart';

import '../../../data/model/response/base/api_response.dart';
import '../../../data/model/response/clients_model.dart';
import '../../../data/model/response/process_model.dart';
import '../../../data/model/response/review_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/clients_provider.dart';
import '../../../provider/process_provider.dart';
import '../../../provider/review_provider.dart';
import '../../../utill/app_constants.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/textfield/custom_label_textfield.dart';
import '../home/home_screens.dart';
import 'package:image_picker/image_picker.dart';

import 'consultant_detail_tab.dart';
import 'consultant_menu_tab.dart';
import 'consultant_portfolio_tab.dart';

class ConsultantDetailPage extends StatefulWidget {
  final bool isCreateScreen;
  final ReviewModel reviewModel;

  const ConsultantDetailPage(
      {Key key, this.isCreateScreen = true, this.reviewModel})
      : super(key: key);

  @override
  State<ConsultantDetailPage> createState() => _ConsultantDetailPageState();
}

class _ConsultantDetailPageState extends State<ConsultantDetailPage>
    with TickerProviderStateMixin {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController gradeController = TextEditingController();

  // int grade = 0;
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    contentController = TextEditingController(
      text: "${getTranslated('CONTENTS_HINT', context)}",
    );

    if (widget.isCreateScreen == false) {
      titleController.text = widget.reviewModel.title;
      contentController.text = widget.reviewModel.content;
      gradeController.text = widget.reviewModel.grade.toString();
    } else {
      titleController.text = '';
      contentController.text = '';
      gradeController.text = '0';
    }

    return Scaffold(
        backgroundColor: ColorResources.getHomeBg(context),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar
              CustomSliverAppBar(
                "${getTranslated('CONSULTANT_DETAIL_INFO', context)}",
              ).getAppbar(),
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width + 100,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Divider(
                        height: 2,
                        color: Color(0xffDDDDDD),
                        indent: 0,
                        endIndent: 0,
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          child: Image.network(
                            // widget.reviewModel.attachedFilepath1,
                            // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                            'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F250AB44353D20E5036',
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.width * 0.9,
                          ),
                        ),
                      ),
                      // SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      !widget.isCreateScreen
                          ? Container()
                          : Container(
                              alignment: Alignment.centerRight,
                              margin: const EdgeInsets.all(8.0),
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0)),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomElevatedButton(
                                    onTap: () async {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                            builder: (_) => HomePage(),
                                          ),
                                          (route) => false);
                                    },
                                    buttonText:
                                        "${getTranslated('ENROLL', context)}",
                                  ),
                                  SizedBox( height: Dimensions.PADDING_SIZE_EXTRA_LARGE, ),
                                ],
                              ),
                            ),
                      // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      TabBar(
                        controller: _tabController,
                        unselectedLabelColor: Color(0xffdddddd),
                        indicatorColor: Color(0xff333333),
                        labelColor: Color(0xff333333),
                        tabs: [
                          Tab(
                            child: Text(
                              "${getTranslated('DETAIL_INFO', context)}",
                              style: TextStyle(
                              //   color: Color(0xff333333),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "${getTranslated('CONSULTATION_MENU', context)}",
                              style: TextStyle(
                                //   color: Color(0xff333333),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "${getTranslated('PORTFOLIO', context)}",
                              style: TextStyle(
                                //   color: Color(0xff333333),
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width * 1.2,
                        child: TabBarView(
                          controller: _tabController,
                          physics: BouncingScrollPhysics(),
                          children: [
                            ConsultantDetailWidget(),
                            ConsultantMenuWidget(),
                            ConsultantPortfolioWidget(),
                          ],
                        ),
                      ),

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
}
