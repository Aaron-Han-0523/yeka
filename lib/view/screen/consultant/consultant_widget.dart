import 'package:flutter/material.dart';
import 'package:yeka/helper/price_converter.dart';
import 'package:yeka/utill/app_constants.dart';
import 'package:yeka/utill/custom_themes.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/utill/images.dart';
import 'package:provider/provider.dart';
import '../../../data/model/response/review_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/review_provider.dart';
import 'consultant_detail_screen.dart';

class ConsultantWidget extends StatelessWidget {
  final ReviewModel reviewModel;

  ConsultantWidget({@required this.reviewModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        reviewModel.custom1 =
            (int.parse(reviewModel.custom1 ?? "0") + 1).toString();
        // reviewModel.carInfo_id = 1;

        Provider.of<ReviewProvider>(context, listen: false)
            .updateReview(reviewModel);

        Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 1000),
              pageBuilder: (context, anim1, anim2) => ConsultantDetailPage(
                  reviewModel: reviewModel, isCreateScreen: false),
            ));
      },
      child: Container(
        height: MediaQuery.of(context).size.width / 1.64,
        margin: EdgeInsets.all(5),
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
                    (reviewModel.attachedFilepath1 ?? ""),
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
          Container(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      reviewModel.title ?? '',
                      textAlign: TextAlign.center,
                      style: robotoRegular.copyWith(
                        fontSize: Dimensions.FONT_SIZE_DEFAULT,
                        fontWeight: FontWeight.bold,
                      ),
                      // maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${getTranslated('CERTIFICATE_CONSULTANT', context)}",
                      textAlign: TextAlign.center,
                      style: robotoRegular.copyWith(
                          fontSize: Dimensions.FONT_SIZE_SMALL,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffcccccc)),
                      // maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const Divider(
                  height: 3,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                  color: Color(0XFFCCCCCC),
                ),
                Text(
                  reviewModel.custom2 ?? '- 인천대학교',
                  textAlign: TextAlign.center,
                  style: robotoRegular.copyWith(
                    fontSize: Dimensions.FONT_SIZE_EXTRA_MORE_SMALL,
                    fontWeight: FontWeight.bold,
                  ),
                  // maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  reviewModel.custom2 ?? '- 피부미용사자격증',
                  textAlign: TextAlign.center,
                  style: robotoRegular.copyWith(
                    fontSize: Dimensions.FONT_SIZE_EXTRA_MORE_SMALL,
                    fontWeight: FontWeight.bold,
                  ),
                  // maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  reviewModel.custom2 ?? '- 올댓뷰티아카데미',
                  textAlign: TextAlign.center,
                  style: robotoRegular.copyWith(
                    fontSize: Dimensions.FONT_SIZE_EXTRA_MORE_SMALL,
                    fontWeight: FontWeight.bold,
                  ),
                  // maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
