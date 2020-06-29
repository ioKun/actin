import 'package:actin/domain/model/activity.dart';
import 'package:actin/domain/model/user.dart';
import 'package:actin/injection.dart';
import 'package:actin/presentation/bloc/activity_details/activity_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class ActivityDetailsPage extends StatelessWidget {
  final String activityId;

  const ActivityDetailsPage({Key key, @required this.activityId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ActivityDetailsBloc>(
        create: (_) =>
            g<ActivityDetailsBloc>()..add(GetActivityData(activityId: '')),
        child: Scaffold(
          appBar: AppBar(),
          body: BlocBuilder<ActivityDetailsBloc, ActivityDetailsState>(
              builder: _mapStateToView),
        ));
  }

  Widget _mapStateToView(BuildContext context, ActivityDetailsState state) {
    if (state is ActivityLoading) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (state is ActivityLoaded) {
      return _showActivity(context, state.activity);
    } else if (state is ActivityFailure) {
      return Container(
        child: Center(
          child: Text(state.msg),
        ),
      );
    } else {
      return Text('INVALID');
    }
  }

  Widget _showActivity(BuildContext context, Activity a) {
    return SingleChildScrollView(
        child: Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _profile(context),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 100 * 30,
                child: Image.network(
                  a.photos[0],
                  fit: BoxFit.fitWidth,
                ),
              ),
              FlatButton(
                  color: Theme.of(context).accentColor,
                  child: Text(
                    "ATTEND",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(a.location.toString(),
                    style: Theme.of(context).textTheme.subtitle2),
                SizedBox(
                  height: 8.0,
                ),
                Text(a.name, style: Theme.of(context).textTheme.headline4),
                SizedBox(
                  height: 8.0,
                ),
                Text(a.status),
                SizedBox(
                  height: 8.0,
                ),
                Linkify(
                  onOpen: (link) =>
                      _launchURL(link.url), //print("Clicked ${}!"),
                  text: a.description,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text('Activists', style: Theme.of(context).textTheme.headline5),
                SizedBox(
                  height: 8.0,
                ),
                Divider(),
                SizedBox(
                  height: 8.0,
                ),
              ]..addAll(a.users.map((e) => _user(context, e)).toList()),
            ),
          )
        ],
      ),
    ));
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _user(BuildContext context, User user) => Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          ClipOval(
            child: SizedBox(
              width: 64.0,
              height: 64.0,
              child: Image.network(
                user.profileImg,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(
            width: 16.0,
          ),
          Text(
            "Ivan Lobanov",
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ));

  Widget _profile(BuildContext context) => Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          ClipOval(
            child: SizedBox(
              width: 64.0,
              height: 64.0,
              child: Image.network(
                'https://sun9-61.userapi.com/c857628/v857628225/109f49/_8S0atA17A0.jpg',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(
            width: 16.0,
          ),
          Text(
            "Ivan Lobanov",
            style: Theme.of(context).textTheme.headline5,
          ),
          Expanded(
            child: SizedBox(),
          ),
          Text("Profile"),
        ],
      ));
}
