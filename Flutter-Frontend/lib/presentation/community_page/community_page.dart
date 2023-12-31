import '../community_page/widgets/dynamicview_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:hritika_s_application7/core/app_export.dart';
import 'package:hritika_s_application7/widgets/app_bar/appbar_leading_image.dart';
import 'package:hritika_s_application7/widgets/app_bar/appbar_trailing_image.dart';
import 'package:hritika_s_application7/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.only(
            left: 19.h,
            top: 17.v,
            right: 22.h,
          ),
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                height: 30.v,
              );
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return DynamicviewItemWidget();
            },
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 60.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgImage231,
        margin: EdgeInsets.only(
          left: 13.h,
          top: 14.v,
          bottom: 14.v,
        ),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgImage234,
          margin: EdgeInsets.only(
            left: 23.h,
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
            right: 23.h,
            bottom: 9.v,
          ),
        ),
      ],
    );
  }
}
