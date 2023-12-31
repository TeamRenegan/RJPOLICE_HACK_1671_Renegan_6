import 'package:flutter/material.dart';
import 'package:hritika_s_application7/core/app_export.dart';
import 'package:hritika_s_application7/presentation/community_page/community_page.dart';
import 'package:hritika_s_application7/presentation/police_camera_access_page/police_camera_access_page.dart';
import 'package:hritika_s_application7/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class FrameSevenContainerScreen extends StatelessWidget {
  FrameSevenContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.policeCameraAccessPage,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(routeSetting.name!),
                    transitionDuration: Duration(seconds: 0))),
            bottomNavigationBar: Padding(
                padding: EdgeInsets.only(left: 38.h, right: 15.h),
                child: _buildBottomBar(context))));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
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
