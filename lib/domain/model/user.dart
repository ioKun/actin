class User {
  final String id;
  final String name;
  final String profileImg;
  final String description;

  User({this.id, this.name, this.profileImg, this.description});

  static User sampleUser() {
    return User(
        id: 'id',
        name: 'Sample Name',
        profileImg:
            'https://sun9-61.userapi.com/c857628/v857628225/109f49/_8S0atA17A0.jpg',
        description: 'Sample Description');
  }
}
