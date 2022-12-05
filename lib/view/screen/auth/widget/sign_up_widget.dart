import 'package:country_code_picker/country_code.dart';
import 'package:flutter/material.dart';
import 'package:yeka/data/model/body/register_model.dart';
import 'package:yeka/helper/email_checker.dart';
import 'package:yeka/localization/language_constrants.dart';
import 'package:yeka/provider/auth_provider.dart';

// import 'package:yeka/provider/profile_provider.dart';
import 'package:yeka/provider/splash_provider.dart';
import 'package:yeka/utill/color_resources.dart';
import 'package:yeka/utill/custom_themes.dart';
import 'package:yeka/utill/dimensions.dart';
import 'package:yeka/view/basewidget/button/custom_button.dart';
import 'package:yeka/view/basewidget/textfield/custom_password_textfield.dart';
import 'package:yeka/view/basewidget/textfield/custom_label_textfield.dart';
import 'package:yeka/view/screen/auth/widget/social_login_widget.dart';

// import 'package:yeka/view/screen/dashboard/dashboard_screen.dart';
import 'package:provider/provider.dart';

import '../../../basewidget/button/custom_elevated_button.dart';
import '../../../basewidget/button/custom_label_textfield_upload_button.dart';
import '../../../basewidget/radio/custom_radio_button.dart';
import '../../../basewidget/radio/custom_small_radio_button.dart';
import '../../../basewidget/textarea/custom_textarea.dart';
import '../../home/home_screens.dart';
import 'code_picker_widget.dart';
import 'otp_verification_screen.dart';

class SignUpWidget extends StatefulWidget {
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  GlobalKey<FormState> _formKey;

  FocusNode _fNameFocus = FocusNode();
  FocusNode _lNameFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();
  FocusNode _phoneFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  FocusNode _confirmPasswordFocus = FocusNode();

  RegisterModel register = RegisterModel();
  bool isEmailVerified = false;
  bool radioButton = false;

  addUser() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      isEmailVerified = true;

      String _firstName = _firstNameController.text.trim();
      String _lastName = _lastNameController.text.trim();
      String _email = _emailController.text.trim();
      String _phone = _phoneController.text.trim();
      String _phoneNumber = _countryDialCode + _phoneController.text.trim();
      String _password = _passwordController.text.trim();
      String _confirmPassword = _confirmPasswordController.text.trim();

      if (_firstName.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('first_name_field_is_required', context)),
          backgroundColor: Colors.red,
        ));
      } else if (_lastName.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('last_name_field_is_required', context)),
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
      } else if (_password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('PASSWORD_MUST_BE_REQUIRED', context)),
          backgroundColor: Colors.red,
        ));
      } else if (_confirmPassword.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text(getTranslated('CONFIRM_PASSWORD_MUST_BE_REQUIRED', context)),
          backgroundColor: Colors.red,
        ));
      } else if (_password != _confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(getTranslated('PASSWORD_DID_NOT_MATCH', context)),
          backgroundColor: Colors.red,
        ));
      } else {
        register.fName = '${_firstNameController.text}';
        register.lName = _lastNameController.text ?? " ";
        register.email = _emailController.text;
        register.phone = _phoneNumber;
        register.password = _passwordController.text;
        await Provider.of<AuthProvider>(context, listen: false)
            .registration(register, route);
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
            .checkEmail(_emailController.text.toString(), tempToken)
            .then((value) async {
          if (value.isSuccess) {
            Provider.of<AuthProvider>(context, listen: false)
                .updateEmail(_emailController.text.toString());
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (_) => VerificationScreen(
                        tempToken, '', _emailController.text.toString())),
                (route) => false);
          }
        });
      } else if (Provider.of<SplashProvider>(context, listen: false)
          .configModel
          .phoneVerification) {
        Provider.of<AuthProvider>(context, listen: false)
            .checkPhone(_phone, tempToken)
            .then((value) async {
          if (value.isSuccess) {
            Provider.of<AuthProvider>(context, listen: false)
                .updatePhone(_phone);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (_) => VerificationScreen(tempToken, _phone, '')),
                (route) => false);
          }
        });
      } else {
        //   await Provider.of<ProfileProvider>(context, listen: false).getUserInfo(context);
        //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => DashBoardScreen()), (route) => false);
        //   _emailController.clear();
        //   _passwordController.clear();
        //   _firstNameController.clear();
        //   _lastNameController.clear();
        //   _phoneController.clear();
        //   _confirmPasswordController.clear();
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
          controller: _firstNameController,
          labelText: "${getTranslated('ID', context)} ",
          essentialLabelText: " *",
          hintText: "${getTranslated('HINT_ID', context)}",
        ),

        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

        CustomLabelTextField(
          controller: _firstNameController,
          labelText: "${getTranslated('PW', context)} ",
          essentialLabelText: " *",
          hintText: "${getTranslated('HINT_PW', context)}",
        ),

        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

        CustomLabelTextField(
          controller: _firstNameController,
          labelText: "${getTranslated('CONFIRM_PW', context)} ",
          essentialLabelText: " *",
          hintText: "${getTranslated('HINT_CONFIRM_PW', context)}",
        ),

        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

        CustomLabelTextField(
          controller: _firstNameController,
          labelText: "${getTranslated('NAME', context)} ",
          essentialLabelText: " *",
          hintText: "${getTranslated('HINT_NAME', context)}",
        ),

        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

        CustomLabelTextField(
          controller: _firstNameController,
          labelText: "${getTranslated('PHONE', context)} ",
          essentialLabelText: " *",
          hintText: "${getTranslated('HINT_PHONE', context)}",
        ),

        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

        CustomLabelTextField(
          controller: _firstNameController,
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
                  CustomSmallRadioButton(
                      value: radioButton,
                      text: "${getTranslated('MALE', context)}"),
                  CustomSmallRadioButton(
                      value: radioButton,
                      text: "${getTranslated('FEMALE', context)}"),
                ],
              ),
            ],
          ),
        ),

        Row(
          children: [
            Expanded(
              child: CustomLabelTextField(
                controller: _firstNameController,
                labelText: "${getTranslated('ADDRESS', context)} ",
                essentialLabelText: " *",
                hintText: "${getTranslated('SELECT_CITY', context)}",
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: CustomLabelTextField(
                  controller: _firstNameController,
                  labelText: "",
                  essentialLabelText: "",
                  hintText: "${getTranslated('SELECT_DISTINCT', context)}",
                ),
              ),
            ),
          ],
        ),

        CustomLabelTextField(
          controller: _firstNameController,
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
          controller: _firstNameController,
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
        ),

        CustomTextarea(
          labelText: "${getTranslated('PRIVACY_POLICY', context)}",
          enabled: false,
          radioText: "${getTranslated('PRIVACY_POLICY_AGREE', context)}",
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
              child: CustomSmallRadioButton(
                value: radioButton,
                text: "${getTranslated('ALL_AGREE', context)}",
                reverse: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
