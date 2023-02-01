import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeka/data/model/response/user_model.dart';
import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';

import '../../../data/model/response/consulting_model.dart';
import '../../../data/model/response/image_model.dart';
import '../../../data/model/response/menu_model.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/image_provider.dart';
import '../../../util//app_constants.dart';
import '../../../util//color_resources.dart';
import '../../../util//dimensions.dart';
import '../../../util//images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../home/widget/footer_screens.dart';
import 'consultant_payment_screen.dart';

class ConsultantMyReserveScreen extends StatefulWidget {
  final bool isCreateScreen;
  final UserModel userModel;
  final MenuModel menuModel;
  final ConsultingModel consultingModel;

  const ConsultantMyReserveScreen({
    Key key,
    this.isCreateScreen = true,
    this.userModel,
    this.consultingModel,
    this.menuModel,
  }) : super(key: key);

  @override
  State<ConsultantMyReserveScreen> createState() =>
      _ConsultantMyReserveScreenState();
}

class _ConsultantMyReserveScreenState extends State<ConsultantMyReserveScreen>
    with TickerProviderStateMixin {
  Future<void> _loadData(BuildContext context, bool reload) async {
    ImageModel imageModel = ImageModel(
      consultant_id: widget.userModel.id,
    );

    await Provider.of<CustomImageProvider>(context, listen: false)
        .getImageListByConsultantId(imageModel);

    await Provider.of<CustomImageProvider>(context, listen: false)
        .getImageListByConsultantId(imageModel);
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    await _loadData(context, false);
  }

  Widget buildPage(String path) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: 340,
          child: FadeInImage.assetNetwork(
            placeholder: Images.placeholder1,
            image: widget.userModel != null
                ? AppConstants.BASE_URL + "/" + path
                : AppConstants.BASE_URL + "/placeholder_1x1.png",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * 0.89333,
            height: MediaQuery.of(context).size.width * 0.89333,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  "${getTranslated('MY_RESERVATION', context)}",
                ),

                SliverToBoxAdapter(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    // width: MediaQuery.of(context).size.width + 100,
                    decoration: BoxDecoration(color: Colors.white),
                    // constraints: BoxConstraints(
                    //     minHeight: MediaQuery.of(context).size.height * 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Divider(
                          height: 2,
                          color: Color(0xff666666),
                          indent: 0,
                          endIndent: 0,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 19, 0, 0),
                                  child: Text(
                                    "${getTranslated('HELLO_CUSTOMER', context)}",
                                    style: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${getTranslated('GRADATION_INFO', context)}",
                                        style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        "${getTranslated('CONSULTING', context)}",
                                        style: TextStyle(
                                          color: Color(0xff0123b4),
                                          fontSize: 22,
                                        ),
                                      ),
                                      Text(
                                        "${getTranslated('IS', context)}",
                                        style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 23, 0, 30),
                                  child: Text(
                                    "${getTranslated('MEET_MY_CONSULTANT', context)}",
                                    style: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      62.0, 0.0, 0.0, 38.0),
                                  child: InkWell(
                                    onTap: () => {
                                      // Navigator.of(context).push(MaterialPageRoute(
                                      //     builder: (context) => AuthScreen()))
                                    },
                                    child: Image.asset(
                                      Images.user,
                                      height: 64,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 15),
                          child: Text(
                            "${getTranslated('MY_CONSULTANT_INFO', context)}",
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        consultantProfileItems[0],
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 0, 9),
                          child: Text(
                            "${widget.userModel.hashtag}" ?? "",
                            style: TextStyle(
                              color: Color(0xff0123B4),
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 5, 16),
                              child: Text(
                                "${widget.userModel.name}" ?? "",
                                style: TextStyle(
                                  color: Color(0xff121212),
                                  fontSize: 22,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 14),
                              child: Text(
                                "${getTranslated('CERTIFICATE_CONSULTANT', context)}",
                                style: TextStyle(
                                  color: Color(0xffcccccc),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Table(
                          border: TableBorder.all(color: Colors.white),
                          columnWidths: {
                            0: FixedColumnWidth(130),
                            1: FlexColumnWidth(),
                          },
                          children: [
                            TableRow(
                              children: [
                                Container(
                                  // height: 32,
                                  // color: Colors.green,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 0, 54, 14.5),
                                    child: Text(
                                      "${getTranslated('CONTACT_US', context)}",
                                      style: TextStyle(
                                        color: Color(0xffbbbbbb),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  // height: 32,
                                  // color: Colors.red,
                                  child: Text(
                                    "${widget.userModel.phone}" ?? "",
                                    style: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Container(
                                  // height: 32,
                                  // color: Colors.green,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 4, 64, 12),
                                    child: Text(
                                      "${getTranslated('REGION', context)}",
                                      style: TextStyle(
                                        color: Color(0xffbbbbbb),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  // height: 32,
                                  // color: Colors.red,
                                  child: Text(
                                    "${widget.userModel.address2}" ?? "",
                                    style: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 4, 64, 35),
                                    child: Text(
                                      "${getTranslated('ADDRESS', context)}",
                                      style: TextStyle(
                                        color: Color(0xffbbbbbb),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "${widget.userModel.address2} ${widget.userModel.address3}" ??
                                        "",
                                    style: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 4, 54, 18),
                                    child: Text(
                                      "${getTranslated('RESERVATION_DATE', context)}",
                                      style: TextStyle(
                                        color: Color(0xffbbbbbb),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "${widget.consultingModel.reservation_date}" ??
                                        "",
                                    style: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 4, 7.5, 153),
                                    child: Text(
                                      "${getTranslated('CERTIFICATE_RESUME', context)}",
                                      style: TextStyle(
                                        color: Color(0xffbbbbbb),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (var text
                                        in (widget.userModel.resume ?? "")
                                            .split("\\n"))
                                      Text(
                                        text,
                                        style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 14,
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 0, 13.5, 16),
                                    child: Text(
                                      "${getTranslated('COMPANY_REGISTRATION_NUMBER', context)}",
                                      style: TextStyle(
                                        color: Color(0xffbbbbbb),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "${widget.userModel.business_registration_number}" ??
                                        "",
                                    style: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(
                          height: 3,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                          color: Color(0xffDDDDDD),
                        ),
                        Row(
                            // decoration: BoxDecoration(color: Color(0xfff8f8f8)),
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 3, 3),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.asset(
                                    Images.error,
                                    height: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 9, 0, 10),
                                child: Text(
                                  "${getTranslated('PUSH_CONSULTANT_BUTTON', context)}",
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ]),
                        SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                        CustomElevatedButton(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => ConsultantPaymentScreen(
                                    userModel: widget.userModel,
                                    consultingModel: widget.consultingModel,
                                  ),
                                ),
                              );
                            },
                            buttonText:
                                "${getTranslated('CONSULTANT_COMPLETE', context)}"),
                        SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                        SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                        SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                        FooterPage(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
