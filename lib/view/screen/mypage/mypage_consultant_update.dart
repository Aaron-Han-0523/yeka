import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:images_picker/images_picker.dart';
import 'package:provider/provider.dart';
import 'package:yeka/data/model/response/user_model.dart';
import 'package:yeka/util/dimensions.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';

import '../../../data/model/response/image_model.dart';
import '../../../data/model/response/menu_model.dart';
import '../../../helper/date_converter.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/image_provider.dart';
import '../../../provider/menu_provider.dart';
import '../../../provider/user_provider.dart';
import '../../../util//images.dart';
import '../../../util/app_constants.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_elevated_button.dart';
import '../../basewidget/dialog/single_text_alertdialog.dart';
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

  TextEditingController _hash1Controller = TextEditingController();
  TextEditingController _hash2Controller = TextEditingController();
  TextEditingController _hash3Controller = TextEditingController();
  TextEditingController _hash4Controller = TextEditingController();
  TextEditingController _hash5Controller = TextEditingController();
  TextEditingController _hash6Controller = TextEditingController();
  TextEditingController _resumeController = TextEditingController();
  TextEditingController _availController = TextEditingController();

  List<TextEditingController> _menuTitleList = [];
  List<TextEditingController> _menuAmountList = [];
  List<TextEditingController> _menuContentList = [];
  List<TextEditingController> _menuImageList = [];

  TextEditingController _menuTitleController = TextEditingController();
  TextEditingController _menuAmountController = TextEditingController();
  TextEditingController _menuContentController = TextEditingController();
  TextEditingController _menuImageController = TextEditingController();

  bool radioButton = false;
  List<String> thumbnailList = [];
  List<String> thumbnailList2 = [];
  List<Media> resProfile;
  List<Media> resPortfolio;

  List<MenuModel> menuList = [];
  List<ImageModel> imageList = [];
  Map map;
  int menuCount = 0;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    map = Provider.of<AuthProvider>(context, listen: false).getUser();

    MenuModel menuModel = MenuModel(consultant_id: map["id"]);

    await Provider.of<MenuProvider>(context, listen: false)
        .getMenuList(menuModel, context);

    menuList = Provider.of<MenuProvider>(context, listen: false).menuList;

    for (var i = 0; i < menuList.length; i++) {
      addMenu(
        menuList[i].menu_title,
        menuList[i].menu_amount,
        menuList[i].menu_content,
        menuList[i].menu_image,
        menuCount,
      );
    }

    ImageModel imageModel = ImageModel(consultant_id: map["id"]);

    await Provider.of<CustomImageProvider>(context, listen: false)
        .getImageListByConsultantId(imageModel);

    imageList =
        Provider.of<CustomImageProvider>(context, listen: false).imageList;

    for (var i = 0; i < imageList.length; i++) {
      if (imageList[i].image_type == 2) {
        // 컨설턴트 프로필
        thumbnailList.add(imageList[i].path);
      } else if (imageList[i].image_type == 3) {
        // 컨설턴트 포트폴리오
        thumbnailList2.add(imageList[i].path);
      } else if (imageList[i].image_type == 4) {
        // 컨설턴트 메뉴
        // menuList[i].menu_image = imageList[i].path;
      } else {}
    }

    List<String> hashtag = map["hashtag"].split(",");

    for (int i = 0; i < hashtag.length; i++) {
      if (i == 0) {
        _hash1Controller.text = hashtag[i];
      } else if (i == 1) {
        _hash2Controller.text = hashtag[i];
      } else if (i == 2) {
        _hash3Controller.text = hashtag[i];
      } else if (i == 3) {
        _hash4Controller.text = hashtag[i];
      } else if (i == 4) {
        _hash5Controller.text = hashtag[i];
      } else if (i == 5) {
        _hash6Controller.text = hashtag[i];
      }
    }

    setState(() {});
  }

  void addMenu(menu_title, menu_amount, menu_content, menu_image, menuCount) {
    if (menu_title == "")
      _menuTitleList.add(TextEditingController());
    else
      _menuTitleList.add(TextEditingController(text: menu_title));

    if (menu_amount == null)
      _menuAmountList.add(TextEditingController());
    else
      _menuAmountList.add(TextEditingController(text: menu_amount.toString()));

    if (menu_content == "")
      _menuContentList.add(TextEditingController());
    else
      _menuContentList.add(TextEditingController(text: menu_content));

    if (menu_title == "")
      _menuImageList.add(TextEditingController());
    else
      _menuImageList.add(TextEditingController(text: menu_image));

    menuCount++;
  }

  Widget buildMenu(
    bool isInitWidget,
    int index,
    TextEditingController _menuTitleController,
    TextEditingController _menuAmountController,
    TextEditingController _menuContentController,
    TextEditingController _menuImageController,
  ) {
    return Column(
      children: [
        !isInitWidget
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff333333),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        // 상담 메뉴 삭제
                        _menuTitleList.removeAt(index);
                        _menuAmountList.removeAt(index);
                        _menuContentList.removeAt(index);
                        _menuImageList.removeAt(index);

                        MenuModel menuModel = MenuModel(
                          id: menuList[index].id,
                        );

                        await Provider.of<MenuProvider>(context, listen: false)
                            .deleteMenu(menuModel);

                        ImageModel imageModel = ImageModel(
                          image_type: 4,
                          id: menuList[index].id,
                          user_id: map["id"],
                        );

                        await Provider.of<CustomImageProvider>(context,
                                listen: false)
                            .deleteImage(imageModel);

                        menuCount--;

                        setState(() {});
                      },
                      child: Text(
                        "- ${getTranslated('DELETE', context)}",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff333333),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Container(),
        CustomLabelTextField(
          controller: _menuTitleController,
          // labelText: "상담 메뉴 ",
          // essentialLabelText: " *",
          hintText: "${getTranslated('FILL_IN_CONSULTANT_TITLE', context)}",
          hintColor: Color(0xffdddddd),
          padding: EdgeInsets.all(0),
        ),
        CustomLabelTextField(
          controller: _menuAmountController,
          // labelText: "상담 메뉴 ",
          // essentialLabelText: " *",
          hintText: "${getTranslated('FILL_IN_CONSULTATION_PAYMENT', context)}",
          hintColor: Color(0xffdddddd),
          padding: EdgeInsets.all(0),
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextarea(
                textEditingController: _menuContentController,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                // labelText: "상담 내용",
                hintText:
                    "${getTranslated('FILL_IN_CONSULTATION_CONTENT', context)}",
                hintSize: 12,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                maxHeight: 102,
              ),
            ),
            InkWell(
              onTap: () async {
                final ImagePicker _picker = ImagePicker();
                // Pick an image
                final XFile image =
                    await _picker.pickImage(source: ImageSource.gallery);

                _menuImageController.text = image.path;

                setState(() {});
              },
              child: Container(
                alignment: Alignment.center,
                width: 102,
                height: 102,
                margin: EdgeInsets.only(
                  top: Dimensions.MARGIN_SIZE_LARGE,
                  right: Dimensions.MARGIN_SIZE_SMALL,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xfff1f1f1),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.file(
                    File(
                      _menuImageController.text,
                    ),
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace stackTrace) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FadeInImage.assetNetwork(
                            placeholder: Images.placeholder1,
                            image: _menuImageController.text,
                            fit: BoxFit.fitWidth,
                            width: 83,
                            imageErrorBuilder: (BuildContext context,
                                Object exception, StackTrace stackTrace) {
                              return Image.asset(
                                Images.upload,
                                fit: BoxFit.fitWidth,
                                width: 30,
                              );
                            },
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
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
        const Divider(
          height: 0,
          thickness: 1,
          indent: 10,
          endIndent: 10,
          color: Color(0xff333333),
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
      ],
    );
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
                  isMyPageHidden: true,
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
                        SizedBox(
                            height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
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
                          padding: const EdgeInsets.fromLTRB(16, 0, 20, 0),
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
                                    thumbnailList = [];

                                    resProfile = await ImagesPicker.pick(
                                      count: 5,
                                      pickType: PickType.image,
                                      language: Language.System,
                                      maxTime: 30,
                                      // maxSize: 500,
                                      cropOpt: CropOption(
                                        // aspectRatio: CropAspectRatio.wh16x9,
                                        cropType: CropType.circle,
                                      ),
                                    );

                                    if (resProfile != null) {
                                      print(resProfile
                                          .map((e) => e.path)
                                          .toList());

                                      setState(() {
                                        if (thumbnailList.length < 5) {
                                          thumbnailList = resProfile
                                              .map((e) => e.thumbPath)
                                              .toList();
                                        }
                                      });
                                    }
                                  },
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Container(
                                            padding: const EdgeInsets.fromLTRB(
                                              14,
                                              7,
                                              14,
                                              18,
                                            ),
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
                                            "${thumbnailList.length ?? 0} / 5",
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
                              for (var i = 0; i < thumbnailList.length; i++)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.file(
                                    File(thumbnailList[i]),
                                    fit: BoxFit.cover,
                                    width: 50,
                                    height: 50,
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace stackTrace) {
                                      return FadeInImage.assetNetwork(
                                        placeholder: Images.placeholder1,
                                        image: thumbnailList[i] != null
                                            ? AppConstants.BASE_URL +
                                                "/" +
                                                thumbnailList[i]
                                            : AppConstants.BASE_URL,
                                        fit: BoxFit.cover,
                                        width: 50,
                                        height: 50,
                                        imageErrorBuilder:
                                            (BuildContext context,
                                                Object exception,
                                                StackTrace stackTrace) {
                                          return Container(
                                            // padding: const EdgeInsets.all(10.0),
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color(0xfff1f1f1),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Image.asset(
                                                Images.upload,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              for (var i = thumbnailList.length; i < 5; i++)
                                Container(
                                  // padding: const EdgeInsets.all(10.0),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xfff1f1f1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Image.asset(
                                      Images.upload,
                                    ),
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
                              fontWeight: FontWeight.bold,
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
                              fontWeight: FontWeight.bold,
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
                                  controller: _hash1Controller,
                                  // essentialLabelText: " *",
                                  hintText:
                                      "${getTranslated('EX_JUNIOR_COLLEGE_GRADUATION', context)}",
                                ),
                              ),

                              SizedBox(width: 29),

                              Flexible(
                                child: CustomTextField(
                                  controller: _hash2Controller,
                                  // essentialLabelText: " *",
                                  hintText:
                                      "${getTranslated('EX_JUNIOR_COLLEGE_GRADUATION', context)}",
                                ),
                              ),

                              SizedBox(width: 29),

                              Flexible(
                                child: CustomTextField(
                                  controller: _hash3Controller,
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
                                  controller: _hash4Controller,
                                  // essentialLabelText: " *",
                                  hintText:
                                      "${getTranslated('EX_JUNIOR_COLLEGE_GRADUATION', context)}",
                                ),
                              ),

                              SizedBox(width: 29),

                              Flexible(
                                child: CustomTextField(
                                  controller: _hash5Controller,
                                  // essentialLabelText: " *",
                                  hintText:
                                      "${getTranslated('EX_JUNIOR_COLLEGE_GRADUATION', context)}",
                                ),
                              ),

                              SizedBox(width: 29),

                              Flexible(
                                child: CustomTextField(
                                  controller: _hash6Controller,
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
                            textEditingController: _resumeController,
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                            labelText:
                                "${getTranslated('CERTIFICATE_RESUME', context)}",
                            hintText:
                                "${getTranslated('FILL_IN_CERTIFICATE_RESUME', context)}",
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 0),
                            label_fontSize: 12.0,
                          ),
                        ),
                        SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                        Container(
                          child: CustomTextarea(
                            textEditingController: _availController,
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                            labelText:
                                "${getTranslated('CONSULTATION_AVAILABLE_TIME', context)}",
                            hintText:
                                "${getTranslated('FILL_IN_CONSULTATION_AVAILABLE_TIME', context)}",
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 0),
                            label_fontSize: 12.0,
                          ),
                        ),
                        SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${getTranslated('CONSULTANT_MENU', context)}",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff333333),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  // 상담 메뉴 추가
                                  if (_menuTitleList.length > 2) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          SingleTextAlertDialog(
                                        message:
                                            "${getTranslated('CAN_REGISTER_MENU_MAX_THREE', context)}",
                                      ),
                                    );
                                  } else {
                                    addMenu(
                                      _menuTitleController.text,
                                      _menuAmountController.text,
                                      _menuContentController.text,
                                      _menuImageController.text,
                                      menuCount++,
                                    );

                                    MenuModel menuModel = MenuModel(
                                      consultant_id: map["id"],
                                      menu_title: _menuTitleList[menuCount].text,
                                      menu_amount: int.parse(
                                          _menuAmountList[menuCount].text),
                                      menu_content:
                                      _menuContentList[menuCount].text,
                                      menu_image: _menuImageList[menuCount].text,
                                    );

                                    await Provider.of<MenuProvider>(context,
                                        listen: false)
                                        .addMenu(menuModel);

                                    ImageModel imageModel = ImageModel(
                                      image_type: 4,
                                      consultant_id: map["id"],
                                      path: _menuImageList[menuCount].text,
                                      create_date: DateConverter.formatDate(
                                          DateTime.now()),
                                    );

                                    await Provider.of<CustomImageProvider>(
                                        context,
                                        listen: false)
                                        .addImage(imageModel);

                                  }

                                  _menuTitleController.text = "";
                                  _menuAmountController.text = "";
                                  _menuContentController.text = "";
                                  _menuImageController.text = "";

                                  setState(() {});
                                },
                                child: Text(
                                  "${getTranslated('PLUS_ADD', context)}",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff333333),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        buildMenu(
                          true,
                          -1,
                          _menuTitleController,
                          _menuAmountController,
                          _menuContentController,
                          _menuImageController,
                        ),
                        for (var i = 0; i < _menuTitleList.length; i++)
                          buildMenu(
                            false,
                            i,
                            _menuTitleList[i],
                            _menuAmountList[i],
                            _menuContentList[i],
                            _menuImageList[i],
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
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () async {
                                  thumbnailList2 = [];

                                  resPortfolio = await ImagesPicker.pick(
                                    count: 6,
                                    pickType: PickType.all,
                                    language: Language.System,
                                    maxTime: 30,
                                    // maxSize: 500,
                                    cropOpt: CropOption(
                                      // aspectRatio: CropAspectRatio.wh16x9,
                                      cropType: CropType.circle,
                                    ),
                                  );
                                  print(resPortfolio);
                                  if (resPortfolio != null) {
                                    print(resPortfolio
                                        .map((e) => e.path)
                                        .toList());

                                    setState(() {
                                      thumbnailList2 = resPortfolio
                                          .map((e) => e.thumbPath)
                                          .toList();
                                    });
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
                                  child: index < thumbnailList2.length
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          child: Image.file(
                                            File(thumbnailList2[index]),
                                            fit: BoxFit.cover,
                                            width: 150,
                                            height: 150,
                                            errorBuilder: (BuildContext context,
                                                Object exception,
                                                StackTrace stackTrace) {
                                              return FadeInImage.assetNetwork(
                                                placeholder:
                                                    Images.placeholder1,
                                                image: thumbnailList2[index] !=
                                                        null
                                                    ? AppConstants.BASE_URL +
                                                        "/" +
                                                        thumbnailList2[index]
                                                    : AppConstants.BASE_URL,
                                                fit: BoxFit.cover,
                                                width: 150,
                                                height: 150,
                                                imageErrorBuilder:
                                                    (BuildContext context,
                                                        Object exception,
                                                        StackTrace stackTrace) {
                                                  return Container(
                                                    // padding: const EdgeInsets.all(10.0),
                                                    width: 150,
                                                    height: 150,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Color(0xfff1f1f1),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12.0),
                                                      child: Image.asset(
                                                        Images.upload,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                            },
                          ),
                        ),
                        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0.0, 0, 40.0),
                          child: CustomElevatedButton(
                            onTap: () {
                              modify();
                              Navigator.pop(context);
                            },
                            buttonText:
                                "${getTranslated('MODIFICATION', context)}",
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

  modify() async {
    UserModel userModel = UserModel(
      id: map["id"],
      hashtag:
          "${_hash1Controller.text},${_hash2Controller.text},${_hash3Controller.text},${_hash4Controller.text},${_hash5Controller.text},${_hash6Controller.text}",
      resume: _resumeController.text,
      working_hour: _availController.text,
    );

    await Provider.of<UserProvider>(context, listen: false)
        .updateUser(userModel);

    map["hashtag"] =
        "${_hash1Controller.text},${_hash2Controller.text},${_hash3Controller.text},${_hash4Controller.text},${_hash5Controller.text},${_hash6Controller.text}";

    await Provider.of<AuthProvider>(context, listen: false).saveUser(map);

    // 프로필
    if (resProfile != null) {
      for (var i = 0; i < imageList.length; i++) {
        ImageModel imageModel = ImageModel(
          id: imageList[i].id,
        );

        await Provider.of<CustomImageProvider>(context, listen: false)
            .deleteImage(imageModel);
      }

      for (var i = 0; i < thumbnailList.length; i++) {
        ImageModel imageModel = ImageModel(
          image_type: 2,
          consultant_id: map["id"],
          path: thumbnailList[i],
          create_date: DateConverter.formatDate(DateTime.now()),
        );

        await Provider.of<CustomImageProvider>(context, listen: false)
            .addImage(imageModel);
      }
    }

    // 포트폴리오
    if (resPortfolio != null) {
      for (var i = 0; i < menuList.length; i++) {
        MenuModel menuModel = MenuModel(
          id: menuList[i].id,
        );

        await Provider.of<MenuProvider>(context, listen: false)
            .deleteMenu(menuModel);
      }

      for (var i = 0; i < thumbnailList2.length; i++) {
        ImageModel imageModel = ImageModel(
          image_type: 3,
          consultant_id: map["id"],
          path: thumbnailList2[i],
          create_date: DateConverter.formatDate(DateTime.now()),
        );

        await Provider.of<CustomImageProvider>(context, listen: false)
            .addImage(imageModel);
      }
    }
  }
}
