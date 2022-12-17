
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yeka/utill/color_resources.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';

import '../../../data/model/response/image_model.dart';
import '../../../data/model/response/user_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/image_provider.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../home/home_screens.dart';

import 'consultant_detail_tab.dart';
import 'consultant_menu_tab.dart';
import 'consultant_portfolio_tab.dart';

class ConsultantDetailPage extends StatefulWidget {
  final bool isCreateScreen;
  final UserModel userModel;

  const ConsultantDetailPage(
      {Key key, this.isCreateScreen = true, this.userModel})
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

  Future<void> _loadData(BuildContext context, bool reload) async {
    ImageModel imageModel = ImageModel(
      consultant_id: widget.userModel.id,
    );

    Provider.of<CustomImageProvider>(context, listen: false)
        .getImageListByConsultantId(imageModel);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadData(context, false);

    _tabController = new TabController(length: 3, vsync: this);

    contentController = TextEditingController(
      text: "${getTranslated('CONTENTS_HINT', context)}",
    );

    if (widget.isCreateScreen == false) {
      // titleController.text = widget.consultingModel.title;
      // contentController.text = widget.consultingModel.content;
      // gradeController.text = widget.consultingModel.grade.toString();
    } else {
      titleController.text = '';
      contentController.text = '';
      gradeController.text = '0';
    }
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
              CustomSliverAppBar(
                "${getTranslated('CONSULTANT_DETAIL_INFO', context)}",
              ),
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
                          child: FadeInImage.assetNetwork(
                            placeholder: Images.placeholder1,
                            image: widget.userModel.title_image != null ? AppConstants.BASE_URL + "/" + widget.userModel.title_image : AppConstants.BASE_URL + "/upload/placeholder_1x1.png",
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
                        // indicatorColor: Color(0xff333333),
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
                            ConsultantMenuWidget(userModel : widget.userModel),
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
