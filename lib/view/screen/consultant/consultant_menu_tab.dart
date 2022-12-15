import 'package:flutter/material.dart';
import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';

import '../../../data/model/response/user_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/images.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import 'consultant_reserve_screen.dart';

class ConsultantMenuWidget extends StatefulWidget {
  final bool isCreateScreen;
  final UserModel userModel;

  const ConsultantMenuWidget({
    Key key,
    this.isCreateScreen = true, this.userModel,
  }) : super(key: key);

  @override
  State<ConsultantMenuWidget> createState() => _ConsultantMenuWidgetState();
}

class _ConsultantMenuWidgetState extends State<ConsultantMenuWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0,0,0,15),
          child: Container(
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(23, 15, 0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      child: Image.network(
                      // FadeInImage.assetNetwork(
                      //   placeholder: Images.placeholder1,
                      //   fit: BoxFit.fitHeight,
                        "https://file.mk.co.kr/meet/neds/2022/05/image_readtop_2022_428511_16526107615043320.jpg",
                        // image: widget.userModel.title_image != null ? AppConstants.BASE_URL + "/" + widget.userModel.title_image : AppConstants.BASE_URL,
                        width: MediaQuery.of(context).size.width * 0.29, //750 * ? = 216
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
                        "톡으로 만나는 나만의 피부 진단 :)",
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
                        "나의 피부상태를 측정하고 진단결과를 통해 알아보는 피부 팩트체크!",
                        style: TextStyle(
                          color: Color(0xffcccccc),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text(
                        "25,000원(3회 기준)",
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
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: Duration(milliseconds: 500),
                                  pageBuilder: (context, anim1, anim2) => ConsultantReserveScreen(userModel: widget.userModel),
                                ));
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
}
