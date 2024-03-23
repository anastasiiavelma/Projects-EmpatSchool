import 'package:tasks/models/user.dart';

class Message {
  final int id;
  final User userSender;
  final String text;

  Message({
    required this.userSender,
    required this.text,
    required this.id,
  });
}

List<Message> messages = [
  Message(
    id: 0,
    userSender: users[1],
    text: 'Sent 15 minutes ago',
  ),
  Message(
    id: 1,
    userSender: users[3],
    text: 'Viewed: Monday',
  ),
  Message(
    id: 2,
    userSender: users[4],
    text: 'What a wonderful time!',
  ),
  Message(
    id: 3,
    userSender: users[2],
    text: 'Sent 1 hour ago',
  ),
  Message(
    id: 4,
    userSender: users[1],
    text: 'Sent 1 hour ago',
  ),
  Message(
    id: 5,
    userSender: users[4],
    text: 'Sent 1 hour ago',
  ),
  Message(
    id: 6,
    userSender: users[3],
    text: 'Viewed: Monday',
  ),
  Message(
    id: 7,
    userSender: users[4],
    text: 'What a wonderful time!',
  ),
];
