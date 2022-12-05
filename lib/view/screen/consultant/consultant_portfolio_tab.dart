import 'package:flutter/material.dart';

import '../../../utill/dimensions.dart';
import '../../basewidget/button/custom_elevated_button.dart';

class ConsultantPortfolioWidget extends StatefulWidget {
  final bool isCreateScreen;

  const ConsultantPortfolioWidget({
    Key key,
    this.isCreateScreen = true,
  }) : super(key: key);

  @override
  State<ConsultantPortfolioWidget> createState() => _ConsultantPortfolioWidgetState();
}

class _ConsultantPortfolioWidgetState extends State<ConsultantPortfolioWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              child: Container(
                child: Image.network(
                  // widget.reviewModel.attachedFilepath1,
                  // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                  'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F250AB44353D20E5036',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
                ),
              ),
            ),
            ClipRRect(
              child: Container(
                child: Image.network(
                  // widget.reviewModel.attachedFilepath1,
                  // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                  'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F250AB44353D20E5036',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
                ),
              ),
            ),
            ClipRRect(
              child: Container(
                child: Image.network(
                  // widget.reviewModel.attachedFilepath1,
                  // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                  'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F250AB44353D20E5036',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              child: Container(
                child: Image.network(
                  // widget.reviewModel.attachedFilepath1,
                  // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                  'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F250AB44353D20E5036',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
                ),
              ),
            ),
            ClipRRect(
              child: Container(
                child: Image.network(
                  // widget.reviewModel.attachedFilepath1,
                  // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                  'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F250AB44353D20E5036',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
                ),
              ),
            ),
            ClipRRect(
              child: Container(
                child: Image.network(
                  // widget.reviewModel.attachedFilepath1,
                  // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                  'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F250AB44353D20E5036',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.3,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomElevatedButton(
            onTap: null,
            buttonText: '더보기 ∨',
          ),
        ),
      ],
    );
  }
}
