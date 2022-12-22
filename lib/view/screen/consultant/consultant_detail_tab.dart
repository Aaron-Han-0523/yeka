import 'package:flutter/material.dart';

import '../../../data/model/response/user_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../utill/dimensions.dart';

class ConsultantDetailWidget extends StatefulWidget {
  final bool isCreateScreen;
  final UserModel userModel;

  const ConsultantDetailWidget({
    Key key,
    this.isCreateScreen = true, this.userModel,
  }) : super(key: key);

  @override
  State<ConsultantDetailWidget> createState() => _ConsultantDetailWidgetState();
}

class _ConsultantDetailWidgetState extends State<ConsultantDetailWidget>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(21, 10, 20, 0),
              child: Text(
                // "#피부관련전공  #전문과정수료  #블로그 운영",
                "${widget.userModel.hashtag ?? ""}",
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xff0123B4)
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(21, 0, 10, 10),
              child: Text(
                // "임 지 은",
                "${widget.userModel.name ?? ""}",
                style: TextStyle(
                  color: Color(0xff121212),
                  fontSize: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
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
        const Divider(
          height: 3,
          thickness: 1,
          indent: 21,
          endIndent: 21,
          color: Color(0xffcccccc),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 10, 0, 5),
              child: Text(
                "${getTranslated('DETAIL_INFO', context)}",
                style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        for (var text in (widget.userModel.resume ?? "").split("\\n"))
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(23, 0, 0, 0),
                child: Text(
                  //todo 테이블에 넣을 때 \n 라인 딜리미터를 넣어서 저장하면 보여줄 때 자동으로 줄 띄우기가 가능하다.
                  // "- 인천대학교 메이크업아티스트 학과 전공",
                  text,
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
        const Divider(
          height: 3,
          thickness: 1,
          indent: 21,
          endIndent: 21,
          color: Color(0xffcccccc),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 15, 0, 5),
              child: Text(
                "${getTranslated('CONSULTATION_AVAILABLE_TIME', context)}",
                style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        for (var text in (widget.userModel.working_hour ?? "").split("\\n"))
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(23, 0, 0, 0),
                child: Text(
                  "${text}",
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        const Divider(
          height: 3,
          thickness: 1,
          indent: 21,
          endIndent: 21,
          color: Color(0xffcccccc),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 15, 0, 0),
              child: Text(
                "${getTranslated('PLACE_OF_BUSINESS', context)}",
                style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 5, 0, 0),
              child: Text(
                "${widget.userModel.address1} ${widget.userModel.address2} ${widget.userModel.address3}",
                style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
