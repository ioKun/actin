import 'package:actin/injection.dart';
import 'package:actin/navigator.dart';
import 'package:actin/presentation/pages/activities_list_page.dart';
import 'package:actin/presentation/pages/pages.dart';
import 'package:actin/presentation/pages/profile_edit_page.dart';
import 'package:actin/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';

import 'actin_theme.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //!!!IMPORTANT for async dependency injections
  await configureInjection(Env.dev);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ActinTheme.theme,
        home: SplashScreen(),
        routes: _routes,
        onGenerateRoute: _getRoute);
  }
}

final Map<String, Widget Function(BuildContext)> _routes = {
  ActinRoutes.activityList: (_) => ActivitiesListPage(),
  ActinRoutes.activityEdit: (_) => ActivityEditPage(
        activityId: null,
      ),
  ActinRoutes.profile: (_) => ProfilePage(),
  ActinRoutes.editProfile: (_) => ProfileEditPage(),
};

Route<dynamic> _getRoute(RouteSettings settings) {
  if (settings.name == ActinRoutes.activityDetails) {
    return _buildRoute(
        settings, ActivityDetailsPage(activityId: settings.arguments));
  } else if (settings.name == ActinRoutes.activityEdit) {
    return _buildRoute(
        settings, ActivityEditPage(activityId: settings.arguments));
  }
  return null;
}

MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
  return new MaterialPageRoute(
    settings: settings,
    builder: (ctx) => builder,
  );
}
