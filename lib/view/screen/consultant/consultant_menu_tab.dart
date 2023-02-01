import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';

import '../../../data/model/response/image_model.dart';
import '../../../data/model/response/menu_model.dart';
import '../../../data/model/response/user_model.dart';
import '../../../helper/price_converter.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/image_provider.dart';
import '../../../provider/menu_provider.dart';
import '../../../util//app_constants.dart';
import '../../../util//images.dart';
import '../../basewidget/dialog/single_text_alertdialog.dart';
import 'consultant_calendar.dart';

class ConsultantMenuWidget extends StatefulWidget {
  final bool isCreateScreen;
  final UserModel userModel;

  const ConsultantMenuWidget({
    Key key,
    this.isCreateScreen = true,
    this.userModel,
  }) : super(key: key);

  @override
  State<ConsultantMenuWidget> createState() => _ConsultantMenuWidgetState();
}

class _ConsultantMenuWidgetState extends State<ConsultantMenuWidget>
    with TickerProviderStateMixin {
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    ImageModel imageModel = ImageModel(
      consultant_id: widget.userModel.id,
    );

    await Provider.of<CustomImageProvider>(context, listen: false)
        .getImageListByConsultantId(imageModel);
  }

  Widget buildMenu(MenuModel menuModel, int count) {
    return Consumer<CustomImageProvider>(
        builder: (context, imageProvider, child) {
      List<ImageModel> imageList = imageProvider.imageList;
      List<String> imagePath = [];

      for (int i = 0; i < imageList.length; i++) {
        if (imageList[i].image_type == 4) {
          imagePath.add(imageList[i].path);
        }
      }

      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: Container(
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(23, 15, 0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: FadeInImage.assetNetwork(
                        placeholder: Images.placeholder1,
                        image: imagePath.length > 0
                            ? AppConstants.BASE_URL + "/" + imagePath[count]
                            : AppConstants.BASE_URL + "/placeholder_1x1.png",
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * 0.29,
                        height: MediaQuery.of(context).size.width * 0.29,
                        imageErrorBuilder: (BuildContext context,
                            Object exception, StackTrace stackTrace) {
                          return Image.asset(
                            Images.placeholder_1x1,
                            fit: BoxFit.fitWidth,
                            width: MediaQuery.of(context).size.width * 0.29,
                          );
                        },
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 16, 15, 0),
                        child: Text(
                          "${menuModel.menu_title ?? ""}",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          "${menuModel.menu_content ?? ""}",
                          style: TextStyle(
                            color: Color(0xffcccccc),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Text(
                          // "25,000원(3회 기준)",
                          "${PriceConverter.convertPrice(context, menuModel.menu_amount.toDouble() ?? "")} ${getTranslated('WON', context)}",
                          style: TextStyle(
                            color: Color(0xff333333),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Container(
                          width: 80,
                          height: 25,
                          child: CustomElevatedButton(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            backgroundColor: const Color(0XFF707070),
                            onTap: () {
                              if (Provider.of<AuthProvider>(context,
                                      listen: false)
                                  .isLoggedIn()) {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        Duration(milliseconds: 500),
                                    pageBuilder: (context, anim1, anim2) =>
                                        ConsultantCalendarScreen(
                                      menuModel: menuModel,
                                      userModel: widget.userModel,
                                    ),
                                  ),
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      SingleTextAlertDialog(
                                    message:
                                        "${getTranslated("HAVE_TO_LOGIN", context)}",
                                  ),
                                );
                              }
                            },
                            buttonText: '${getTranslated('RESERVE', context)}',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Color(0xffDDDDDD),
            indent: 20,
            endIndent: 20,
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var menuList = Provider.of<MenuProvider>(context, listen: false).menuList;
    return Column(
      children: [
        for (var i = 0; i < menuList.length; i++) buildMenu(menuList[i], i)
      ],
    );
  }
}
