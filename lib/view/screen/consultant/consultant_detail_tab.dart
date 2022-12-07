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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(21, 10, 20, 0),
              child: Text(
                "#피부관련전공  #전문과정수료  #블로그 운영",
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
                "임 지 은",
                style: TextStyle(
                  color: Color(0xff121212),
                  fontSize: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                "컨설턴트",
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
                "자격현황 및 이력",
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
              padding: const EdgeInsets.fromLTRB(23, 0, 0, 0),
              child: Text(
                "- 인천대학교 메이크업아티스트 학과 전공",
                style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 0, 0, 0),
              child: Text(
                "- 피부미용사자격증 1급",
                style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 0, 0, 0),
              child: Text(
                "- 올댓뷰티아카데미 피부관리강사 경력 6년",
                style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 0, 0, 0),
              child: Text(
                "- 베스트 공모전 입상",
                style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 0, 0, 0),
              child: Text(
                "- 올댓뷰티아카데미 전문교육 수료",
                style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 0, 0, 0),
              child: Text(
                "- YOUTUBE 개인 채널 운영",
                style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 0, 0, 15),
              child: Text(
                "- 피부관련 개인 블로그 운영",
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
              padding: const EdgeInsets.fromLTRB(23, 15, 0, 5),
              child: Text(
                "상담 가능 시간",
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
              padding: const EdgeInsets.fromLTRB(23, 0, 0, 0),
              child: Text(
                "- 월요일 : 09:00 ~ 22:00",
                style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 0, 0, 0),
              child: Text(
                "- 수요일 : 09:00 ~ 22:00",
                style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 0, 0, 15),
              child: Text(
                "- 금요일 : 09:00 ~ 22:00",
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
                "사업장 주소",
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
                "서울특별시 00구 0동 0000",
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
