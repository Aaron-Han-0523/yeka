import 'package:flutter/material.dart';
import 'package:yeka/helper/price_converter.dart';
import 'package:yeka/utill/app_constants.dart';
import 'package:yeka/utill/custom_themes.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/utill/images.dart';
import 'package:provider/provider.dart';
import '../../../data/model/response/review_model.dart';
import '../../../provider/review_provider.dart';
import 'product_detail_screen.dart';

class ProductWidget extends StatelessWidget {
  final ReviewModel reviewModel;

  ProductWidget({@required this.reviewModel});

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
            pageBuilder: (context, anim1, anim2) => ProductDetailPage(
                reviewModel: reviewModel, isCreateScreen: false),
          ),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.width / 1.4,
        margin: EdgeInsets.all(5),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Stack(
            children: [
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
                    imageErrorBuilder: (c, o, s) => Image.asset(
                      Images.placeholder_3x1,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(
                    6.0,
                    2.0,
                    6.0,
                    2.0,
                  ),
                  margin: const EdgeInsets.fromLTRB(
                    6.0,
                    2.0,
                    6.0,
                    2.0,
                  ),
                  decoration: BoxDecoration(
                      // color: Colors.grey,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Image.asset(
                    Images.heart,
                    height: 20,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(
                        6.0,
                        2.0,
                        6.0,
                        2.0,
                      ),
                      margin: const EdgeInsets.fromLTRB(
                        6.0,
                        2.0,
                        6.0,
                        2.0,
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xff000000),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                        "Test",
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(
                        6.0,
                        2.0,
                        6.0,
                        2.0,
                      ),
                      margin: const EdgeInsets.fromLTRB(
                        6.0,
                        2.0,
                        6.0,
                        2.0,
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xff000000),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                        "Test11",
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(
                        6.0,
                        2.0,
                        6.0,
                        2.0,
                      ),
                      margin: const EdgeInsets.fromLTRB(
                        6.0,
                        2.0,
                        6.0,
                        2.0,
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xff000000),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                        "Test222333",
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ), // process quotation 실견적 최종견적
          Container(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '[블랑]비비크림',
                  textAlign: TextAlign.center,
                  style: robotoRegular.copyWith(
                    fontSize: Dimensions.FONT_SIZE_DEFAULT,
                    fontWeight: FontWeight.bold,
                  ),
                  // maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        reviewModel.custom2 ?? '마르지 않는 피부의 비밀마르지안는',
                        textAlign: TextAlign.center,
                        style: robotoRegular.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        // maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      reviewModel.custom2 ?? '25,000원',
                      textAlign: TextAlign.center,
                      style: robotoRegular.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      // maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
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
