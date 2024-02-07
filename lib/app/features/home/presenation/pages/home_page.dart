import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:heroicons/heroicons.dart';
import 'package:jobsense/app/extensions/contextx.dart';
import 'package:jobsense/app/extensions/numx.dart';
import 'package:jobsense/app/extensions/widgetx.dart';
import 'package:jobsense/app/features/auth/domain/models/socialize.dart';
import 'package:jobsense/app/features/auth/presentation/widgets/overlay_navigation.dart';
import 'package:jobsense/app/features/home/data/models/job.dart';
import 'package:jobsense/app/features/home/presenation/widgets/recent_jobs.dart';
import 'package:jobsense/app/features/home/presenation/widgets/social_life.dart';
import 'package:jobsense/app/features/home/presenation/widgets/welcome_tile.dart';
import 'package:jobsense/app/router/router.gr.dart' as routes;

@RoutePage()
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ScrollController _scrollController = ScrollController();

  late OverlayEntry overlay;

  final double triggerPercentage = 0.8;
  final double reverseTriggerPercentage = 0.2;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    navigationListener.setIndex = 0;
    _scrollController.dispose();
    super.dispose();
  }

  void _postFrameCallback(_) {
    if (mounted) {
      //&& context.router.current.path != '/jobsense-home'
      overlay = _createOverLay(context);

      _showOverlayNavigation(context, overlay);
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(_postFrameCallback);
    return Scaffold(
      body: _ScrollListener(
        scrollController: _scrollController,
        triggerPercentage: triggerPercentage,
        reverseTriggerPercentage: reverseTriggerPercentage,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: ValueListenableBuilder(
            valueListenable: navigationListener,
            builder: (context, index, child) {
              return IndexedStack(
                index: index,
                children: const [
                  Text('Profile'),
                  SocialLife(),
                  JobListing(),
                  Socialize(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class JobListing extends StatelessWidget {
  const JobListing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        34.vGap,
        const WelcomeTile().hPadding,
        14.vGap,
        // const Dashboard(),

        const SearchBox().hPadding,
        24.vGap,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Selected for you',
              style: context.typography.bodyLarge,
            ),
            Row(
              children: [
                Text(
                  'See all',
                  style: context.typography.bodyMedium,
                ),
                HeroIcon(
                  HeroIcons.chevronRight,
                  color: context.colorScheme.onBackground,
                  size: 14,
                ),
              ],
            ),
          ],
        ).hPadding,
        14.vGap,
        const RelevantJobs(),

        34.vGap,
        const RecentJobs().hPadding,
      ],
    );
  }
}

class RelevantJobs extends StatelessWidget {
  const RelevantJobs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: ListView.builder(
        shrinkWrap: true,
        controller: ScrollController(),
        scrollDirection: Axis.horizontal,
        itemCount: jobs.length,
        itemBuilder: (BuildContext context, int index) {
          final job = jobs[index];
          return JobBox(job: job).hPadding;
        },
      ),
    );
  }
}

class JobBox extends StatelessWidget {
  const JobBox({
    required this.job,
    super.key,
  });
  final Job job;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(routes.JobDescriptionRoute(job: job));
      },
      child: Container(
        height: 174,
        width: context.width * .8,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            colors: [
              context.colorScheme.primary.withOpacity(.7),
              context.colorScheme.primary.withOpacity(.2),
            ],
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: context.colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      job.companyLogo,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                8.hGap,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(job.title),
                    Text(
                      job.company,
                      style: context.typography.labelMedium,
                    ),
                    Text(
                      '${job.location.city} • ${job.location.country}',
                      style: context.typography.labelSmall,
                    ),
                  ],
                ),
              ],
            ),
            8.vGap,
            Visibility(
              visible: job.machesProfile,
              replacement: Row(
                children: [
                  const HeroIcon(HeroIcons.lightBulb, size: 18),
                  2.hGap,
                  Text(
                    'You might be a good fit',
                    style: context.typography.labelLarge,
                  ),
                ],
              ),
              child: Row(
                children: [
                  const HeroIcon(HeroIcons.sparkles, size: 18),
                  2.hGap,
                  Text(
                    'Matches your profile',
                    style: context.typography.labelLarge,
                  ),
                ],
              ),
            ),
            8.vGap,
            Wrap(
              spacing: 8,
              children: job.tags.map((tag) => Slug(content: tag)).toList(),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const HeroIcon(HeroIcons.briefcase, size: 18),
                    2.hGap,
                    Text(
                      '2 days ago • ${job.applicantsCount} applicants',
                      style: context.typography.labelSmall,
                    ),
                  ],
                ),
                Text(
                  job.renumeration.currencyFormat,
                  style: context.typography.bodyLarge!.copyWith(
                    color: context.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ).hPadding.vPadding,
      ),
    );
  }
}

class Slug extends StatelessWidget {
  const Slug({
    required this.content,
    super.key,
  });
  final String content;

  @override
  Widget build(BuildContext context) {
    return GlassContainer.frostedGlass(
      height: 24,
      width: 74,
      borderRadius: BorderRadius.circular(8),
      child: Center(
        child: Text(
          content,
          style: context.typography.bodySmall,
        ),
      ),
    );
  }
}

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () async {
              await showModalBottomSheet<void>(
                context: context,
                builder: (context) => BottomSheet(
                  animationController: BottomSheet.createAnimationController(
                    this,
                  ),
                  showDragHandle: true,
                  builder: (context) => Container(
                    height: 200,
                  ),
                  onClosing: () {},
                ),
              );
            },
            child: const HeroIcon(HeroIcons.adjustmentsHorizontal),
          ),
          border: InputBorder.none,
          hintText: 'Search for jobs, cities or companies',
          hintStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}

class _ScrollListener extends StatelessWidget {
  const _ScrollListener({
    required this.child,
    required ScrollController scrollController,
    required this.triggerPercentage,
    required this.reverseTriggerPercentage,
    super.key,
  }) : _scrollController = scrollController;
  final Widget child;

  final ScrollController _scrollController;
  final double triggerPercentage;
  final double reverseTriggerPercentage;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (details) {
        final scrollOffset = _scrollController.position.pixels;
        final maxScrollExtent = _scrollController.position.maxScrollExtent;
        final minScrollExtent = _scrollController.position.minScrollExtent;

        if (scrollOffset == 0) {
          //navigationListener.setIndex = 0;
          navigationListener.resetIndex();
        } else if (scrollOffset / maxScrollExtent > triggerPercentage) {
          // navigationListener.setIndex = 0;
        } else if (scrollOffset / minScrollExtent < reverseTriggerPercentage) {
          // navigationListener.resetIndex();
        }

        return true;
      },
      child: child,
    );
  }
}

Future<void> _showOverlayNavigation(
  BuildContext context,
  OverlayEntry content,
) async {
  Future<void>.delayed(const Duration(milliseconds: 500), () {
    context.showOverlay(
      content,
    );
  });
}

OverlayEntry _createOverLay(BuildContext context) {
  final position = Offset((context.width - 200) / 2, 28);
  return OverlayEntry(
    builder: (context) => Positioned(
      bottom: position.dy,
      left: position.dx,
      child: const OverlayNavigationBar(),
    ),
  );
}
