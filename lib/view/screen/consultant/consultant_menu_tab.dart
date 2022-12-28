import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';

import '../../../data/model/response/menu_model.dart';
import '../../../data/model/response/user_model.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/menu_provider.dart';
import '../../../util//app_constants.dart';
import '../../../util//images.dart';
import '../../basewidget/dialog/single_text_alertdialog.dart';
import 'consultant_calendar.dart';
import 'consultant_reserve_screen.dart';

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
  Widget buildMenu(MenuModel menuModel) {
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
                    child: Container(
                      child: FadeInImage.assetNetwork(
                        placeholder: Images.placeholder1,
                        image: menuModel.menu_image != null
                            ? AppConstants.BASE_URL + "/" + menuModel.menu_image
                            : AppConstants.BASE_URL +
                                "/upload/placeholder_1x1.png",
                        fit: BoxFit.cover,
                        // image: widget.userModel.title_image != null ? AppConstants.BASE_URL + "/" + widget.userModel.title_image : AppConstants.BASE_URL,
                        width: MediaQuery.of(context).size.width * 0.29,
                        //750 * ? = 216
                        height: MediaQuery.of(context).size.width * 0.29,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 16, 0, 0),
                      child: Text(
                        "${menuModel.menu_title}",
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        "${menuModel.menu_content}",
                        style: TextStyle(
                          color: Color(0xffcccccc),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text(
                        // "25,000원(3회 기준)",
                        "${menuModel.menu_amount}",
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Container(
                        width: 73,
                        height: 20,
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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var menu
            in Provider.of<MenuProvider>(context, listen: false).menuList)
          buildMenu(menu)
      ],
    );
  }
}
