import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yeka/helper/price_converter.dart';
import 'package:yeka/utill/app_constants.dart';
import 'package:yeka/utill/custom_themes.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/utill/images.dart';
import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';
import 'package:yeka/view/screen/mypage/mypage_consultant_result_write.dart';
import '../../../data/model/response/product_model.dart';
import '../../../localization/language_constrants.dart';
import 'mypage_calendar.dart';

class MyPageClientWidget extends StatelessWidget {
  final ProductModel productModel;

  MyPageClientWidget({@required this.productModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        // reviewModel.custom1 =
        //     (int.parse(reviewModel.custom1 ?? "0") + 1).toString();
        // // reviewModel.carInfo_id = 1;
        //
        // Provider.of<ReviewProvider>(context, listen: false)
        //     .updateReview(reviewModel);

        // Navigator.push(
        //   context,
        //   PageRouteBuilder(
        //     transitionDuration: Duration(milliseconds: 1000),
        //     pageBuilder: (context, anim1, anim2) => ProductDetailPage(
        //         reviewModel: reviewModel, isCreateScreen: false),
        //   ),
        // );
      },
      child: Container(
        height: MediaQuery.of(context).size.width / 1.4,
        // width: 300,
        margin: EdgeInsets.all(5),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            height: MediaQuery.of(context).size.width / 2.5,
            // width: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: FadeInImage.assetNetwork(
                placeholder: Images.placeholder1,
                fit: BoxFit.fitHeight,
                image: AppConstants.BASE_URL +
                    "/" +
                    (productModel.tag ?? ""),
                // image: '${Provider.of<SplashProvider>(context,listen: false).baseUrls.bannerImageUrl}'
                //     '/${bannerProvider.mainBannerList[index].photo}',
                imageErrorBuilder: (c, o, s) => Image.asset(
                  Images.placeholder_3x1,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '정하윤',
                          textAlign: TextAlign.center,
                          style: robotoRegular.copyWith(
                            fontSize: 11,
                          ),
                        ),
                        Text(
                          '${getTranslated('CUSTOMER', context)}',
                          textAlign: TextAlign.center,
                          style: robotoRegular.copyWith(
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${getTranslated('WAITING_FOR_DEPOSIT', context)}',
                      textAlign: TextAlign.center,
                      style: robotoRegular.copyWith(
                        fontSize: 9,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      productModel.tag ?? '${getTranslated('COUNSELING_NAME', context)}',
                      textAlign: TextAlign.center,
                      style: robotoRegular.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      // maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      productModel.tag ?? '피부 ? 나한테 모든지 물어봐 !',
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
                Row(
                  children: [
                    Text(
                      productModel.tag ?? '${getTranslated('CONTACT_US', context)}',
                      textAlign: TextAlign.center,
                      style: robotoRegular.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      // maxLines: 2,
                    ),
                    Text(
                      productModel.tag ?? '010-0000-0000',
                      textAlign: TextAlign.center,
                      style: robotoRegular.copyWith(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 5,
                  thickness: 1,
                  indent: 180,
                  endIndent: 180,
                  color: Colors.black12,
                ),
                Row(
                  children: [
                    Text(
                      productModel.tag ?? '${getTranslated('WAITING_FOR_THE_CALL_TO_PROCEED', context)}',
                      textAlign: TextAlign.center,
                      style: robotoRegular.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      // maxLines: 2,
                    ),
                    Container(
                      width: 80,
                      child:
                      productModel.tag??Random().nextInt(2) == 1?
                      CustomElevatedButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 1000),
                              pageBuilder: (context, anim1, anim2) => MyPageCalendarScreen(),
                            ),
                          );
                        },
                        buttonText: '',
                        child: Text(
                          "${getTranslated('SELECT_CONSULTATION_DAY', context)}",
                          style: TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ):
                      CustomElevatedButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 1000),
                              pageBuilder: (context, anim1, anim2) => MyPageConsultantResultWriteScreen(),
                            ),
                          );
                        },
                        buttonText: '',
                        child: Text(
                          "${getTranslated('FILL_IN_CONSULTATION_RESULT', context)}",
                          style: TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ),
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
