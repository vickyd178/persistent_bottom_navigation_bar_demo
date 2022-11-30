import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavController {
  static void navigate(
      {required BuildContext context,
      required Widget screen,
      required String name,
      PageTransitionAnimation? animation,
      Object? arguments}) {
    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
      context,
      pageTransitionAnimation: animation ?? PageTransitionAnimation.fade,
      screen: screen,
      settings: RouteSettings(
        name: name,
        arguments: arguments,
      ),
    );
  }
}
