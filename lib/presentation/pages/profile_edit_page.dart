import 'package:actin/presentation/widgets/my_image_picker.dart';
import 'package:flutter/material.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Edit info',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Your Name'),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Choose your city'),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    "Change your Photo",
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
                    decoration:
                        InputDecoration(labelText: 'Tell about yourself'),
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
                    onPressed: null,
                    child: Text('SAVE PROFILE'),
                  )
                ],
              )),
        ));
  }
}
