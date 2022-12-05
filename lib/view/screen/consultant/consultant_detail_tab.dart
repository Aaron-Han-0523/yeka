import 'package:flutter/material.dart';

class ConsultantDetailWidget extends StatefulWidget {
  final bool isCreateScreen;

  const ConsultantDetailWidget({
    Key key,
    this.isCreateScreen = true,
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
        Text(
          "#피부관련전공 #전문과정수료 #블로그 운영",
          // style: TextStyle(
          //   color: Color(0xff333333),
          // ),
        ),
        Row(
          children: [
            Text(
              "임지은",
              style: TextStyle(
                color: Color(0xff121212),
                fontSize: 22,
              ),
            ),
            Text(
              "컨설턴트",
              style: TextStyle(
                color: Color(0xffcccccc),
                fontSize: 14,
              ),
            ),
          ],
        ),
        const Divider(
          height: 3,
          thickness: 1,
          indent: 0,
          endIndent: 0,
          color: Colors.black,
        ),
        Text(
          "자격현황 및 이력",
          style: TextStyle(
            color: Color(0xff121212),
            fontSize: 16,
          ),
        ),
        Text(
          "- 인천대학교 메이크업아티스트 학과 전공",
          style: TextStyle(
            color: Color(0xff121212),
            fontSize: 12,
          ),
        ),
        Text(
          "- 인천대학교 메이크업아티스트 학과 전공",
          style: TextStyle(
            color: Color(0xff121212),
            fontSize: 12,
          ),
        ),
        Text(
          "- 인천대학교 메이크업아티스트 학과 전공",
          style: TextStyle(
            color: Color(0xff121212),
            fontSize: 12,
          ),
        ),
        Text(
          "- 인천대학교 메이크업아티스트 학과 전공",
          style: TextStyle(
            color: Color(0xff121212),
            fontSize: 12,
          ),
        ),
        Text(
          "- 인천대학교 메이크업아티스트 학과 전공",
          style: TextStyle(
            color: Color(0xff121212),
            fontSize: 12,
          ),
        ),
        Text(
          "- 인천대학교 메이크업아티스트 학과 전공",
          style: TextStyle(
            color: Color(0xff121212),
            fontSize: 12,
          ),
        ),
        Text(
          "- 인천대학교 메이크업아티스트 학과 전공",
          style: TextStyle(
            color: Color(0xff121212),
            fontSize: 12,
          ),
        ),
        const Divider(
          height: 3,
          thickness: 1,
          indent: 0,
          endIndent: 0,
          color: Colors.black,
        ),
        Text(
          "상담 가능 시간",
          style: TextStyle(
            color: Color(0xff121212),
            fontSize: 16,
          ),
        ),
        Text(
          "- 월요일 : 09:00 ~ 22:00",
          style: TextStyle(
            color: Color(0xff121212),
            fontSize: 12,
          ),
        ),
        Text(
          "- 수요일 : 09:00 ~ 22:00",
          style: TextStyle(
            color: Color(0xff121212),
            fontSize: 12,
          ),
        ),
        Text(
          "- 금요일 : 09:00 ~ 22:00",
          style: TextStyle(
            color: Color(0xff121212),
            fontSize: 12,
          ),
        ),
        const Divider(
          height: 3,
          thickness: 1,
          indent: 0,
          endIndent: 0,
          color: Colors.black,
        ),
        Text(
          "사업장 주소",
          style: TextStyle(
            color: Color(0xff121212),
            fontSize: 16,
          ),
        ),
        Text(
          "서울특별시 00구 0동 0000",
          style: TextStyle(
            color: Color(0xff121212),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
