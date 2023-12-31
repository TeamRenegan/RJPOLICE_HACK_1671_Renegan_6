import 'package:flutter/material.dart';
import 'package:hritika_s_application7/core/app_export.dart';

// ignore: must_be_immutable
class DynamicviewItemWidget extends StatelessWidget {
  const DynamicviewItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 11.h,
        vertical: 4.v,
      ),
      decoration: AppDecoration.outlineBlack,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 8.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 44.v,
              width: 179.h,
              margin: EdgeInsets.only(left: 5.h),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 139.h,
                      margin: EdgeInsets.only(bottom: 6.v),
                      child: Text(
                        "Firearm Discharge",
                        maxLines: null,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.labelLarge,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgImage143,
                          height: 44.v,
                          width: 39.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10.h,
                            bottom: 26.v,
                          ),
                          child: Text(
                            "Ankit Patne",
                            style: theme.textTheme.titleSmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 6.v),
          Container(
            width: 319.h,
            margin: EdgeInsets.only(
              left: 1.h,
              right: 4.h,
            ),
            child: Text(
              "Heard a gunshot at Waghuli chauk. Reporting a possible firearm discharge. Urgently need police investigation.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodySmall12,
            ),
          ),
          SizedBox(height: 10.v),
          CustomImageView(
            imagePath: ImageConstant.imgImage155,
            height: 66.v,
            width: 323.h,
            radius: BorderRadius.circular(
              5.h,
            ),
          ),
          SizedBox(height: 6.v),
          Padding(
            padding: EdgeInsets.only(
              left: 3.h,
              right: 1.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 46.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgImage122,
                        height: 17.adaptSize,
                        width: 17.adaptSize,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.v),
                        child: Text(
                          "234K",
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 24,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgImage157,
                  height: 15.adaptSize,
                  width: 15.adaptSize,
                  margin: EdgeInsets.only(top: 4.v),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 3.h,
                    top: 4.v,
                    bottom: 3.v,
                  ),
                  child: Text(
                    "14K",
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                Spacer(
                  flex: 23,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgImage158,
                  height: 21.v,
                  width: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 5.h,
                    top: 4.v,
                    bottom: 3.v,
                  ),
                  child: Text(
                    "64K",
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                Spacer(
                  flex: 52,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgImage159,
                  height: 13.adaptSize,
                  width: 13.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 4.v),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgImage160,
                  height: 17.v,
                  width: 15.h,
                  margin: EdgeInsets.only(left: 5.h),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
