// ignore_for_file: lines_longer_than_80_chars

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // leading: SizedBox.shrink(),
            expandedHeight: 224,
            flexibleSpace: SliverAppBarContent(job: widget.job),
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
                  children: [
                    Column(
                      children: [
                        const _DescSection(
                          title: 'About US',
                          content: about,
                        ),
                        const _DescSection(
                          title: 'Job Summary',
                          content: summary,
                        ),
                        _DescSection(
                          title: 'Responsabilities',
                          contentList: responsibilities,
                        ),
                      ],
                    ),
                    _DescSection(
                      title: 'Qualitifcations',
                      contentList: qualifs,
                    ),
                    _DescSection(
                      title: 'Benefits',
                      contentList: benefits,
                    ),
                  ],
                ).hPadding;
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 64,
              width: 200,
              decoration: BoxDecoration(
                color: context.colorScheme.primary,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeroIcon(
                    HeroIcons.sparkles,
                    color: context.colorScheme.onPrimary,
                  ),
                  12.hGap,
                  Text(
                    'Apply to this Job',
                    style: context.typography.bodyLarge!.copyWith(
                      fontSize: 18.5,
                      color: context.colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ).hPaddingx(44),
          ),
          SliverToBoxAdapter(
            child: 24.vGap,
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
        Row(
          children: [
            Text(
              title,
              style: context.typography.bodyLarge!.copyWith(
                fontSize: 18.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        14.vGap,
        Visibility(
          visible: content != null && contentList == null,
          replacement: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: (contentList ?? <String>[])
                .map(
                  (item) => Text(
                    '• $item',
                    style: context.typography.labelLarge,
                  ).vPaddingx(3.5),
                )
                .toList(),
          ).hPadding,
          child: Text(
            content.toString(),
            style: context.typography.labelMedium,
          ),
        ),
      ],
    );
  }
}

class SliverAppBarContent extends StatelessWidget {
  const SliverAppBarContent({required this.job, super.key});
  final Job job;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: SizedBox(
        width: double.infinity,
        height: 224,
        child: ClipPath(
          clipper: TrapezoidalClipper(),
          child: ColoredBox(
            color: context.colorScheme.primary,
            child: ContentWidget(job: job),
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
  const ContentWidget({required this.job, super.key});
  final Job job;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        14.vGap,
        CircleAvatar(
          backgroundColor: context.colorScheme.onPrimary,
          radius: 32,
          backgroundImage: AssetImage(job.companyLogo),
        ),
        8.vGap,
        Text(
          job.title,
          style: context.typography.bodyLarge!
              .copyWith(color: context.colorScheme.onPrimary, fontSize: 24),
        ),
        Text(
          job.company,
          style: context.typography.bodyLarge,
        ),
        8.vGap,
        Wrap(
          spacing: 8,
          children: job.tags.map((tag) => Slug(content: tag)).toList(),
        ),
        14.vGap,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${job.location.city} • ${job.location.country}',
              style: context.typography.bodyLarge,
            ),
            Text(
              job.renumeration.currencyFormat,
              style: context.typography.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }
}
