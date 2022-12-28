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
  TextEditingController _addressTextController = TextEditingController();
  TextEditingController _etcAddressTextController = TextEditingController();
  TextEditingController _companyRegistrationNumberController =
      TextEditingController();
  TextEditingController _companyRegistrationFileController =
      TextEditingController();

  bool radioButton = false;

  bool radioButton1 = false; // gender
  bool radioButton2 = false;
  bool radioButton3 = false;
  bool radioButton4 = false;

  String postCode = '우편번호';
  String address = '주소';
  String latitude = '-';
  String longitude = '-';
  String kakaoLatitude = '-';
  String kakaoLongitude = '-';

  Map map;

  int user_type = 0;

  @override
  void initState() {
    super.initState();
    map = Provider.of<AuthProvider>(context, listen: false).getUser();

    _idController.text = map["username"];
    _pwController.text = map["password"];
    _nameController.text = map["name"];
    _phoneController.text = map["phone"];
    _emailController.text = map["email"];
    if (map["gender"] == 0)
      radioButton1 = true;
    else
      radioButton2 = true;
    postCode = map["address1"];
    _addressTextController.text = map["address2"];
    _etcAddressTextController.text = map["address3"];
    _companyRegistrationNumberController.text =
        map["business_registration_number"];
    _companyRegistrationFileController.text = map["business_registration_file"];
    user_type = map["user_type"];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
              "${getTranslated('MODIFYING_PERSONAL_INFORMATION', context)}",isMyPageHidden: true,
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

                    Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.MARGIN_SIZE_DEFAULT,
                          right: Dimensions.MARGIN_SIZE_DEFAULT),
                      padding: const EdgeInsets.fromLTRB(2.0, 4.0, 16.0, 2.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "${getTranslated('ADDRESS', context)} ",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                " ${getTranslated('*', context)}",
                                style: TextStyle(
                                  color: Color(0xffff0000),
                                  fontSize: 9,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: CustomLabelTextField(
                            hintText: "$postCode",
                            enabled: false,
                            isBorder: true,
                            fillColor: Colors.white,
                            isTextable: false,
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 5.0, 16.0, 0.0),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                  0.0,
                                  0.0,
                                  22.0,
                                  0.0,
                                ),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            Color(0xff121212)),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => KpostalView(
                                          useLocalServer: true,
                                          localPort: 1024,
                                          // kakaoKey: '{Add your KAKAO DEVELOPERS JS KEY}',
                                          callback: (Kpostal result) {
                                            setState(() {
                                              this.postCode = result.postCode;
                                              this.address = result.address;
                                              this.latitude =
                                                  result.latitude.toString();
                                              this.longitude =
                                                  result.longitude.toString();
                                              this.kakaoLatitude = result
                                                  .kakaoLatitude
                                                  .toString();
                                              this.kakaoLongitude = result
                                                  .kakaoLongitude
                                                  .toString();
                                            });
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                      "${getTranslated('SEARCH', context)}"),
                                ),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    CustomLabelTextField(
                      controller: _addressTextController,
                      hintText: "${getTranslated('ADD_ADDRESS', context)}",
                      enabled: false,
                      isBorder: true,
                      fillColor: Colors.white,
                    ),
                    // SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    CustomLabelTextField(
                      controller: _etcAddressTextController,
                      hintText: "${getTranslated('ETC_ADDRESS', context)}",
                      isBorder: true,
                      fillColor: Colors.white,
                    ),

                    SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                    user_type == 1
                        ? CustomLabelTextField(
                            controller: _companyRegistrationNumberController,
                            labelText:
                                "${getTranslated('COMPANY_REGISTRATION_NUMBER', context)} ",
                            // essentialLabelText: " *",
                            hintText:
                                "${getTranslated('HINT_COMPANY_REGISTRATION_NUMBER', context)}",
                          )
                        : Container(),

                    user_type == 1
                        ? SizedBox(height: Dimensions.PADDING_SIZE_SMALL)
                        : Container(),

                    user_type == 1
                        ? CustomLabelTextFieldUploadButton(
                            labelText:
                                "${getTranslated('COMPANY_REGISTRATION_NUMBER_FILE_ENROLL', context)}")
                        : Container(),

                    SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                    CustomElevatedButton(
                      onTap: () {
                        if(_pwController.text != _confirmPwController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("비밀번호가 일치하지 않습니다."), backgroundColor: Colors.red),
                          );
                        } else {
                          UserModel userModel = UserModel(
                            id: map["id"],
                            password: _pwController.text,
                            name: _nameController.text,
                            phone: _phoneController.text,
                            email: _emailController.text,
                            gender: radioButton1 ? 1 : 0,
                            address1: postCode,
                            address2: _addressTextController.text,
                            address3: _etcAddressTextController.text,
                          );

                          Provider.of<UserProvider>(context, listen: false)
                              .updateUser(userModel);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("정보를 업데이트 했습니다."), backgroundColor: Colors.green),
                          );

                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => MyPageHomeScreen()),(route) => false);
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
        // Positioned(
        //   bottom: 0,
        //   child: FooterPage(),
        // ),
      ]),
    ));
  }
}
