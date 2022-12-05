import 'package:flutter/material.dart';
import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';

import 'consultant_reserve_screen.dart';

class ConsultantMenuWidget extends StatefulWidget {
  final bool isCreateScreen;

  const ConsultantMenuWidget({
    Key key,
    this.isCreateScreen = true,
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
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                child: Image.network(
                  // widget.reviewModel.attachedFilepath1,
                  // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                  'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F250AB44353D20E5036',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.23,
                  height: MediaQuery.of(context).size.width * 0.23,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  "톡으로 만나는 나만의 피부 진단 :)",
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 16,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    "나의 피부상태를 측정하고 진단결과를 통해 알아보는 피부 팩트체크!",
                    style: TextStyle(
                      color: Color(0xffcccccc),
                      fontSize: 12,
                    ),
                  ),
                ),
                Text(
                  "25,000원(3회 기준)",
                  style: TextStyle(
                    color: Color(0xffcccccc),
                    fontSize: 12,
                  ),
                ),
                Container(
                  width: 50,
                  child: CustomElevatedButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 500),
                            pageBuilder: (context, anim1, anim2) => ConsultantReserveScreen(),
                          ));
                    },
                    buttonText: '예약하기',
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
