import 'package:flutter/material.dart';
import 'package:tasks/models/message.dart';
import 'package:tasks/utils/constants.dart';

class DetailImageMessage extends StatefulWidget {
  final Message message;
  const DetailImageMessage({super.key, required this.message});

  @override
  State<DetailImageMessage> createState() => _DetailImageMessageState();
}

class _DetailImageMessageState extends State<DetailImageMessage> {
  final List<String> photos = [
    'assets/images/post1.jpg',
    'assets/images/post2.jpg',
    'assets/images/post3.jpg',
    'assets/images/post3.jpg',
    'assets/images/post1.jpg',
    'assets/images/post2.jpg',
    'assets/images/post1.jpg',
    'assets/images/post2.jpg',
    'assets/images/post3.jpg',
    'assets/images/post3.jpg',
    'assets/images/post1.jpg',
    'assets/images/post2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: kPrimaryColor,
      ),
      body: Hero(
        tag: widget.message.id,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage:
                      AssetImage(widget.message.userSender.imageUrl ?? ''),
                ),
                largeSizedBoxSizeHeight,
                Text(widget.message.userSender.name,
                    style: Theme.of(context).textTheme.headlineLarge),
                largeSizedBoxSizeHeight,
                profileIcons(context),
                largeSizedBoxSizeHeight,
                profileButtons(context),
                SizedBox(
                  height: 400,
                  child: userPhotos(context),
                ),
                largeSizedBoxSizeHeight,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget profileButtons(context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Row(
          children: [
            Icon(
              Icons.local_florist,
              color: Theme.of(context).iconTheme.color,
              size: 24,
            ),
            smallMediumSizedBoxSizeWidth,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Theme', style: Theme.of(context).textTheme.titleMedium),
                  Text('Default',
                      style: Theme.of(context).textTheme.headlineSmall),
                ],
              ),
            ),
            spacer,
            Icon(
              Icons.keyboard_arrow_right,
              color: Theme.of(context).iconTheme.color,
              size: 24,
            ),
          ],
        ),
        mediumSizedBoxSizeHeight,
        Row(
          children: [
            Icon(
              Icons.lock,
              color: Theme.of(context).iconTheme.color,
              size: 24,
            ),
            smallMediumSizedBoxSizeWidth,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Security',
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),
            spacer,
            Icon(
              Icons.keyboard_arrow_right,
              color: Theme.of(context).iconTheme.color,
              size: 24,
            ),
          ],
        ),
      ],
    );
  }

  Widget profileIcons(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Column(
            children: [
              Icon(
                Icons.account_circle,
                color: Theme.of(context).iconTheme.color,
                size: 30,
              ),
              smallMediumSizedBoxSizeHeight,
              Text('Profile', style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Icon(
                Icons.search_outlined,
                color: Theme.of(context).iconTheme.color,
                size: 30,
              ),
              smallMediumSizedBoxSizeHeight,
              Text('Search', style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Icon(
                Icons.add_alert_outlined,
                color: Theme.of(context).iconTheme.color,
                size: 30,
              ),
              smallMediumSizedBoxSizeHeight,
              Text('Off notifi...',
                  style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Icon(
                Icons.more_horiz,
                color: Theme.of(context).iconTheme.color,
                size: 30,
              ),
              smallMediumSizedBoxSizeHeight,
              Text('Options', style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
        ),
      ],
    );
  }

  Widget userPhotos(context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Card(
          margin: smallPadding,
          elevation: 2.0,
          child: Image.asset(
            photos[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
