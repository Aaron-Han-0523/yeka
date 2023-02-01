import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';
import 'package:yeka/data/model/response/menu_model.dart';
import 'package:yeka/util/color_resources.dart';
import 'package:yeka/util/dimensions.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';

import '../../../data/model/response/image_model.dart';
import '../../../data/model/response/user_model.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/image_provider.dart';
import '../../../provider/menu_provider.dart';
import '../../../util//app_constants.dart';
import '../../../util/images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
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
  TabController _tabController;

  PageController _controller = PageController();

  Future<void> _loadData(BuildContext context, bool reload) async {
    ImageModel imageModel = ImageModel(
      consultant_id: widget.userModel.id,
    );

    await Provider.of<CustomImageProvider>(context, listen: false)
        .getImageListByConsultantId(imageModel);

    MenuModel menuModel = MenuModel(consultant_id: widget.userModel.id);

    await Provider.of<MenuProvider>(context, listen: false)
        .getMenuList(menuModel, context);

  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    await _loadData(context, false);
  }

  Widget buildPage(String path) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: FadeInImage.assetNetwork(
          placeholder: Images.placeholder1,
          image: path != null
              ? AppConstants.BASE_URL + "/" + path
              : AppConstants.BASE_URL + "/uploads/placeholder_1x1.png",
          fit: BoxFit.fitHeight,
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.width * 0.9,
          imageErrorBuilder:
              (BuildContext context, Object exception, StackTrace stackTrace) {
            return Image.asset(
              Images.placeholder_1x1,
              fit: BoxFit.fitWidth,
              width: 30,
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _tabController = new TabController(length: 3, vsync: this);

    return Consumer<CustomImageProvider>(
      builder: (context, imageProvider, child) {
        List<ImageModel> imageList = imageProvider.imageList;
        List<Widget> consultantProfileItems = [];

        for (var image in imageList) {
          if (image.image_type == 2) {
            consultantProfileItems.add(buildPage(image.path));
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
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.width * 0.9,
                          child: PageView(
                            children: consultantProfileItems,
                            controller: _controller,
                          ),
                        ),
                        SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                        ScrollingPageIndicator(
                          dotColor: Colors.grey,
                          dotSelectedColor: Colors.deepPurple,
                          dotSize: 6,
                          dotSelectedSize: 8,
                          dotSpacing: 18,
                          controller: _controller,
                          itemCount: consultantProfileItems.length == 0
                              ? 1
                              : consultantProfileItems.length,
                          orientation: Axis.horizontal,
                        ),
                        SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
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
                          height: MediaQuery.of(context).size.width * 1.3,
                          // height: (Provider.of<MenuProvider>(context, listen: false).menuList.length * 150).toDouble(),
                          child: TabBarView(
                            controller: _tabController,
                            physics: ClampingScrollPhysics(),
                            children: [
                              ConsultantDetailWidget(
                                  userModel: widget.userModel),
                              ConsultantMenuWidget(userModel: widget.userModel),
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
          ),
        );
      },
    );
  }
}
