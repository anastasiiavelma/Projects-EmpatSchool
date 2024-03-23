import 'package:flutter/material.dart';
import 'package:tasks/utils/constants.dart';
import 'package:tasks/widgets/post_widget.dart';
import 'package:tasks/widgets/stories_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Instagram', style: Theme.of(context).textTheme.titleLarge),
            const Spacer(),
            Icon(Icons.favorite_border,
                color: Theme.of(context).iconTheme.color,
                size: Theme.of(context).iconTheme.size),
            mediumSizedBoxSizeWidth,
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/messages'),
              child: Icon(Icons.near_me,
                  color: Theme.of(context).iconTheme.color,
                  size: Theme.of(context).iconTheme.size),
            ),
          ],
        ),
      ),
      body: const Column(
        children: [
          Stories(),
          divider,
          smallSizedBoxSizeHeight,
          InstagramPost(),
        ],
      ),
    );
  }
}
