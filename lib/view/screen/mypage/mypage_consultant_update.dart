import 'dart:io';

import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';

import 'package:yeka/utill/dimensions.dart';

import 'package:yeka/view/screen/home/widget/footer_screens.dart';
import '../../../localization/language_constrants.dart';
import '../../../utill/images.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/textarea/custom_textarea.dart';
import '../../basewidget/textfield/custom_label_textfield.dart';
import '../../basewidget/textfield/custom_textfield.dart';

class MyPageConsultantUpdateScreen extends StatefulWidget {
  @override
  State<MyPageConsultantUpdateScreen> createState() =>
      _MyPageConsultantUpdateScreenState();
}

class _MyPageConsultantUpdateScreenState
    extends State<MyPageConsultantUpdateScreen> {
  final ScrollController _scrollController = ScrollController();

  TextEditingController _firstNameController = TextEditingController();
  bool radioButton = false;
  List<String> thumbnailLists = [];
  List<String> thumbnailLists2 = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                CustomSliverAppBar(
                  "날짜 선택",
                ).getAppbar(),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "사진",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            "(선택)",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "원하는 사진을 올려보세요.",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              child: InkWell(
                                onTap: () async {
                                  thumbnailLists = [];

                                  List<Media> res = await ImagesPicker.pick(
                                    count: 5,
                                    pickType: PickType.all,
                                    language: Language.System,
                                    maxTime: 30,
                                    // maxSize: 500,
                                    cropOpt: CropOption(
                                      // aspectRatio: CropAspectRatio.wh16x9,
                                      cropType: CropType.circle,
                                    ),
                                  );
                                  print(res);
                                  if (res != null) {
                                    print(res.map((e) => e.path).toList());

                                    setState(() {
                                      thumbnailLists =
                                          res.map((e) => e.thumbPath).toList();
                                    });
                                    // bool status = await ImagesPicker.saveImageToAlbum(File(res[0]?.path));
                                    // print(status);
                                  }
                                },
                                child: Stack(
                                  children: [
                                    Positioned(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Container(
                                          padding: const EdgeInsets.all(10.0),
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Color(0xfff1f1f1),
                                          ),
                                          child: Image.asset(
                                            Images.upload,
                                            width: 30,
                                            height: 30,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          "${thumbnailLists.length ?? 0} / 5",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Color(0xff999999),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            for (var i = 0; i < thumbnailLists.length; i++)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.file(
                                  File(thumbnailLists[i]),
                                  fit: BoxFit.cover,
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                            for (var i = thumbnailLists.length; i < 5; i++)
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xfff1f1f1),
                                ),
                                child: Image.asset(
                                  Images.upload,
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Text(
                        "해시태그(#)",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xff999999),
                        ),
                      ),
                      Text(
                        "해시태그로 본인을 어필해보세요 :)",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xff999999),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: _firstNameController,
                              // essentialLabelText: " *",
                              hintText:
                                  "${getTranslated('HINT_NAME', context)}",
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              controller: _firstNameController,
                              // essentialLabelText: " *",
                              hintText:
                                  "${getTranslated('HINT_NAME', context)}",
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              controller: _firstNameController,
                              // essentialLabelText: " *",
                              hintText:
                                  "${getTranslated('HINT_NAME', context)}",
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: _firstNameController,
                              // essentialLabelText: " *",
                              hintText:
                                  "${getTranslated('HINT_NAME', context)}",
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              controller: _firstNameController,
                              // essentialLabelText: " *",
                              hintText:
                                  "${getTranslated('HINT_NAME', context)}",
                            ),
                          ),
                          Expanded(
                            child: CustomTextField(
                              controller: _firstNameController,
                              // essentialLabelText: " *",
                              hintText:
                                  "${getTranslated('HINT_NAME', context)}",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      CustomTextarea(
                        labelText: "자격현황 및 이력",
                        enabled: false,
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      CustomTextarea(
                        labelText: "상담 가능 시간",
                        enabled: false,
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "상담 메뉴",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Color(0xff999999),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "+ 추갸",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xff999999),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      CustomLabelTextField(
                        controller: _firstNameController,
                        // labelText: "상담 메뉴 ",
                        // essentialLabelText: " *",
                        hintText: "${getTranslated('HINT_NAME', context)}",
                      ),
                      CustomLabelTextField(
                        controller: _firstNameController,
                        // labelText: "상담 메뉴 ",
                        // essentialLabelText: " *",
                        hintText: "${getTranslated('HINT_NAME', context)}",
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextarea(
                              // labelText: "자격현황 및 이력",
                              enabled: false,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  child: Image.asset(
                                    Images.upload,
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                                Text(
                                  "이미지를 등록해주세요.",
                                  style: TextStyle(
                                    fontSize: 9.0,
                                    color: Color(0xff999999),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 5,
                        thickness: 1,
                        indent: 0,
                        endIndent: 0,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "포트폴리오 등록",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Color(0xff999999),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "+ 추갸",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xff999999),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        height: 300,
                        child: GridView.builder(
                            itemCount: 6, //item 개수
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              // childAspectRatio: 1 / 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                            itemBuilder:
                                (BuildContext context, int index) {
                              return InkWell(
                                onTap: () async {
                                  thumbnailLists2 = [];

                                  List<Media> res = await ImagesPicker.pick(
                                    count: 5,
                                    pickType: PickType.all,
                                    language: Language.System,
                                    maxTime: 30,
                                    // maxSize: 500,
                                    cropOpt: CropOption(
                                      // aspectRatio: CropAspectRatio.wh16x9,
                                      cropType: CropType.circle,
                                    ),
                                  );
                                  print(res);
                                  if (res != null) {
                                    print(res.map((e) => e.path).toList());

                                    setState(() {
                                      thumbnailLists2 =
                                          res.map((e) => e.thumbPath).toList();
                                    });
                                    // bool status = await ImagesPicker.saveImageToAlbum(File(res[0]?.path));
                                    // print(status);
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Color(0xfff1f1f1),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        Images.upload,
                                        width: 30,
                                        height: 30,
                                      ),
                                      Text(
                                        "이미지를 등록해주세요.",
                                        style: TextStyle(
                                          fontSize: 9.0,
                                          color: Color(0xff999999),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                                }),
                      ),
                      SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                        child: CustomElevatedButton(
                          onTap: () {
                            // ClientsModel clientsModel = ClientsModel(
                            //   phoneNum: phoneNumberTextEditingController.text,
                            //   password: passwordTextEditingController.text,
                            // );
                            //
                            // Provider.of<ClientsProvider>(context, listen: false)
                            //     .login(clientsModel, route);
                          },
                          buttonText: "수정",
                        ),
                      ),
                      FooterPage(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
