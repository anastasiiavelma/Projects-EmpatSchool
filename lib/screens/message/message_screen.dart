import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tasks/models/message.dart';
import 'package:tasks/models/user.dart';
import 'package:tasks/screens/menu/drawer_menu.dart';
import 'package:tasks/screens/message/detail_profile_screen.dart';
import 'package:tasks/utils/constants.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        surfaceTintColor: kPrimaryColor,
        title: Row(
          children: [
            Text(users[4].name, style: Theme.of(context).textTheme.titleLarge),
            const Spacer(),
            Icon(Icons.add,
                color: Theme.of(context).iconTheme.color,
                size: Theme.of(context).iconTheme.size),
          ],
        ),
      ),
      body: Padding(
        padding: mediumPadding,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
                prefixIcon: const Padding(
                  padding: mediumPadding,
                  child: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 18.0,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                filled: true,
                fillColor: const Color.fromARGB(221, 237, 236, 236),
              ),
              style: const TextStyle(color: Colors.black),
            ),
            mediumSizedBoxSizeHeight,
            Row(
              children: [
                Text('Messages',
                    style: Theme.of(context).textTheme.titleMedium),
                const Spacer(),
                Text('Requests',
                    style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
            mediumSizedBoxSizeHeight,
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];

                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onDoubleTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailImageMessage(message: message),
                              ),
                            ),
                            child: Hero(
                              flightShuttleBuilder: (context,
                                  animation,
                                  flightDirection,
                                  fromHeroContext,
                                  toHeroContext) {
                                return SlideTransition(
                                  position: Tween<Offset>(
                                          begin: const Offset(0.0, 0.5),
                                          end: Offset.zero)
                                      .animate(animation),
                                  child: toHeroContext.widget,
                                );
                              },
                              tag: message.id,
                              child: CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage(
                                    message.userSender.imageUrl ?? ''),
                              ),
                            ),
                          ),
                          mediumSizedBoxSizeWidth,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(message.userSender.name,
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                              smallSizedBoxSizeHeight,
                              Text(message.text,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                            ],
                          ),
                          spacer,
                          Icon(Icons.photo_camera,
                              color: itemColor,
                              size: Theme.of(context).iconTheme.size),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddMessageDialog(context),
        backgroundColor: kAccentColor,
        shape: const CircleBorder(),
        child: SizedBox(
          width: 60.0,
          height: 60.0,
          child: Icon(
            Icons.add,
            color: kPrimaryColor,
            size: Theme.of(context).iconTheme.size,
          ),
        ),
      ),
    );
  }

  void _showAddMessageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text('Message')),
          content: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Write a message to random users!',
                ),
                TextField(
                  controller: _textController,
                  decoration: const InputDecoration(labelText: 'Message'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                String text = _textController.text.trim();
                int randomUser = Random().nextInt(5);
                if (text.isNotEmpty) {
                  Message newMessage = Message(
                    userSender: users[randomUser],
                    text: text,
                    id: UniqueKey().hashCode.abs(),
                  );

                  setState(() {
                    messages.insert(0, newMessage);
                  });

                  _nameController.clear();
                  _textController.clear();

                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
