import 'package:flutter/material.dart';
import 'package:hritika_s_application7/core/app_export.dart';
import 'package:hritika_s_application7/widgets/custom_elevated_button.dart';
import 'package:hritika_s_application7/widgets/custom_text_form_field.dart';

class CameraDetailsScreen extends StatelessWidget {
  CameraDetailsScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController cameraTypeController = TextEditingController();

  TextEditingController serialNumberValueController = TextEditingController();

  TextEditingController resolutionValueController = TextEditingController();

  TextEditingController paymentReceiptController = TextEditingController();

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
              padding: EdgeInsets.symmetric(horizontal: 51.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgImage105,
                    height: 45.v,
                    width: 48.h,
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(right: 112.h),
                  ),
                  SizedBox(height: 15.v),
                  SizedBox(
                    height: 39.v,
                    width: 244.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 113.h,
                              bottom: 4.v,
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
                            width: 244.h,
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
                                      left: 113.h,
                                      bottom: 4.v,
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
                  SizedBox(height: 49.v),
                  _buildCameraType(context),
                  SizedBox(height: 17.v),
                  _buildSerialNumberValue(context),
                  SizedBox(height: 16.v),
                  _buildResolutionValue(context),
                  SizedBox(height: 18.v),
                  Container(
                    margin: EdgeInsets.only(left: 3.h),
                    padding: EdgeInsets.symmetric(vertical: 7.v),
                    decoration: AppDecoration.fillGray.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 2.v),
                          child: Text(
                            "Field of view (angle captured)",
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgImage107,
                          height: 20.adaptSize,
                          width: 20.adaptSize,
                          radius: BorderRadius.circular(
                            4.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 17.v),
                  _buildPaymentReceipt(context),
                  SizedBox(height: 42.v),
                  _buildRegister(context),
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
  Widget _buildCameraType(BuildContext context) {
    return CustomTextFormField(
      controller: cameraTypeController,
      hintText: "Camera type/model",
    );
  }

  /// Section Widget
  Widget _buildSerialNumberValue(BuildContext context) {
    return CustomTextFormField(
      controller: serialNumberValueController,
      hintText: "Serial Number",
      textInputType: TextInputType.number,
    );
  }

  /// Section Widget
  Widget _buildResolutionValue(BuildContext context) {
    return CustomTextFormField(
      controller: resolutionValueController,
      hintText: "Resolution",
    );
  }

  /// Section Widget
  Widget _buildPaymentReceipt(BuildContext context) {
    return CustomTextFormField(
      controller: paymentReceiptController,
      hintText: "Payment Receipt/Camera Images ",
      textInputAction: TextInputAction.done,
    );
  }

  /// Section Widget
  Widget _buildRegister(BuildContext context) {
    return CustomElevatedButton(
      text: "REGISTER",
      buttonStyle: CustomButtonStyles.fillBlue,
      buttonTextStyle: CustomTextStyles.titleMediumDroidSansGray10001,
    );
  }
}
