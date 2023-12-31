import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hritika_s_application7/core/app_export.dart';
import 'package:hritika_s_application7/presentation/community_page/community_page.dart';
import 'package:hritika_s_application7/presentation/police_camera_access_page/police_camera_access_page.dart';
import 'package:hritika_s_application7/widgets/app_bar/appbar_leading_image.dart';
import 'package:hritika_s_application7/widgets/app_bar/appbar_trailing_image.dart';
import 'package:hritika_s_application7/widgets/app_bar/custom_app_bar.dart';
import 'package:hritika_s_application7/widgets/custom_bottom_bar.dart';
import 'package:hritika_s_application7/widgets/custom_search_view.dart';

class PoliceMapScreen extends StatelessWidget {
  PoliceMapScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchController = TextEditingController();

  Completer<GoogleMapController> googleMapController = Completer();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 15.h,
            vertical: 6.v,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 6.h),
                child: CustomSearchView(
                  controller: searchController,
                  hintText: "Explore on Map",
                ),
              ),
              SizedBox(height: 31.v),
              _buildMap(context),
              SizedBox(height: 32.v),
              _buildLatestInJaipur(context),
              SizedBox(height: 7.v),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: 25.h,
            right: 17.h,
          ),
          child: _buildBottomBar(context),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 63.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgImage231,
        margin: EdgeInsets.only(
          left: 16.h,
          top: 9.v,
          bottom: 19.v,
        ),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgImage234,
          margin: EdgeInsets.only(
            left: 18.h,
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
            right: 18.h,
            bottom: 9.v,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildMap(BuildContext context) {
    return SizedBox(
      height: 388.v,
      width: 353.h,
      child: GoogleMap(
        //TODO: Add your Google Maps API key in AndroidManifest.xml and pod file
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            37.43296265331129,
            -122.08832357078792,
          ),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          googleMapController.complete(controller);
        },
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
        myLocationButtonEnabled: false,
        myLocationEnabled: false,
      ),
    );
  }

  /// Section Widget
  Widget _buildLatestInJaipur(BuildContext context) {
    return Container(
      width: 355.h,
      margin: EdgeInsets.only(right: 5.h),
      padding: EdgeInsets.symmetric(
        horizontal: 17.h,
        vertical: 11.v,
      ),
      decoration: AppDecoration.fillBlueGray,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 3.v),
          Text(
            "Latest in Jaipur",
            style: CustomTextStyles.titleMediumCyan600c4,
          ),
          SizedBox(height: 5.v),
          Container(
            width: 276.h,
            margin: EdgeInsets.only(right: 43.h),
            child: Text(
              "i.  Incident in progress:   Robbery at Smriti Van...",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyMediumInterBlack90014,
            ),
          ),
          SizedBox(height: 2.v),
          SizedBox(
            height: 25.v,
            width: 66.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 4.h,
                      bottom: 1.v,
                    ),
                    child: Text(
                      "Map View",
                      style: CustomTextStyles.bodySmallRegular,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 25.v,
                    width: 66.h,
                    decoration: BoxDecoration(
                      color: appTheme.lightBlueA400E5,
                      borderRadius: BorderRadius.circular(
                        4.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6.v),
          Container(
            width: 249.h,
            margin: EdgeInsets.only(right: 71.h),
            child: Text(
              "ii. Witnessing a robbery in progress at Jhotwara...",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyMediumInterBlack90014,
            ),
          ),
          SizedBox(height: 4.v),
          Container(
            height: 25.v,
            width: 66.h,
            margin: EdgeInsets.only(left: 3.h),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 4.h,
                      bottom: 2.v,
                    ),
                    child: Text(
                      "Map View",
                      style: CustomTextStyles.bodySmallRegular,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 25.v,
                    width: 66.h,
                    decoration: BoxDecoration(
                      color: appTheme.lightBlueA400E5,
                      borderRadius: BorderRadius.circular(
                        4.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.policeCameraAccessPage;
      case BottomBarEnum.Alerts:
        return "/";
      case BottomBarEnum.Community:
        return "/";
      case BottomBarEnum.Watchdesk:
        return AppRoutes.communityPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.policeCameraAccessPage:
        return PoliceCameraAccessPage();
      case AppRoutes.communityPage:
        return CommunityPage();
      default:
        return DefaultWidget();
    }
  }
}
