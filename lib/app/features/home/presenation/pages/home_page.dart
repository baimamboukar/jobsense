import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jobsense/app/extensions/contextx.dart';
import 'package:jobsense/app/extensions/numx.dart';
import 'package:jobsense/app/extensions/widgetx.dart';
import 'package:jobsense/app/features/auth/presentation/widgets/overlay_navigation.dart';
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
              54.vGap,
              const WelcomeTile(),
            ],
          ).hPadding,
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
