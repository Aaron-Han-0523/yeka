import 'package:flutter/material.dart';
import 'package:kpostal/kpostal.dart';
import 'package:provider/provider.dart';
import 'package:yeka/util/dimensions.dart';
import 'package:yeka/view/basewidget/button/custom_elevated_button.dart';
import 'package:yeka/view/screen/home/widget/footer_screens.dart';

import '../../../data/model/response/user_model.dart';
import '../../../localization/language_constants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/user_provider.dart';
import '../../basewidget/appbar/custom_sliver_app_bar.dart';
import '../../basewidget/button/custom_label_textfield_upload_button.dart';
import '../../basewidget/radio/custom_small_radio_button.dart';
import '../../basewidget/textfield/custom_label_textfield.dart';
import 'mypage_home_screen.dart';

class MyPageUpdateScreen extends StatefulWidget {
  const MyPageUpdateScreen({
    Key key,
  }) : super(key: key);

  @override
  State<MyPageUpdateScreen> createState() => _MyPageUpdateScreenState();
}

class _MyPageUpdateScreenState extends State<MyPageUpdateScreen> {
  final ScrollController _scrollController = ScrollController();

  TextEditingController _idController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _confirmPwController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _address1Controller = TextEditingController();
  TextEditingController _address2Controller = TextEditingController();
  TextEditingController _address3Controller = TextEditingController();
  TextEditingController _companyRegistrationNumberController =
      TextEditingController();
  TextEditingController _companyRegistrationFileController =
      TextEditingController();

  bool radioButton1 = false; // gender
  bool radioButton2 = false;

  Map map;

  int _gender = 0;
  int _user_type = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    map = Provider.of<AuthProvider>(context, listen: false).getUser();

    _idController.text = map["username"];
    _pwController.text = map["password"];
    _nameController.text = map["name"];
    _phoneController.text = map["phone"];
    _emailController.text = map["email"];
    _gender = map["gender"];
    _address1Controller.text = map["address1"];
    _address2Controller.text = map["address2"];
    _address3Controller.text = map["address3"];
    _companyRegistrationNumberController.text =
    map["business_registration_number"];
    _companyRegistrationFileController.text = map["business_registration_file"];

    _user_type = map["user_type"];

    if (map["gender"] == 0)
      radioButton1 = true;
    else
      radioButton2 = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: SafeArea(
      child: Stack(children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            CustomSliverAppBar(
              "${getTranslated('MODIFYING_PERSONAL_INFORMATION', context)}",
              isMyPageHidden: true,
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(0),
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
                    SizedBox(height: 18),
                    CustomLabelTextField(
                      controller: _idController,
                      labelText: "${getTranslated('ID', context)} ",
                      essentialLabelText: " *",
                      boxColor: Colors.black,
                      textColor: Colors.white,
                      hintText: "${getTranslated('HINT_ID', context)}",
                      enabled: false,
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    CustomLabelTextField(
                      controller: _pwController,
                      labelText: "${getTranslated('PW', context)} ",
                      essentialLabelText: " *",
                      hintText: "${getTranslated('HINT_PW', context)}",
                      obscureText: true,
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    CustomLabelTextField(
                      controller: _confirmPwController,
                      labelText: "${getTranslated('CONFIRM_PW', context)} ",
                      essentialLabelText: " *",
                      hintText: "${getTranslated('HINT_CONFIRM_PW', context)}",
                      obscureText: true,
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    CustomLabelTextField(
                      controller: _nameController,
                      labelText: "${getTranslated('NAME', context)} ",
                      essentialLabelText: " *",
                      hintText: "${getTranslated('HINT_NAME', context)}",
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    CustomLabelTextField(
                      controller: _phoneController,
                      labelText: "${getTranslated('PHONE', context)} ",
                      essentialLabelText: " *",
                      hintText: "${getTranslated('HINT_PHONE', context)}",
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    CustomLabelTextField(
                      controller: _emailController,
                      labelText: "${getTranslated('EMAIL', context)} ",
                      essentialLabelText: " *",
                      hintText: "${getTranslated('HINT_EMAIL', context)}",
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.MARGIN_SIZE_LARGE,
                          right: Dimensions.MARGIN_SIZE_LARGE),
                      // padding: const EdgeInsets.fromLTRB(2.0, 0, 16.0, 2.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "${getTranslated('GENDER', context)} ",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                " *",
                                style: TextStyle(
                                    color: Color(0xffff0000),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 2),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    radioButton1 = false;
                                  });
                                },
                                child: CustomSmallRadioButton(
                                    value: !radioButton1,
                                    text: "${getTranslated('MALE', context)}",
                                    padding: const EdgeInsets.only(right: 0)),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    radioButton1 = true;
                                  });
                                },
                                child: CustomSmallRadioButton(
                                  value: radioButton1,
                                  text: "${getTranslated('FEMALE', context)}",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                    Row(
                      children: [
                        Expanded(
                          child: CustomLabelTextField(
                            controller: _address1Controller,
                            labelText: "${getTranslated('ADDRESS', context)} ",
                            label_fontSize: 15,
                            essentialLabelText: " *",
                            hintText:
                                "${getTranslated('SELECT_CITY', context)}",
                            enabled: false,
                          ),
                        ),
                        Container(
                          width: 120,
                          // alignment: Alignment.bottomCenter,
                          child: Column(
                            children: [
                              Text(""),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                                child: CustomElevatedButton(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => KpostalView(
                                          useLocalServer: true,
                                          localPort: 1024,
                                          // kakaoKey: '{Add your KAKAO DEVELOPERS JS KEY}',
                                          callback: (Kpostal result) {
                                            setState(() {
                                              _address1Controller.text =
                                                  result.postCode;
                                              _address2Controller.text =
                                                  result.address;
                                            });
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  buttonText:
                                      "${getTranslated('SEARCH', context)}",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    CustomLabelTextField(
                      controller: _address2Controller,
                      isTextable: false,
                      labelText: "",
                      enabled: false,
                      // essentialLabelText: "",
                      hintText: "${getTranslated('SELECT_DISTINCT', context)}",
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    CustomLabelTextField(
                      isTextable: false,
                      controller: _address3Controller,
                      // labelText: "${getTranslated('ETC_ADDRESS', context)} ",
                      // essentialLabelText: " *",
                      hintText: "${getTranslated('ETC_ADDRESS', context)}",
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                    _user_type == 1
                        ? CustomLabelTextField(
                            controller: _companyRegistrationNumberController,
                            labelText:
                                "${getTranslated('COMPANY_REGISTRATION_NUMBER', context)} ",
                            // essentialLabelText: " *",
                            hintText:
                                "${getTranslated('HINT_COMPANY_REGISTRATION_NUMBER', context)}",
                          )
                        : Container(),
                    _user_type == 1
                        ? SizedBox(height: Dimensions.PADDING_SIZE_SMALL)
                        : Container(),
                    _user_type == 1
                        ? CustomLabelTextFieldUploadButton(
                            labelText:
                                "${getTranslated('COMPANY_REGISTRATION_NUMBER_FILE_ENROLL', context)}")
                        : Container(),
                    SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                    CustomElevatedButton(
                      onTap: () async {
                        if (_pwController.text != _confirmPwController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    "${getTranslated('IS_NOT_CORRECT_PW', context)}"),
                                backgroundColor: Colors.red),
                          );
                        } else {
                          UserModel userModel = UserModel(
                            id: map["id"],
                            password: _pwController.text,
                            name: _nameController.text,
                            phone: _phoneController.text,
                            email: _emailController.text,
                            gender: _gender,
                            address1: _address1Controller.text,
                            address2: _address2Controller.text,
                            address3: _address3Controller.text,
                            business_registration_number:
                                _companyRegistrationNumberController.text ?? "",
                            business_registration_file:
                                _companyRegistrationFileController.text ?? "",
                          );

                          await Provider.of<UserProvider>(context,
                                  listen: false)
                              .updateUser(userModel);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    "${getTranslated('SUCCESS_TO_UPDATE_INFO', context)}"),
                                backgroundColor: Colors.green),
                          );

                          //fixme 2번 불러야 1타이밍이 어긋나는 것을 피할 수 있다.
                          await Provider.of<AuthProvider>(context, listen: false).getMyInfo(userModel);
                          await Provider.of<AuthProvider>(context, listen: false).getMyInfo(userModel);

                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (_) => MyPageHomeScreen()),
                                  (route) => false);

                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //       builder: (_) => MyPageHomeScreen()),);
                        }
                      },
                      buttonText: "${getTranslated('MODIFY_INFO', context)}",
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                    ),
                    SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    SizedBox(height: Dimensions.PADDING_SIZE_Thirty_Five),
                    FooterPage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    ));
  }
}
