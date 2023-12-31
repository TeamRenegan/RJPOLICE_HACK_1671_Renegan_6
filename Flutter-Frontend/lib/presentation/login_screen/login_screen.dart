import 'package:flutter/material.dart';
import 'package:hritika_s_application7/core/app_export.dart';
import 'package:hritika_s_application7/widgets/custom_elevated_button.dart';
import 'package:hritika_s_application7/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController fullNameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: theme.colorScheme.onPrimary,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgFrameEight,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 48.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgImage105,
                    height: 45.v,
                    width: 47.h,
                  ),
                  SizedBox(height: 20.v),
                  SizedBox(
                    height: 39.v,
                    width: 243.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 108.h,
                              bottom: 9.v,
                            ),
                            child: Text(
                              "Camera Owner Registration Form".toUpperCase(),
                              style: theme.textTheme.bodyLarge,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 39.v,
                            width: 243.h,
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Camera Owner Registration Form"
                                        .toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.headlineLarge,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: 108.h,
                                      bottom: 9.v,
                                    ),
                                    child: Text(
                                      "Camera Owner Registration Form"
                                          .toUpperCase(),
                                      style: theme.textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 41.v),
                  _buildFullName(context),
                  SizedBox(height: 16.v),
                  _buildPhoneNumber(context),
                  SizedBox(height: 17.v),
                  _buildEmail(context),
                  SizedBox(height: 16.v),
                  _buildAddress(context),
                  SizedBox(height: 34.v),
                  _buildContinueButton(context),
                  SizedBox(height: 5.v),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFullName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 7.h),
      child: CustomTextFormField(
        controller: fullNameController,
        hintText: "Full Name",
        alignment: Alignment.centerLeft,
        borderDecoration: TextFormFieldStyleHelper.fillGrayTL4,
        fillColor: appTheme.gray100,
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 2.h,
        right: 7.h,
      ),
      child: CustomTextFormField(
        controller: phoneNumberController,
        hintText: "Phone Number",
        textInputType: TextInputType.phone,
        borderDecoration: TextFormFieldStyleHelper.fillGrayTL4,
        fillColor: appTheme.gray100,
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 2.h,
        right: 7.h,
      ),
      child: CustomTextFormField(
        controller: emailController,
        hintText: "Email Address",
        textInputType: TextInputType.emailAddress,
        borderDecoration: TextFormFieldStyleHelper.fillGrayTL4,
        fillColor: appTheme.gray100,
      ),
    );
  }

  /// Section Widget
  Widget _buildAddress(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 2.h,
        right: 7.h,
      ),
      child: CustomTextFormField(
        controller: addressController,
        hintText: "Address",
        textInputAction: TextInputAction.done,
        borderDecoration: TextFormFieldStyleHelper.fillGrayTL4,
        fillColor: appTheme.gray100,
      ),
    );
  }

  /// Section Widget
  Widget _buildContinueButton(BuildContext context) {
    return CustomElevatedButton(
      text: "CONTINUE",
      margin: EdgeInsets.only(right: 7.h),
      buttonStyle: CustomButtonStyles.fillPrimary,
      buttonTextStyle: CustomTextStyles.titleSmallDroidSansGray10001,
      alignment: Alignment.centerLeft,
    );
  }
}
