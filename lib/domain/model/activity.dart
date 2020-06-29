import 'package:actin/domain/model/location.dart';
import 'package:actin/domain/model/point.dart';
import 'package:actin/domain/model/user.dart';

class Activity {
  final String id;
  final String ownerId;
  final String name;
  final String status;
  final String description;
  final List<User> users;
  final Location location;
  final List<String> photos;

  Activity(
      {this.id,
      this.ownerId,
      this.name,
      this.status,
      this.description,
      this.users,
      this.location,
      this.photos});

  static Activity sampleActivity(int i) {
    final users = List.generate(3, (index) => User.sampleUser());
    final location =
        Location(country: 'Russia', city: 'Perm', geo: Point(0, 0));
    final images = List.generate(
        3,
        (index) =>
            'https://resize.indiatvnews.com/en/resize/newbucket/715_-/2018/09/eco-friendly-lifestyle-1536846426.jpeg');
    return Activity(
        id: 'id',
        ownerId: '',
        name: 'Cotiq Festival $i',
        status: 'Sample status $i',
        description:
            'The Singapore Cat Festival is the only event of its kind in Singapore, meant to celebrate the local cat community and culture. Whether you are a cat owner, enthusiast, or simply curious to learn more about these eccentric and lovable creatures, join us as we come together to celebrate our love for cats over a weekend of fun and activities!\n\n\nhttps://docs.google.com/document/d/184yIKXveKMrvG2ADS3VHQcmrmPYOfwxTd7VQV5KSP5k/edit\nhttps://t.me/joinchat/AAgAJxlu8nEJTkhO50ax2Q',
        users: users,
        location: location,
        photos: images);
  }

  @override
  String toString() {
    return 'Activity $name';
  }
}
