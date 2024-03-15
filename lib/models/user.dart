class User {
  final int id;
  final String name;
  late String? imageUrl;

  User({
    required this.id,
    required this.name,
    this.imageUrl,
  });
}

// users
List<User> users = [
  User(
    id: 0,
    name: 'My story',
    imageUrl: 'assets/images/me.jpg',
  ),
  User(
    id: 1,
    name: 'gojo_satoru',
    imageUrl: 'assets/images/gojo_satoru.jpg',
  ),
  User(
    id: 2,
    name: 'kaneki_ken',
    imageUrl: 'assets/images/kaneki.jpg',
  ),
  User(
    id: 3,
    name: 'sukuna',
    imageUrl: 'assets/images/sukuna.jpg',
  ),
  User(
    id: 4,
    name: 'haruka.ww',
    imageUrl: 'assets/images/me.jpg',
  ),
];
