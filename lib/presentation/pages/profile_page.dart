import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  final textSample =
      'Hi, I\'m an activist from Perm. My main interests are animal protection and urbanism.\n\nhttps://vk.com/daemith\nhttps://instagram.com/daemith';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 100 * 30,
                child: Image.network(
                    'https://sun9-61.userapi.com/c857628/v857628225/109f49/_8S0atA17A0.jpg',
                    fit: BoxFit.fitWidth),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text('Perm, Russia',
                  style: Theme.of(context).textTheme.subtitle2),
              SizedBox(
                height: 8.0,
              ),
              Text('Vasya Kotikov',
                  style: Theme.of(context).textTheme.headline4),
              SizedBox(
                height: 8.0,
              ),
              Linkify(
                onOpen: (link) => _launchURL(link.url), //print("Clicked ${}!"),
                text: textSample,
              ),
              SizedBox(
                height: 24.0,
              ),
              Text('Creator', style: Theme.of(context).textTheme.headline6),
              SizedBox(
                height: 8.0,
              ),
              Divider(),
              SizedBox(
                height: 8.0,
              ),
              Text('Attendee', style: Theme.of(context).textTheme.headline6),
              SizedBox(
                height: 8.0,
              ),
              Divider(),
              SizedBox(
                height: 8.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
