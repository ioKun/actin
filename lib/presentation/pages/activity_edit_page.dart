import 'package:actin/presentation/widgets/my_image_picker.dart';
import 'package:actin/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ActivityEditPage extends StatelessWidget {
  final String activityId;

  const ActivityEditPage({Key key, @required this.activityId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final cityController = TextEditingController();
    final descriptionController = TextEditingController();
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      'Create activity',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      'Please fill out the information about the activity so that other activists can decide whether to participate in it',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(color: Colors.black26),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: 'Activity name'),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: cityController,
                      decoration:
                          InputDecoration(labelText: 'Choose activity city'),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      "Add activity picture",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Colors.black45),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    MyImagePicker(),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      'Accepted format: jpg, png',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(color: Colors.black26),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: descriptionController,
                      decoration:
                          InputDecoration(labelText: 'Tell about activity'),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      'Please add links to social networks so other activists can lern more about you',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(color: Colors.black26),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    RaisedButton(
                      onPressed: () {
                        print(nameController.text);
                        print(cityController.text);
                        print(descriptionController.text);
                      },
                      child: Text('SAVE ACTIVITY'),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    // CitySelector()
                  ],
                )),
          ),
        ));
  }
}
