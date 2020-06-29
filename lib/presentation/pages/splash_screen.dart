import 'package:actin/injection.dart';
import 'package:actin/navigator.dart';
import 'package:actin/presentation/bloc/profile/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]); // disable system ui
    // SystemChrome.setEnabledSystemUIOverlays(
    //     SystemUiOverlay.values); // enable system ui
    // _startTimer(context);
    final _bloc = g<ProfileBloc>();
    _bloc.add(GetProfile(userId: ''));
    return BlocProvider<ProfileBloc>(
        create: (_) => _bloc,
        child:
            BlocConsumer<ProfileBloc, ProfileState>(listener: (context, state) {
          if (state is NoData) {
            ActinNavigator.activityList(context);
          } else if (state is Data) {
            ActinNavigator.activityList(context);
          }
        }, builder: (context, state) {
          return Container(
            child: Center(
              child: Text('S P L A S H\nS C R E E N'),
            ),
          );
        }));
  }

  // void _startTimer(BuildContext context) async {
  //   var _duration = new Duration(seconds: 2);
  //   Timer(_duration, () {
  //     ActinNavigator.mainPage(context);
  //   });
  // }
}
