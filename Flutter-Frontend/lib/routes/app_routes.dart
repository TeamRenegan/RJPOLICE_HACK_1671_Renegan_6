import 'package:flutter/material.dart';
import 'package:hritika_s_application7/presentation/police_map_screen/police_map_screen.dart';
import 'package:hritika_s_application7/presentation/frame_seven_container_screen/frame_seven_container_screen.dart';
import 'package:hritika_s_application7/presentation/camera_details_screen/camera_details_screen.dart';
import 'package:hritika_s_application7/presentation/login_screen/login_screen.dart';
import 'package:hritika_s_application7/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String communityPage = '/community_page';

  static const String policeMapScreen = '/police_map_screen';

  static const String policeCameraAccessPage = '/police_camera_access_page';

  static const String frameSevenContainerScreen =
      '/frame_seven_container_screen';

  static const String cameraDetailsScreen = '/camera_details_screen';

  static const String loginScreen = '/login_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    policeMapScreen: (context) => PoliceMapScreen(),
    frameSevenContainerScreen: (context) => FrameSevenContainerScreen(),
    cameraDetailsScreen: (context) => CameraDetailsScreen(),
    loginScreen: (context) => LoginScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
