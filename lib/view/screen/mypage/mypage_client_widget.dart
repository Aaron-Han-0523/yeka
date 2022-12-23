import 'package:flutter/material.dart';
import 'package:yeka/utill/app_constants.dart';
import 'package:yeka/utill/custom_themes.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/utill/images.dart';
import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';
import '../../../data/model/response/consulting_model.dart';
import '../../../localization/language_constrants.dart';
import 'mypage_calendar.dart';
import 'mypage_consultant_result_write_screen.dart';

class MyPageClientWidget extends StatelessWidget {
  final ConsultingModel consultingModel;

  MyPageClientWidget({this.consultingModel});

  // FIXME 대표님 이부분은 에러가 생겨 작업하지 못했습니다.
  Widget paymentState(int paymentState) {
    String result = "";
    Color color = Colors.white;
    if (paymentState == 0) {
      result = "입금 대기";
      color = Color(0xffff0000);
    } else if (paymentState == 1) {
      result = "예약금 입금 완료";
      color = Color(0xffff9924);
    } else if (paymentState == 2) {
      result = "최종입금 완료";
      color = Color(0xff0123b4);
    }
    return Text(
      // '${getTranslated('WAITING_FOR_DEPOSIT', context)}',
      '${result}',
      textAlign: TextAlign.center,
      style: robotoRegular.copyWith(
        fontSize: 8,
        color: color,
      ),
    );
  }

  Widget consultingState(int consultingState, BuildContext context) {
    String result = "";
    Color color = Colors.white;
    String buttonText = "";
    Widget nextPage = Container();
    if (consultingState == 0) {
      result = "상담 진행 대기";
      color = Color(0xff3a9d6e);
      buttonText = "상담일 선택";
      nextPage = MyPageCalendarScreen(
        consultingModel: consultingModel,
      );
    } else if (consultingState == 1) {
      result = "상담 진행 중";
      color = Color(0xffff9924);
    } else if (consultingState == 2) {
      result = "상담 종료";
      color = Color(0xff0123b4);
      buttonText = "상담결과작성";
      nextPage = MyPageConsultantResultWriteScreen(
        consultingModel: consultingModel,
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${result}',
          textAlign: TextAlign.center,
          style: robotoRegular.copyWith(
            fontSize: 9,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        buttonText != ""
            ? CustomElevatedButton(
                width: 110,
                height: 17,
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 1000),
                      pageBuilder: (context, anim1, anim2) => nextPage,
                    ),
                  );
                },
                buttonText: '',
                child: Text(
                  "${buttonText}",
                  style: TextStyle(
                    fontSize: 8,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }

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
                image: consultingModel.client_image != null
                    ? AppConstants.BASE_URL + "/" + consultingModel.client_image
                    : AppConstants.BASE_URL,
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
            padding: EdgeInsets.fromLTRB(0.0, Dimensions.PADDING_SIZE_SMALL,
                0.0, Dimensions.PADDING_SIZE_SMALL),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 70,
                          child: Text(
                            '${consultingModel.client_name}',
                            textAlign: TextAlign.center,
                            style: robotoRegular.copyWith(
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          '${getTranslated('CUSTOMER', context)}',
                          textAlign: TextAlign.center,
                          style: robotoRegular.copyWith(
                            fontSize: 8,
                            color: Color(0xffcccccc),
                          ),
                        ),
                      ],
                    ),
                    paymentState(consultingModel.payment_status),
                  ],
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${getTranslated('COUNSELING_NAME', context)}',
                      textAlign: TextAlign.center,
                      style: robotoRegular.copyWith(
                        fontSize: 6,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffcccccc),
                      ),
                      // maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      consultingModel.consulting_title ?? '-',
                      textAlign: TextAlign.center,
                      style: robotoRegular.copyWith(
                        fontSize: 6,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffcccccc),
                      ),
                      // maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${getTranslated('CONTACT_US', context)}',
                      textAlign: TextAlign.center,
                      style: robotoRegular.copyWith(
                        fontSize: 6,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffcccccc),
                      ),
                      // maxLines: 2,
                    ),
                    Text(
                      consultingModel.client_phone ?? '010-0000-0000',
                      textAlign: TextAlign.center,
                      style: robotoRegular.copyWith(
                        fontSize: 6,
                        color: Color(0xffcccccc),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                const Divider(
                  height: 5,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.black12,
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                consultingState(consultingModel.consulting_status, context),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
