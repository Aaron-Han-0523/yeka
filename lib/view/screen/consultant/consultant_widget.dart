import 'package:flutter/material.dart';
import 'package:yeka/helper/price_converter.dart';
import 'package:yeka/utill/app_constants.dart';
import 'package:yeka/utill/custom_themes.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/utill/images.dart';
import 'package:provider/provider.dart';
import '../../../data/model/response/consulting_model.dart';
import '../../../data/model/response/review_model.dart';
import '../../../localization/language_constrants.dart';
import 'consultant_detail_screen.dart';

class ConsultantWidget extends StatelessWidget {
  final ConsultingModel consultingModel;

  ConsultantWidget({@required this.consultingModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        // Navigator.push(
        //     context,
        //     PageRouteBuilder(
        //       transitionDuration: Duration(milliseconds: 1000),
        //       pageBuilder: (context, anim1, anim2) => ConsultantDetailPage(
        //           productModel: consultingModel, isCreateScreen: false),
        //     ));
      },
      child: Container(
        height: MediaQuery.of(context).size.width * 0.68,
        margin: EdgeInsets.fromLTRB(5,5,5,0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            height: MediaQuery.of(context).size.width / 2.5,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: FadeInImage.assetNetwork(
                placeholder: Images.placeholder1,
                fit: BoxFit.fitHeight,
                image: AppConstants.BASE_URL +
                    "/" +
                    (consultingModel.client_image ?? ""),
                // image: '${Provider.of<SplashProvider>(context,listen: false).baseUrls.bannerImageUrl}'
                //     '/${bannerProvider.mainBannerList[index].photo}',
                imageErrorBuilder: (c, o, s) =>
                    Image.asset(Images.placeholder_3x1, fit: BoxFit.fitHeight),
              ),

              // Image.asset(
              //   Images.review_img1,
              //   fit: BoxFit.fitHeight,
              //   // height: 35,
              // ),
            ),
          ), // process quotation 실견적 최종견적
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 90,
                    height: 20,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0,2,0,0),
                      child: Text(
                        consultingModel.client_name ?? '',
                        textAlign: TextAlign.center,
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,10,0, 10),
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
              SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),
              Text(
                consultingModel.create_date ?? '- 인천대학교',
                textAlign: TextAlign.center,
                style: robotoRegular.copyWith(
                  fontSize: Dimensions.FONT_SIZE_EXTRA_MORE_SMALL,
                  fontWeight: FontWeight.bold,
                ),
                // maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                consultingModel.consulting_title ?? '- 피부미용사자격증',
                textAlign: TextAlign.center,
                style: robotoRegular.copyWith(
                  fontSize: Dimensions.FONT_SIZE_EXTRA_MORE_SMALL,
                  fontWeight: FontWeight.bold,
                ),
                // maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                consultingModel.payment_date ?? '- 올댓뷰티아카데미',
                textAlign: TextAlign.center,
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
}
