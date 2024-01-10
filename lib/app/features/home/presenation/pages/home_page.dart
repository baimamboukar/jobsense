import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:jobsense/app/extensions/contextx.dart';
import 'package:jobsense/app/extensions/numx.dart';
import 'package:jobsense/app/extensions/widgetx.dart';
import 'package:jobsense/app/features/auth/presentation/widgets/overlay_navigation.dart';
import 'package:jobsense/app/features/home/presenation/widgets/recent_jobs.dart';
import 'package:jobsense/app/features/home/presenation/widgets/welcome_tile.dart';

@RoutePage()
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ScrollController _scrollController = ScrollController();

  final double triggerPercentage = 0.8;
  final double reverseTriggerPercentage = 0.2;
  late OverlayEntry overlay;

  @override
  void initState() {
    super.initState();
  }

  void _postFrameCallback(_) {
    if (mounted) {
      overlay = _createOverLay(context);

      _showOverlayNavigation(context, overlay);
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(_postFrameCallback);
    return Scaffold(
      body: SingleChildScrollView(
        child: _ScrollListener(
          scrollController: _scrollController,
          triggerPercentage: triggerPercentage,
          reverseTriggerPercentage: reverseTriggerPercentage,
          child: Column(
            children: [
              34.vGap,
              const WelcomeTile().hPadding,
              14.vGap,
              // const Dashboard(),

              const SearchBox().hPadding,
              24.vGap,
              const RecentJobs().hPadding,
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

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
          navigationListener.resetIndex();
        } else if (scrollOffset / maxScrollExtent > triggerPercentage) {
          navigationListener.setIndex = 0;
        } else if (scrollOffset / minScrollExtent < reverseTriggerPercentage) {
          navigationListener.resetIndex();
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
