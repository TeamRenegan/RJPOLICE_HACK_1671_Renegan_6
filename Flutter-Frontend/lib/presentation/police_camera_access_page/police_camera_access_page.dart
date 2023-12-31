import '../police_camera_access_page/widgets/userprofile_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:hritika_s_application7/core/app_export.dart';
import 'package:hritika_s_application7/widgets/app_bar/appbar_leading_image.dart';
import 'package:hritika_s_application7/widgets/app_bar/appbar_trailing_image.dart';
import 'package:hritika_s_application7/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class PoliceCameraAccessPage extends StatelessWidget {
  const PoliceCameraAccessPage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 9.v),
          decoration: AppDecoration.fillOnPrimary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.v),
              _buildFootage(context),
              _buildUserProfile(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFootage(BuildContext context) {
    return SizedBox(
      height: 137.v,
      width: 370.h,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 85.h,
                bottom: 24.v,
              ),
              child: Text(
                "Footage",
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgImage223,
            height: 88.v,
            width: 108.h,
            alignment: Alignment.bottomLeft,
          ),
          CustomAppBar(
            leadingWidth: 63.h,
            leading: AppbarLeadingImage(
              imagePath: ImageConstant.imgImage231,
              margin: EdgeInsets.only(
                left: 16.h,
                top: 12.v,
                bottom: 16.v,
              ),
            ),
            actions: [
              AppbarTrailingImage(
                imagePath: ImageConstant.imgImage234,
                margin: EdgeInsets.only(
                  left: 20.h,
                  top: 15.v,
                  bottom: 16.v,
                ),
              ),
              AppbarTrailingImage(
                imagePath: ImageConstant.imgImage233,
                margin: EdgeInsets.only(left: 1.h),
              ),
              AppbarTrailingImage(
                imagePath: ImageConstant.imgImage232,
                margin: EdgeInsets.only(
                  top: 9.v,
                  right: 20.h,
                  bottom: 9.v,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
          left: 26.h,
          right: 16.h,
        ),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 35.v,
            );
          },
          itemCount: 3,
          itemBuilder: (context, index) {
            return UserprofileItemWidget();
          },
        ),
      ),
    );
  }
}
