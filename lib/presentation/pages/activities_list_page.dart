import 'package:actin/injection.dart';
import 'package:actin/navigator.dart';
import 'package:actin/presentation/bloc/activity_list/activity_list_bloc.dart';
import 'package:actin/presentation/widgets/app_drawer.dart';
import 'package:actin/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivitiesListPage extends StatelessWidget {
  const ActivitiesListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ActinNavigator.activityEdit(context, null);
        },
        child: Icon(Icons.add),
      ),
      body: BlocProvider<ActivityListBloc>(
        create: (_) => g<ActivityListBloc>()..add(GetActivities(city: '')),
        child:
            BlocBuilder<ActivityListBloc, ActivityListState>(builder: _build),
      ),
    );
  }

  Widget _build(BuildContext c, ActivityListState s) {
    if (s is ActivityListLoaded) {
      return ListView.builder(
        itemCount: s.activities.length,
        padding: const EdgeInsets.only(top: 8.0),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () =>
                ActinNavigator.activityDetails(context, s.activities[index].id),
            child: ActivityCard(
              activity: s.activities[index],
            ),
          );
        },
      );
    } else {
      return Center(
        child: Text('Empty'),
      );
    }
  }
}
