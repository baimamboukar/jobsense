import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:jobsense/app/common/widgets/button.dart';
import 'package:jobsense/app/extensions/contextx.dart';
import 'package:jobsense/app/extensions/numx.dart';
import 'package:jobsense/app/extensions/widgetx.dart';
import 'package:jobsense/app/features/auth/domain/models/post_model.dart';
import 'package:jobsense/app/features/home/presenation/widgets/welcome_tile.dart';

class SocialLife extends StatefulWidget {
  const SocialLife({super.key});

  @override
  State<SocialLife> createState() => _SocialLifeState();
}

class _SocialLifeState extends State<SocialLife> {
  @override
  Widget build(BuildContext context) {
    // const contentIsPublic = false;
    const url =
        'https://images.unsplash.com/photo-1508002366005-75a695ee2d17?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1936&q=80';
    return SingleChildScrollView(
      child: Column(
        children: [
          34.vGap,
          const WelcomeTile(),
          14.vGap,
          // const Dashboard(),

          Container(
            width: context.width,
            height: 98,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'What is on your mind ? ',
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: HeroIcon(HeroIcons.sparkles),
              ),
            ),
          ),
          12.vGap,
          // ListTile(
          //   leading: const HeroIcon(HeroIcons.globeEuropeAfrica),
          //   title: const Text('Make content public'),
          //   subtitle: Text(
          //     'Everyone can see your content',
          //     style: context.typography.bodyLarge!.copyWith(
          //       fontSize: 11,
          //     ),
          //   ),
          //   trailing: CupertinoSwitch(
          //     value: contentIsPublic,
          //     onChanged: (value) {
          //       setState(() {
          //         contentIsPublic = value;
          //       });
          //     },
          //   ),
          // ),
          JobsenseButton(
            text: 'Publish',
            icon:
                const HeroIcon(HeroIcons.cursorArrowRays, color: Colors.white),
            textColor: context.colorScheme.onPrimary,
            color: context.colorScheme.primary,
            action: () {},
          ),
          12.vGap,
          const Divider(),
          12.vGap,
          Row(
            children: [
              Text(
                'Trending on Jobsense',
                style: context.typography.bodyLarge!.copyWith(
                  fontSize: 18,
                ),
              ),
              14.vGap,
            ],
          ),
          for (final post in posts) Post(post: post),
        ],
      ).hPadding,
    );
  }
}

class Post extends StatelessWidget {
  const Post({
    required this.post,
    super.key,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: Builder(
                    builder: (context) {
                      final initials = post.name
                          .split(' ')
                          .map(
                            (word) =>
                                word.isNotEmpty ? word[0].toUpperCase() : '',
                          )
                          .join();
                      return Text(initials);
                    },
                  ),
                ),
                8.hGap,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      post.time,
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Icon(
                  Icons.more_horiz,
                  color: context.colorScheme.onSurface,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              post.content,
              style: const TextStyle(fontSize: 16),
            ),
            10.vGap,
            if (post.image != null)
              Image.network(
                post.image!,
                width: context.width,
                height: 200,
                fit: BoxFit.cover,
              ),
            10.vGap,
            Row(
              children: [
                const HeroIcon(HeroIcons.sparkles, color: Colors.amber),
                Text('${post.likesCount}'),
                20.hGap,
                const HeroIcon(HeroIcons.chatBubbleLeft),
                Text('${post.commentsCount}'),
              ],
            ),
            10.vGap,
          ],
        ),
      ),
    );
  }
}
