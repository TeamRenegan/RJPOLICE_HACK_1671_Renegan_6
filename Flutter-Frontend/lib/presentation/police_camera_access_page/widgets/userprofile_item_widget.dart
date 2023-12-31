import 'package:flutter/material.dart';
import 'package:hritika_s_application7/core/app_export.dart';
import 'package:hritika_s_application7/widgets/custom_elevated_button.dart';
import 'package:hritika_s_application7/widgets/custom_outlined_button.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  const UserprofileItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(
            height: 220.v,
            width: 345.h,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgRectangle146,
                  height: 220.v,
                  width: 345.h,
                  radius: BorderRadius.circular(
                    2.h,
                  ),
                  alignment: Alignment.center,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgImage224,
                  height: 31.v,
                  width: 59.h,
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(right: 5.h),
                ),
              ],
            ),
          ),
          SizedBox(height: 22.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomElevatedButton(
                height: 40.v,
                width: 147.h,
                text: "Camera Details",
              ),
              CustomOutlinedButton(
                width: 175.h,
                text: "History/Recordings",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
