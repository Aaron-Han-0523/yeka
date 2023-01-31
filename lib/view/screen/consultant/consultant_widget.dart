import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yeka/util/app_constants.dart';
import 'package:yeka/util/custom_themes.dart';
import 'package:yeka/util/dimensions.dart';
import 'package:yeka/util/images.dart';

import '../../../data/model/response/image_model.dart';
import '../../../data/model/response/user_model.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/image_provider.dart';
import '../../../provider/user_provider.dart';
import 'consultant_detail_screen.dart';

class ConsultantWidget extends StatelessWidget {
  final UserModel userModel;

  ConsultantWidget({@required this.userModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 1000),
              pageBuilder: (context, anim1, anim2) => ConsultantDetailPage(
                userModel: userModel,
                isCreateScreen: false,
              ),
            ));
      },
      child: Container(
        height: MediaQuery.of(context).size.width * 0.68,
        margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            height: MediaQuery.of(context).size.width / 2.5,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: FadeInImage.assetNetwork(
                placeholder: Images.placeholder1,
                fit: BoxFit.fitHeight,
                image: userModel.title_image != null
                    ? AppConstants.BASE_URL + "/" + userModel.title_image
                    : AppConstants.BASE_URL,
                // image: '${Provider.of<SplashProvider>(context,listen: false).baseUrls.bannerImageUrl}'
                //     '/${bannerProvider.mainBannerList[index].photo}',
                imageErrorBuilder: (c, o, s) =>
                    Image.asset(Images.placeholder_3x1, fit: BoxFit.fitHeight),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 108,
                    height: 30,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: Text(
                        userModel.name ?? '',
                        textAlign: TextAlign.start,
                        style: robotoRegular.copyWith(
                          fontSize: Dimensions.FONT_SIZE_LARGE,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 8.0,
                        ),
                        // maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text(
                      "${getTranslated('CERTIFICATE_CONSULTANT', context)}",
                      textAlign: TextAlign.center,
                      style: robotoRegular.copyWith(
                          fontSize: Dimensions.FONT_SIZE_SMALL,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffcccccc)),
                      // maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 3,
                thickness: 1,
                indent: 0,
                endIndent: 0,
                color: Color(0XFFDDDDDD),
              ),
              SizedBox(
                height: Dimensions.PADDING_SIZE_SMALL,
              ),
              for(int i=0; i<3; i++)
                Text(
                  "${text(i)}" != null ? "${text(i)}" : "",
                  style: robotoRegular.copyWith(
                    fontSize: Dimensions.FONT_SIZE_EXTRA_MORE_SMALL,
                    fontWeight: FontWeight.bold,
                  ),
                  // maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
            ],
          ),
        ]),
      ),
    );
  }
  text (int i) {
      List<String> list = [];
      for (var text in userModel.resume.split("\n")) {
        list.add(text);
      }
      return list[i] ?? "";
  }
}
