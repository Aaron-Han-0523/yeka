import 'package:flutter/material.dart';
import 'package:yeka/data/model/body/register_model.dart';
import 'package:yeka/data/model/response/user_model.dart';
import 'package:yeka/helper/email_checker.dart';
import 'package:yeka/localization/language_constants.dart';
import 'package:yeka/provider/auth_provider.dart';

import 'package:yeka/provider/splash_provider.dart';
import 'package:yeka/util/dimensions.dart';
import 'package:yeka/view/basewidget/textfield/custom_label_textfield.dart';

import 'package:provider/provider.dart';

import '../../../basewidget/button/custom_elevated_button.dart';
import '../../../basewidget/button/custom_label_textfield_upload_button.dart';
import '../../../basewidget/dialog/single_text_alertdialog.dart';
import '../../../basewidget/radio/custom_small_radio_button.dart';
import '../../../basewidget/textarea/custom_textarea.dart';

import 'package:kpostal/kpostal.dart';

import '../auth_screen.dart';

class SignUpWidget extends StatefulWidget {
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  TextEditingController _idController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  TextEditingController _pwHintController = TextEditingController();
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

  FocusNode _fNameFocus = FocusNode();
  RegisterModel register = RegisterModel();

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

  bool isEmailVerified = false;

  addUser() async {
    String _id = _idController.text.trim();
    String _pw = _pwController.text.trim();
    String _pwHint = _pwHintController.text.trim();
    String _name = _nameController.text.trim();
    String _phone = _phoneController.text.trim();
    String _email = _emailController.text.trim();
    int _gender = radioButton1 ? 0 : 1;
    String _address1 = _address1Controller.text.trim();
    String _address2 = _address2Controller.text.trim();
    String _address3 = _address3Controller.text.trim();
    String _businessRegistrationNumber =
        _companyRegistrationNumberController.text.trim();

    if (_id.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(getTranslated('ID_FIELD_IS_REQUIRED', context)),
        backgroundColor: Colors.red,
      ));
    } else if (_pw.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(getTranslated('PW_FIELD_IS_REQUIRED', context)),
        backgroundColor: Colors.red,
      ));
    } else if (_pwHint.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(getTranslated('PASSWORD_DID_NOT_MATCH', context)),
        backgroundColor: Colors.red,
      ));
    } else if (_name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(getTranslated('NAME_FIELD_IS_REQUIRED', context)),
        backgroundColor: Colors.red,
      ));
    } else if (_phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(getTranslated('PHONE_FIELD_IS_REQUIRED', context)),
        backgroundColor: Colors.red,
      ));
    } else if (_email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(getTranslated('EMAIL_FIELD_IS_REQUIRED', context)),
        backgroundColor: Colors.red,
      ));
    } else if (EmailChecker.isNotValid(_email)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(getTranslated('ENTER_VALID_EMAIL_ADDRESS', context)),
        backgroundColor: Colors.red,
      ));
      // } else if (_gender.isEmpty) {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text(getTranslated('PASSWORD_MUST_BE_REQUIRED', context)),
      //     backgroundColor: Colors.red,
      //   ));
    } else if (_address1.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text(getTranslated('ADDRESS1_FIELD_IS_REQUIRED', context)),
        backgroundColor: Colors.red,
      ));
    } else if (_address2.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text(getTranslated('ADDRESS2_FIELD_IS_REQUIRED', context)),
        backgroundColor: Colors.red,
      ));
    } else if (_address3.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text(getTranslated('ADDRESS3_FIELD_IS_REQUIRED', context)),
        backgroundColor: Colors.red,
      ));
    } else {
      UserModel userModel = UserModel(
        user_type: _businessRegistrationNumber == "" ? 0 : 1,
        username: _id,
        password: _pw,
        name: _name,
        phone: _phone,
        email: _email,
        gender: _gender,
        address1: _address1,
        address2: _address2,
        address3: _address3,
        business_registration_number: _businessRegistrationNumber,
      );

      await Provider.of<AuthProvider>(context, listen: false)
          .registration(userModel, route);
    }
  }

  route(
      bool isRoute, String token, String tempToken, String errorMessage) async {
    if (isRoute) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("${getTranslated('JOIN_SUCCESS', context)}"),
          backgroundColor: Colors.green));
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => AuthScreen()), (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage), backgroundColor: Colors.red));
    }
  }

  @override
  void initState() {
    super.initState();
    Provider.of<SplashProvider>(context, listen: false).configModel;
    // _countryDialCode = CountryCode.fromCountryCode(Provider.of<SplashProvider>(context, listen: false).configModel.countryCode).dialCode;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // for first and last name
        CustomLabelTextField(
          autofocus: true,
          controller: _idController,
          labelText: "${getTranslated('ID', context)} ",
          essentialLabelText: " ${getTranslated('*', context)}",
          hintText: "${getTranslated('HINT_ID', context)}",
          focusNode: _fNameFocus,
        ),

        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

        CustomLabelTextField(
          controller: _pwController,
          labelText: "${getTranslated('PW', context)} ",
          essentialLabelText: " ${getTranslated('*', context)}",
          hintText: "${getTranslated('HINT_PW', context)}",
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
        ),

        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

        CustomLabelTextField(
          controller: _pwHintController,
          labelText: "${getTranslated('CONFIRM_PW', context)} ",
          essentialLabelText: " ${getTranslated('*', context)}",
          hintText: "${getTranslated('HINT_CONFIRM_PW', context)}",
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
        ),

        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

        CustomLabelTextField(
          controller: _nameController,
          labelText: "${getTranslated('NAME', context)} ",
          essentialLabelText: " ${getTranslated('*', context)}",
          hintText: "${getTranslated('HINT_NAME', context)}",
        ),

        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

        CustomLabelTextField(
          controller: _phoneController,
          labelText: "${getTranslated('PHONE', context)} ",
          essentialLabelText: " ${getTranslated('*', context)}",
          hintText: "${getTranslated('HINT_PHONE', context)}",
          isPhoneNumber: true,
          textInputType: TextInputType.number,
        ),

        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

        CustomLabelTextField(
          controller: _emailController,
          labelText: "${getTranslated('EMAIL', context)} ",
          essentialLabelText: " ${getTranslated('*', context)}",
          hintText: "${getTranslated('HINT_EMAIL', context)}",
        ),

        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

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
                    "${getTranslated('GENDER', context)} ",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    " ${getTranslated('*', context)}",
                    style: TextStyle(
                      color: Color(0xffff0000),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
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
                    ),
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
                hintText: "${getTranslated('SELECT_CITY', context)}",
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
                                  _address1Controller.text = result.postCode;
                                  _address2Controller.text = result.address;
                                });
                              },
                            ),
                          ),
                        );
                      },
                      buttonText: "${getTranslated('SEARCH', context)}",
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

        SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

        Row(
          children: [
            Expanded(
              child: const Divider(
                height: 5,
                thickness: 1,
                indent: 15,
                endIndent: 10,
                color: Colors.black12,
              ),
            ),
            Text(
              "${getTranslated('HINT_CONSULTANT_JOIN', context)}",
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            Expanded(
              child: const Divider(
                height: 5,
                thickness: 1,
                indent: 10,
                endIndent: 15,
                color: Colors.black12,
              ),
            ),
          ],
        ),

        SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

        CustomLabelTextField(
          controller: _companyRegistrationNumberController,
          labelText:
              "${getTranslated('COMPANY_REGISTRATION_NUMBER', context)} ",
          // essentialLabelText: " *",
          hintText:
              "${getTranslated('HINT_COMPANY_REGISTRATION_NUMBER', context)}",
        ),

        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

        Padding(
          padding: const EdgeInsets.fromLTRB(
            6.0,
            0.0,
            6.0,
            0.0,
          ),
          child: CustomLabelTextFieldUploadButton(
              controller: _companyRegistrationFileController,
              labelText:
                  "${getTranslated('COMPANY_REGISTRATION_NUMBER_FILE_ENROLL', context)}"),
        ),

        SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

        CustomTextarea(
          labelText: "${getTranslated('TERMS_OF_SERVICE', context)}",
          enabled: false,
          radioText: "${getTranslated('TERMS_OF_SERVICE_AGREE', context)}",
          radioButton: InkWell(
            onTap: () {
              setState(() {
                radioButton2 = !radioButton2;
                radioButton4 = false;
              });
            },
            child: CustomSmallRadioButton(
              value: radioButton2,
              reverse: true,
              text: "${getTranslated('TERMS_OF_SERVICE_AGREE', context)}",
            ),
          ),
        ),

        CustomTextarea(
          labelText: "${getTranslated('PRIVACY_POLICY', context)}",
          enabled: false,
          radioText: "${getTranslated('PRIVACY_POLICY_AGREE', context)}",
          radioButton: InkWell(
            onTap: () {
              setState(() {
                radioButton3 = !radioButton3;
                radioButton4 = false;
              });
            },
            child: CustomSmallRadioButton(
              value: radioButton3,
              reverse: true,
              text: "${getTranslated('PRIVACY_POLICY_AGREE', context)}",
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(4.0),
              margin: EdgeInsets.only(
                left: Dimensions.MARGIN_SIZE_DEFAULT,
                right: Dimensions.MARGIN_SIZE_DEFAULT,
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    radioButton4 = !radioButton4;
                    radioButton2 = radioButton4;
                    radioButton3 = radioButton4;
                  });
                },
                child: CustomSmallRadioButton(
                  value: radioButton4,
                  text: "${getTranslated('ALL_AGREE', context)}",
                  reverse: true,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
        CustomElevatedButton(
          onTap: () {
            if(radioButton2 && radioButton3) {
              addUser();
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) =>
                    SingleTextAlertDialog(
                      message:
                      "${getTranslated('CHECK_REQUIRED_TERMS', context)}",
                    ),
              );
            }
          },
          buttonText: "${getTranslated('MEMBER_JOIN', context)}",
        ),
      ],
    );
  }
}
