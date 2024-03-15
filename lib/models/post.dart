import 'package:tasks/models/user.dart';

class Post {
  final int id;
  final User user;
  final String text;
  final int likes;
  late String? imageUrl;

  Post({
    required this.user,
    required this.text,
    required this.id,
    required this.likes,
    this.imageUrl,
  });
}

List<Post> posts = [
  Post(
    id: 0,
    user: users[1],
    text: 'What a wonderful time!',
    imageUrl: 'assets/images/post1.jpg',
    likes: 100,
  ),
  Post(
    id: 0,
    user: users[2],
    text:
        'Great time! Time is one of the most mysterious and important aspects of our lives. It is a fundamental parameter of our existence, determining the sequence of events, changes and development.',
    imageUrl: 'assets/images/post2.jpg',
    likes: 100,
  ),
  Post(
    id: 0,
    user: users[4],
    text: 'I wish I could meet Gojo Satoru...',
    imageUrl: 'assets/images/post3.jpg',
    likes: 100,
  ),
  Post(
    id: 0,
    user: users[3],
    text: 'My fav place!',
    imageUrl: 'assets/images/post2.jpg',
    likes: 100,
  ),
];
