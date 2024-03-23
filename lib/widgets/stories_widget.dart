import 'package:flutter/material.dart';
import 'package:tasks/models/user.dart';
import 'package:tasks/utils/constants.dart';

class Stories extends StatelessWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                Stack(alignment: Alignment.bottomRight, children: [
                  Container(
                    decoration: index == 0
                        ? BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.transparent,
                              width: 3,
                            ),
                          )
                        : BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.transparent,
                              width: 4,
                            ),
                            gradient: LinearGradient(
                              colors: [
                                borderColor1,
                                borderColor2,
                                borderColor3
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                          ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(user.imageUrl ?? ''),
                    ),
                  ),
                  if (index == 0)
                    Container(
                      padding: smallPadding,
                      decoration: BoxDecoration(
                        color: kAccentColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: kPrimaryColor,
                          width: 3,
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        size: 18,
                        color: kPrimaryColor,
                      ),
                    ),
                ]),
                smallSizedBoxSizeHeight,
                Text(
                  user.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
