import 'package:flutter/material.dart';
import 'package:yeka/data/model/body/register_model.dart';
import 'package:yeka/data/model/response/user_model.dart';
import 'package:yeka/helper/email_checker.dart';
import 'package:yeka/localization/language_constrants.dart';
import 'package:yeka/provider/auth_provider.dart';

import 'package:yeka/provider/splash_provider.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/view/basewidget/textfield/custom_label_textfield.dart';

import 'package:provider/provider.dart';

import '../../../basewidget/button/custom_elevated_button.dart';
import '../../../basewidget/button/custom_label_textfield_upload_button.dart';
import '../../../basewidget/radio/custom_small_radio_button.dart';
import '../../../basewidget/textarea/custom_textarea.dart';
import '../../../basewidget/textfield/custom_alert_text_textfield.dart';

import 'package:kpostal/kpostal.dart';

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
  TextEditingController _etcAddressTextController = TextEditingController();
  TextEditingController _companyRegistrationNumberController = TextEditingController();
  GlobalKey<FormState> _formKey;

  FocusNode _fNameFocus = FocusNode();
  FocusNode _lNameFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();
  FocusNode _phoneFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  FocusNode _confirmPasswordFocus = FocusNode();

  RegisterModel register = RegisterModel();

  bool radioButton1 = false; // gender
  bool radioButton2 = false;
  bool radioButton3 = false;
  bool radioButton4 = false;

  String postCode = '-';
  String address = '-';
  String latitude = '-';
  String longitude = '-';
  String kakaoLatitude = '-';
  String kakaoLongitude = '-';

  bool isEmailVerified = false;

  addUser() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      isEmailVerified = true;

      String _id = _idController.text.trim();
      String _pw = _pwController.text.trim();
      String _pwHint = _pwHintController.text.trim();
      String _name = _nameController.text.trim();
      String _phone = _phoneController.text.trim();
      String _email = _emailController.text.trim();
      String _phoneNumber = _countryDialCode + _phoneController.text.trim();
      String _etc = _etcAddressTextController.text.trim();
      String _businessRegistrationNumber = _companyRegistrationNumberController.text.trim();

      if (_id.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('first_name_field_is_required', context)),
          backgroundColor: Colors.red,
        ));
      } else if (_pw.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('last_name_field_is_required', context)),
          backgroundColor: Colors.red,
        ));
      } else if (_pwHint.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('last_name_field_is_required', context)),
          backgroundColor: Colors.red,
        ));
      } else if (_name.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('EMAIL_MUST_BE_REQUIRED', context)),
          backgroundColor: Colors.red,
        ));
      } else if (_email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('EMAIL_MUST_BE_REQUIRED', context)),
          backgroundColor: Colors.red,
        ));
      } else if (EmailChecker.isNotValid(_email)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('enter_valid_email_address', context)),
          backgroundColor: Colors.red,
        ));
      } else if (_phone.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('PHONE_MUST_BE_REQUIRED', context)),
          backgroundColor: Colors.red,
        ));
      } else if (_pw.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('PASSWORD_MUST_BE_REQUIRED', context)),
          backgroundColor: Colors.red,
        ));
      } else if (_pwHint.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text(getTranslated('CONFIRM_PASSWORD_MUST_BE_REQUIRED', context)),
          backgroundColor: Colors.red,
        ));
      } else if (_pw != _pwHint) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('PASSWORD_DID_NOT_MATCH', context)),
          backgroundColor: Colors.red,
        ));
      } else {
        register.fName = '${_idController.text}';
        register.lName = _pwController.text ?? " ";
        register.email = _emailController.text;
        register.phone = _phoneNumber;
        register.password = _pwHintController.text;
        UserModel userModel = UserModel(
          user_type: 0,
          username: _id,
          password: _pw,
          name: _name,
          phone: _phoneNumber,
          email: _email,
          gender: radioButton1 ? 0 : 1,
          address1: postCode,
          address2: address,
          address3: _etc,
          business_registration_number: _businessRegistrationNumber,
          // business_registration_file,
          // hashtag,
          // resume,
          // working_hour,
          // withdrawal,
          // bank1,
          // bank2,
          // bank3,
        );

        await Provider.of<AuthProvider>(context, listen: false)
            .registration(userModel, route);
      }
    } else {
      isEmailVerified = false;
    }
  }

  route(
      bool isRoute, String token, String tempToken, String errorMessage) async {
    String _phone = _countryDialCode + _phoneController.text.trim();
    if (isRoute) {
      if (Provider.of<SplashProvider>(context, listen: false)
          .configModel
          .emailVerification) {
        Provider.of<AuthProvider>(context, listen: false)
            .checkUsername(_emailController.text.toString(), tempToken)
            .then((value) async {
          if (value.isSuccess) {
            Provider.of<AuthProvider>(context, listen: false)
                .updateUsername(_emailController.text.toString());
          }
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage), backgroundColor: Colors.red));
    }
  }

  String _countryDialCode = "+880";

  @override
  void initState() {
    super.initState();
    Provider.of<SplashProvider>(context, listen: false).configModel;
    // _countryDialCode = CountryCode.fromCountryCode(Provider.of<SplashProvider>(context, listen: false).configModel.countryCode).dialCode;

    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // for first and last name
        CustomLabelTextField(
          controller: _idController,
          labelText: "${getTranslated('ID', context)} ",
          essentialLabelText: " *",
          hintText: "${getTranslated('HINT_ID', context)}",
        ),

        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

        CustomLabelTextField(
          controller: _pwController,
          labelText: "${getTranslated('PW', context)} ",
          essentialLabelText: " *",
          hintText: "${getTranslated('HINT_PW', context)}",
        ),

        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

        CustomLabelTextField(
          controller: _pwHintController,
          labelText: "${getTranslated('CONFIRM_PW', context)} ",
          essentialLabelText: " *",
          hintText: "${getTranslated('HINT_CONFIRM_PW', context)}",
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
                    "성별 ",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    " *",
                    style: TextStyle(
                      color: Color(0xffff0000),
                      fontSize: 9,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        radioButton1 = !radioButton1;
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
                        radioButton1 = !radioButton1;
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

        Row(
          children: [
            Flexible(
              flex: 2,
              child: Material(
                // elevation: 20.0,
                // shadowColor: Color(0XFF2434D7),
                borderRadius: BorderRadius.all(Radius.circular(8.0)),

                child: CustomAlertTextTextField(
                  hintText: "$postCode",
                  enabled: false,
                  isBorder: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 16),
                          backgroundColor: Color(0XFF2434D7),
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
                                    this.latitude = result.latitude.toString();
                                    this.longitude =
                                        result.longitude.toString();
                                    this.kakaoLatitude =
                                        result.kakaoLatitude.toString();
                                    this.kakaoLongitude =
                                        result.kakaoLongitude.toString();
                                  });
                                },
                              ),
                            ),
                          );
                        },
                        child: Text("${getTranslated('SEARCH', context)}"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
        Material(
          // elevation: 20.0,
          // shadowColor: Color(0XFF2434D7),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),

          child: CustomAlertTextTextField(
            hintText: "$address",
            enabled: false,
            isBorder: true,
            fillColor: Colors.white,
          ),
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
        Material(
          // elevation: 20.0,
          // shadowColor: Color(0XFF2434D7),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),

          child: CustomAlertTextTextField(
            controller: _etcAddressTextController,
            hintText: "${getTranslated('ETC_ADDRESS', context)}",
            isBorder: true,
            fillColor: Colors.white,
          ),
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

        CustomLabelTextFieldUploadButton(
            labelText:
                "${getTranslated('COMPANY_REGISTRATION_NUMBER_FILE_ENROLL', context)}"),

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
            addUser();
          },
          buttonText: "${getTranslated('MEMBER_JOIN', context)}",
        ),
      ],
    );
  }
}
