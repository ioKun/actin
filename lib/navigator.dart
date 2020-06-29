import 'package:flutter/material.dart';

class ActinRoutes {
  static final splash = "/splash";
  static final activityList = "/activityList";
  static final activityDetails = "/activityDetails";
  static final activityEdit = "/activityEdit";
  static final profile = "/profile";
  static final editProfile = "/profileEdit";
  static final register = "/register";
}

class ActinNavigator {
  static void splashScreen(BuildContext context) async {
    await Navigator.pushNamed(context, ActinRoutes.splash);
  }

  static void activityList(BuildContext context) async {
    await Navigator.pushNamed(context, ActinRoutes.activityList);
  }

  static void activityDetails(BuildContext context, String activityId) async {
    await Navigator.pushNamed(context, ActinRoutes.activityDetails,
        arguments: activityId);
  }

  static void activityEdit(BuildContext context, String activityId) async {
    await Navigator.pushNamed(context, ActinRoutes.activityEdit,
        arguments: activityId);
  }

  static void editProfile(BuildContext context) async {
    await Navigator.pushNamed(context, ActinRoutes.editProfile);
  }
}
