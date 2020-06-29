import 'package:actin/domain/model/activity.dart';
import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  const ActivityCard({Key key, @required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 96,
              height: 96,
              child: Image.network(
                activity.photos[0],
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  activity.description,
                  maxLines: 3,
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            )),
            FlatButton(
              color: Theme.of(context).accentColor,
              child: Text(
                "ATTEND",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
