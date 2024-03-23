import 'package:flutter/material.dart';
import 'package:tasks/models/post.dart';
import 'package:tasks/utils/constants.dart';

class InstagramPost extends StatelessWidget {
  const InstagramPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(post.user.imageUrl ?? ''),
                      ),
                      mediumSizedBoxSizeWidth,
                      Text(
                        post.user.name,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      spacer,
                      Icon(
                        Icons.more_horiz,
                        color: Theme.of(context).iconTheme.color,
                        size: Theme.of(context).iconTheme.size,
                      ),
                    ],
                  ),
                  mediumSizedBoxSizeHeight,
                  Image.asset(
                    post.imageUrl ?? '',
                    fit: BoxFit.cover,
                  ),
                  mediumSizedBoxSizeHeight,
                  instagramPostIcons(context),
                  mediumSizedBoxSizeHeight,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('${post.likes.toString()} likes',
                          style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.user.name,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      smallMediumSizedBoxSizeWidth,
                      Expanded(
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          post.text,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      largeSizedBoxSizeHeight,
                    ],
                  ),
                  mediumSizedBoxSizeHeight,
                  divider,
                ],
              ),
            );
          }),
    );
  }

  Widget instagramPostIcons(context) {
    return Row(
      children: [
        Icon(Icons.favorite_border_outlined,
            color: Theme.of(context).iconTheme.color,
            size: Theme.of(context).iconTheme.size),
        mediumSizedBoxSizeWidth,
        Icon(Icons.mode_comment_outlined,
            color: Theme.of(context).iconTheme.color, size: 22),
        mediumSizedBoxSizeWidth,
        Icon(Icons.near_me_outlined,
            color: Theme.of(context).iconTheme.color,
            size: Theme.of(context).iconTheme.size),
        const Spacer(),
        Icon(Icons.turned_in_not_outlined,
            color: Theme.of(context).iconTheme.color,
            size: Theme.of(context).iconTheme.size),
      ],
    );
  }
}
