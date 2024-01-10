// ignore_for_file: lines_longer_than_80_chars

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jobsense/app/extensions/contextx.dart';
import 'package:jobsense/app/extensions/numx.dart';
import 'package:jobsense/app/extensions/widgetx.dart';
import 'package:jobsense/app/features/home/data/models/job.dart';
import 'package:jobsense/app/features/home/presenation/pages/home_page.dart';

@RoutePage()
class JobDescriptionPage extends StatefulWidget {
  const JobDescriptionPage({required this.job, super.key});
  final Job job;

  @override
  State<JobDescriptionPage> createState() => _JobDescriptionPageState();
}

class _JobDescriptionPageState extends State<JobDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            // leading: SizedBox.shrink(),
            expandedHeight: 274,
            flexibleSpace: SliverAppBarContent(),
          ),
          SliverToBoxAdapter(
            child: 24.vGap,
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 34,
              width: 234,
              decoration: BoxDecoration(
                color: context.colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  JobsenseTab(title: 'Overview', index: 0),
                  JobsenseTab(title: 'Qualifications', index: 1),
                  JobsenseTab(title: 'Benefits', index: 2),
                ],
              ),
            ).hPaddingx(28),
          ),
          SliverToBoxAdapter(
            child: 18.vGap,
          ),
          SliverToBoxAdapter(
            child: ValueListenableBuilder(
              valueListenable: descIndex,
              builder: (context, index, _) {
                return IndexedStack(
                  index: index,
                  children: const [
                    _DescSection(
                      title: 'About US',
                      content:
                          '''Enchirch Technologies is a cutting-edge technology company dedicated to transforming the landscape of DevOps and UX Engineering. We are passionate about creating innovative solutions that empower businesses to thrive in the digital era. Our team is composed of talented individuals who are committed to excellence and pushing the boundaries of technology.''',
                    ),
                    _DescSection(
                      title: 'Qualitifcations',
                      contentList: [
                        "Bachelor's degree in Computer Science, Software Engineering, or a related field.",
                        'Proven experience as a Software Engineer with a focus on DevOps and UX Engineering.',
                        'Strong proficiency in relevant programming languages, frameworks, and tools.',
                        'Solid understanding of software development principles and best practices.',
                        'Experience with DevOps processes, including CI/CD pipelines and automation tools.',
                        'Knowledge of UX design principles and tools.',
                        'Excellent problem-solving and analytical skills.',
                        'Effective communication and collaboration abilities.',
                      ],
                    ),
                  ],
                ).hPadding;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DescTabIndex extends ValueNotifier<int> {
  DescTabIndex() : super(0);

  // ignore: avoid_setters_without_getters
  set setIndex(int index) {
    value = index;
  }

  int get getIndex => value;
}

final descIndex = DescTabIndex();

class JobsenseTab extends StatelessWidget {
  const JobsenseTab({
    required this.title,
    required this.index,
    super.key,
  });
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: descIndex,
      builder: (context, activeIndex, _) {
        return GestureDetector(
          onTap: () {
            descIndex.setIndex = index;
          },
          child: Container(
            height: 34,
            width: 100,
            decoration: BoxDecoration(
              color: index == activeIndex
                  ? context.colorScheme.primary
                  : context.colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(child: Text(title)),
          ),
        );
      },
    );
  }
}

class _DescSection extends StatelessWidget {
  const _DescSection({
    required this.title,
    this.content,
    this.contentList,
  });
  final String title;
  final String? content;
  final List<String>? contentList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        14.vGap,
        Text(
          title,
          style: context.typography.bodyLarge!.copyWith(
            fontSize: 18.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        Visibility(
          visible: content != null && contentList == null,
          replacement: Column(
            children: contentList!
                .map(
                  (item) => Text(
                    '• $item',
                    style: context.typography.labelMedium,
                  ),
                )
                .toList(),
          ),
          child: Text(
            content!,
            style: context.typography.labelMedium,
          ),
        ),
      ],
    );
  }
}

class SliverAppBarContent extends StatelessWidget {
  const SliverAppBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: SizedBox(
        width: double.infinity,
        height: 274,
        child: ClipPath(
          clipper: TrapezoidalClipper(),
          child: ColoredBox(
            color: context.colorScheme.primary,
            child: const ContentWidget(),
          ),
        ),
      ),
    );
  }
}

class TrapezoidalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height - 20)
      ..quadraticBezierTo(
        size.width / 4,
        size.height,
        size.width / 2,
        size.height,
      )
      ..quadraticBezierTo(
        3 * size.width / 4,
        size.height,
        size.width,
        size.height - 20,
      )
      ..lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        14.vGap,
        CircleAvatar(
          backgroundColor: context.colorScheme.onPrimary,
          radius: 32,
          backgroundImage: const NetworkImage(
            'https://example.com/your_image.jpg',
          ), // Provide the image URL
        ),
        14.vGap,
        Text(
          'UX Designer',
          style: context.typography.bodyLarge!
              .copyWith(color: context.colorScheme.onPrimary, fontSize: 24),
        ),
        Text(
          'Enchird Technologies',
          style: context.typography.bodyLarge,
        ),
        8.vGap,
        const Wrap(
          spacing: 8,
          children: [
            Slug(content: 'UX Design'),
            Slug(content: 'Remote'),
            Slug(content: 'Contract'),
          ],
        ),
        14.vGap,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Yaounde Cameroon',
              style: context.typography.bodyLarge,
            ),
            Text(
              114000.currencyFormat,
              style: context.typography.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }
}
