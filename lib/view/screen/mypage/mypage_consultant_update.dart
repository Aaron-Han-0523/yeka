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
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                CustomSliverAppBar(
                  "${getTranslated('MODIFY_CONSULTANT_INFO', context)}",
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        const Divider(
                          height: 1,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                          color: Color(0xffDDDDDD),
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),

                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  "${getTranslated('PROFILE_PHOTO', context)}",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff333333)
                                    // overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                            ),
                          ],
                        ),
                        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),

                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "${getTranslated('PUT_YOUR_PHOTO', context)}",
                                style: TextStyle(
                                  fontSize: 8.0,
                                  fontWeight: FontWeight.bold,
                                    color: Color(0xff333333),
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(16, 0 ,20, 0),
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
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
                                            padding: const EdgeInsets.fromLTRB(14, 7, 14, 18),
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
                                          padding: EdgeInsets.only(bottom: 7),
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            "${thumbnailLists.length ?? 0} / 5",
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
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
                                  // padding: const EdgeInsets.all(10.0),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
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
                        SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                        Container(
                          padding: EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${getTranslated('HASHTAG', context)}",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Color(0xff333333),
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                        SizedBox(height: 9),

                        Container(
                          padding: EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${getTranslated('APPEAL_AS_HASHTAG', context)}",
                            style: TextStyle(
                                fontSize: 8.0,
                                color: Color(0xff333333),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Container(
                                // padding: EdgeInsets.only(right: 25),
                                Flexible(

                                  child: CustomTextField(
                                    controller: _firstNameController,
                                    // essentialLabelText: " *",
                                    hintText: "${getTranslated('EX_JUNIOR_COLLEGE_GRADUATION', context)}",
                                  ),
                                ),

                              SizedBox(width: 29),

                              Flexible(
                                child: CustomTextField(
                                  controller: _firstNameController,
                                  // essentialLabelText: " *",
                                  hintText:
                                  "${getTranslated('EX_JUNIOR_COLLEGE_GRADUATION', context)}",
                                ),
                              ),

                              SizedBox(width: 29),

                              Flexible(
                                child: CustomTextField(
                                  controller: _firstNameController,
                                  // essentialLabelText: " *",
                                  hintText:
                                  "${getTranslated('EX_JUNIOR_COLLEGE_GRADUATION', context)}",
                                ),
                              ),
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Container(
                              // padding: EdgeInsets.only(right: 25),
                              Flexible(

                                child: CustomTextField(
                                  controller: _firstNameController,
                                  // essentialLabelText: " *",
                                  hintText: "${getTranslated('EX_JUNIOR_COLLEGE_GRADUATION', context)}",
                                ),
                              ),

                              SizedBox(width: 29),

                              Flexible(
                                child: CustomTextField(
                                  controller: _firstNameController,
                                  // essentialLabelText: " *",
                                  hintText:
                                  "${getTranslated('EX_JUNIOR_COLLEGE_GRADUATION', context)}",
                                ),
                              ),

                              SizedBox(width: 29),

                              Flexible(
                                child: CustomTextField(
                                  controller: _firstNameController,
                                  // essentialLabelText: " *",
                                  hintText:
                                  "${getTranslated('EX_JUNIOR_COLLEGE_GRADUATION', context)}",
                                ),
                              ),
                              // ),
                            ],
                          ),
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                       Container(
                          child: CustomTextarea(
                            padding: const EdgeInsets.fromLTRB(0, 0 ,0 , 3),
                            labelText: "${getTranslated('CERTIFICATE_RESUME', context)}",
                            hintText: "${getTranslated('FILL_IN_CERTIFICATE_RESUME', context)}",
                            contentPadding: const EdgeInsets.symmetric(vertical: 0),
                          ),
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                        Container(
                          child: CustomTextarea(
                            padding: const EdgeInsets.fromLTRB(0, 0 ,0 , 3),
                            labelText: "${getTranslated('CONSULTATION_AVAILABLE_TIME', context)}",
                            hintText: "${getTranslated('FILL_IN_CONSULTATION_AVAILABLE_TIME', context)}",
                            contentPadding: const EdgeInsets.symmetric(vertical: 0),
                          ),
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${getTranslated('${getTranslated('CONSULTATION___MENU', context)}', context)}",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff333333),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${getTranslated('PLUS_ADD', context)}",
                                    style: TextStyle(
                                      fontSize: 9.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff333333),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        CustomLabelTextField(
                          controller: _firstNameController,
                          // labelText: "상담 메뉴 ",
                          // essentialLabelText: " *",
                          hintText: "${getTranslated('FILL_IN_TITLE', context)}",
                          hintColor: Color(0xffdddddd),
                          padding: EdgeInsets.all(0),
                        ),
                        CustomLabelTextField(
                          controller: _firstNameController,
                          // labelText: "상담 메뉴 ",
                          // essentialLabelText: " *",
                          hintText: "${getTranslated('${getTranslated('FILL_IN_CONSULTATION_AMOUNT', context)}', context)}",
                          hintColor: Color(0xffdddddd),
                          padding: EdgeInsets.all(0),
                        ),
                        Row(
                          children: [
                            Expanded(

                              child: CustomTextarea(
                                padding: const EdgeInsets.fromLTRB(0, 0 ,0 , 3),
                                // labelText: "상담 내용",
                                hintText: "${getTranslated('FILL_IN_CONSULTATION_CONTENT', context)}",
                                hintSize: 14,
                                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 100,
                              height: 155,
                              margin: EdgeInsets.only(
                                top: Dimensions.MARGIN_SIZE_LARGE,
                                right: Dimensions.MARGIN_SIZE_SMALL,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xfff1f1f1),
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
                                  SizedBox(height: 8),
                                  Text(
                                    "${getTranslated('REGISTER_IMAGE', context)}",
                                    style: TextStyle(
                                      fontSize: 8.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff999999),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                        const Divider(
                          height: 0,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                          color: Color(0xff333333),
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${getTranslated('REGISTER_PORTFOLIO', context)}",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff333333),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${getTranslated('PLUS_ADD', context)}",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff333333),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          height: 215,
                          child: GridView.builder(
                              itemCount: 6, //item 개수
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                // childAspectRatio: 1 / 2,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
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
                                    // padding: const EdgeInsets.all(0.0),
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
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
                                        SizedBox(height: 7),
                                        Text(
                                          "${getTranslated('REGISTRATION_IMAGE', context)}",
                                          style: TextStyle(
                                            fontSize: 8.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff999999),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),

                        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0, 0.0, 0, 40.0),
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
                            buttonText: "${getTranslated('MODIFICATION', context)}",
                          ),
                        ),
                        FooterPage(),
                      ],
                    ),
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
