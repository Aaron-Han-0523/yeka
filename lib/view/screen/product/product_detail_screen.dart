import 'package:flutter/material.dart';

import 'package:yeka/utill/color_resources.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import 'package:yeka/view/screen/product/product_shipping_screen.dart';

import '../../../data/model/response/review_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../utill/images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/dropdown/CustomDropdownButton2.dart';
import '../home/home_screens.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

class ProductDetailPage extends StatefulWidget {
  final bool isCreateScreen;
  final ReviewModel reviewModel;

  const ProductDetailPage(
      {Key key, this.isCreateScreen = true, this.reviewModel})
      : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with TickerProviderStateMixin {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController gradeController = TextEditingController();

  // int grade = 0;
  PageController _controller = PageController();

  @override
  void initState() {
    super.initState();

    // _controller = PageController();
  }

  Widget buildPage(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        // width: MediaQuery.of(context).size.width * 0.6,
        // height: MediaQuery.of(context).size.width * 0.6,
        child: Image.network(
          // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
          'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F250AB44353D20E5036',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  int _itemCount = 0;

  var dongDropdownItems = ["c", "D"];

  @override
  Widget build(BuildContext context) {
    contentController = TextEditingController(
      text: "${getTranslated('CONTENTS_HINT', context)}",
    );

    if (widget.isCreateScreen == false) {
      titleController.text = widget.reviewModel.title;
      contentController.text = widget.reviewModel.content;
      gradeController.text = widget.reviewModel.grade.toString();
    } else {
      titleController.text = '';
      contentController.text = '';
      gradeController.text = '0';
    }

    List<Widget> items = [
      buildPage("0", Colors.red),
      buildPage("1", Colors.blue),
      buildPage("2", Colors.green),
      buildPage("3", Colors.amber),
      buildPage("4", Colors.deepPurple),
      buildPage("5", Colors.teal),
      buildPage("6", Colors.pink),
      buildPage("7", Colors.brown)
    ];

    return Scaffold(
        backgroundColor: ColorResources.getHomeBg(context),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar
              CustomSliverAppBar(
                "${getTranslated('REVIEW_WRITE', context)}",
              ).getAppbar(),

              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width + 100,
                  // decoration: BoxDecoration(color: Colors.white),
                  decoration: BoxDecoration(
                    color: Color(0xffcfcbc3),
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                      SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),

                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.width * 0.8,
                        child: PageView(
                          children: items,
                          controller: _controller,
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      ScrollingPageIndicator(
                        dotColor: Colors.grey,
                        dotSelectedColor: Colors.deepPurple,
                        dotSize: 6,
                        dotSelectedSize: 8,
                        dotSpacing: 18,
                        controller: _controller,
                        itemCount: items.length,
                        orientation: Axis.horizontal,
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                      Stack(
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            // margin: const EdgeInsets.all(8.0),
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(100.0)),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 15, 0, 0),
                                  child: Text(
                                    "광합성 100% 함유된 알로에 마스크! 피부에 양보하세요 :)",
                                    style: TextStyle(
                                      color: Color(0xFF999999),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text(
                                    "[ALOS] 마스크팩 3입",
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 10, 0, 0),
                                  child: Text(
                                    "8,000 원",
                                    style: TextStyle(
                                      color: Color(0xFF0123B4),
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 20, 0, 5),
                                  child: Text(
                                    "상품설명",
                                    style: TextStyle(
                                      color: Color(0xFF333333),
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 4, 0),
                                  child: Text(
                                    "피부는 우리의 생활 그 자체로써, 우리가 먹는 것, 우리가 생활하는 방식이 바로 우리의 피부입니다. "
                                    "하루에 한 번 마스크팩을 사용하여 숙면을 취하는게 중요하다 는 이야기를 드리고 싶다. "
                                    "식생활과 생활습관이 바뀌어야 우리의 피부도 속에서부 터의 근본적 변화가 가능하다. "
                                    "하지만 저희 ALOS 마스크팩은 팩 수분내에 단백 질 함유가 내장되어 있어, 식습관에 관여하지 않고 탄탄하고 매끄러운 피부를 가 지실 수 있습니다.",
                                    style: TextStyle(
                                      color: Color(0xFF333333),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 25, 12, 0),
                                      child: Card(
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                "수량",
                                                style: TextStyle(
                                                  color: Color(0xFF999999),
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            _itemCount != 0
                                                ? IconButton(
                                                    icon: Icon(Icons.remove),
                                                    onPressed: () => setState(
                                                        () => _itemCount--),
                                                  )
                                                : IconButton(
                                                    icon: Icon(Icons.remove),
                                                    onPressed: null,
                                                  ),
                                            Text(_itemCount.toString()),
                                            IconButton(
                                              icon: Icon(Icons.add),
                                              onPressed: () =>
                                                  setState(() => _itemCount++),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(20, 25, 0, 0),
                                      child: Card(
                                        child: CustomDropdownButton2(
                                          hint:
                                              '${getTranslated('SELECT_ORDER', context)}',
                                          icon: const Icon(
                                              Icons.keyboard_arrow_down),
                                          iconSize: Dimensions.ICON_SIZE_DEFAULT,
                                          dropdownItems: dongDropdownItems,
                                          // value: "",
                                          onChanged: (value) {
                                            // setState(() {
                                            //   receiveTimeEnd = value + "";
                                            // });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  // alignment: Alignment.centerRight,
                                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 10.0, 8.0, 0.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.0)),
                                    color: Color(0xfff7f7f7),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                                            child: Text(
                                              "색상 및 종류",
                                              style: TextStyle(
                                                color: Color(0xFF333333),
                                                fontSize: 8,
                                              ),
                                            ),
                                          ),
                                          CustomDropdownButton2(
                                            hint:
                                                '${getTranslated('SELECT_ORDER', context)}',
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            iconSize:
                                                Dimensions.ICON_SIZE_DEFAULT,
                                            dropdownItems: dongDropdownItems,
                                            // value: "",
                                            onChanged: (value) {
                                              // setState(() {
                                              //   receiveTimeEnd = value + "";
                                              // });
                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                                            child: Text(
                                              "유분크림함유(유, 무 중 택1)",
                                              style: TextStyle(
                                                color: Color(0xFF333333),
                                                fontSize: 8,
                                              ),
                                            ),
                                          ),
                                          CustomDropdownButton2(
                                            hint:
                                                '${getTranslated('SELECT_ORDER', context)}',
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            iconSize:
                                                Dimensions.ICON_SIZE_DEFAULT,
                                            dropdownItems: dongDropdownItems,
                                            // value: "",
                                            onChanged: (value) {
                                              // setState(() {
                                              //   receiveTimeEnd = value + "";
                                              // });
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                                      child: Text(
                                        "배송비",
                                        style: TextStyle(
                                          color: Color(0xFF999999),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 6, 15, 5),
                                      child: Text(
                                        "+ 2,500 원",
                                        style: TextStyle(
                                          color: Color(0xFF333333),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  height: 5,
                                  thickness: 1,
                                  indent: 12,
                                  endIndent: 12,
                                  color: Color(0xffdddddd),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                      child: Text(
                                        "최종결제금액",
                                        style: TextStyle(
                                          color: Color(0xFF999999),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 10, 15, 10),
                                      child: Text(
                                        "10,500 원",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                CustomElevatedButton(
                                  onTap: () async {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => ProductShippingPage(),
                                      ),
                                    );
                                  },
                                  buttonText: "주문하러 가기",
                                ),
                                SizedBox(
                                  height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 25),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Container(
                                      child: Image.network(
                                        // widget.reviewModel.attachedFilepath1,
                                        // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                                        'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F250AB44353D20E5036',
                                        fit: BoxFit.cover,
                                        width: MediaQuery.of(context).size.width *
                                            0.9,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                1.5,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 40),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Container(
                                      child: Image.network(
                                        // widget.reviewModel.attachedFilepath1,
                                        // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                                        'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F250AB44353D20E5036',
                                        fit: BoxFit.cover,
                                        width: MediaQuery.of(context).size.width *
                                            0.9,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                1.2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 30,
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: Color(0xfff8f8f8),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffbbbbbb),
                                      offset: const Offset(0.0, 2.0),
                                      blurRadius: 0.0,
                                      spreadRadius: 0.0,
                                    )
                                  ]),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Container(
                                  child: Image.asset(
                                    Images.heart,
                                    // widget.reviewModel.attachedFilepath1,
                                    // 'http://52.78.243.91/uploads/review/839911410110111011510411111695504850504857495445495552544850-1663726448622.jpg',
                                    fit: BoxFit.cover,
                                    width: 20,
                                    // width: MediaQuery.of(context).size.width * 0.9,
                                    // height: MediaQuery.of(context).size.width * 0.9,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: Dimensions.PADDING_SIZE_OVER_LARGE),
                      FooterPage(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
