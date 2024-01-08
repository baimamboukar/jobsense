import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:jobsense/app/common/widgets/button.dart';
import 'package:jobsense/app/extensions/contextx.dart';
import 'package:jobsense/app/extensions/numx.dart';
import 'package:jobsense/app/features/auth/domain/cubit/jobsense_auth_cubit.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

@RoutePage()
class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<JobsenseAuthCubit, JobsenseAuthState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        state.maybeMap(
          authenticated: (state) {
            context.router.replaceNamed('/jobsense-home');
          },
          orElse: () {},
          failure: (failure) => QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Authentication Error',
            text: failure.failure,
          ),
        );
      },
      child: Scaffold(
        // backgroundColor: context.theme.primaryColor,
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    context.colorScheme.primary.withOpacity(.7),
                    context.colorScheme.primary.withOpacity(.2),
                  ],
                ),
                image: const DecorationImage(
                  image: AssetImage(
                    Assets.assetsImagesHappy,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: context.theme.primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    colors: [
                      context.colorScheme.primary.withOpacity(.7),
                      context.colorScheme.primary.withOpacity(.8),
                      context.colorScheme.primary.withOpacity(.9),
                      context.colorScheme.primary.withOpacity(1),
                    ],
                  ),
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      'Omnisense AI',
                      style: context.theme.textTheme.displaySmall!.copyWith(
                        color: context.colorScheme.onPrimary,
                      ),
                    ),
                    AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Do everything with flex and confidence',
                          textStyle:
                              context.theme.textTheme.bodyMedium!.copyWith(
                            color: context.colorScheme.onPrimary,
                            fontSize: 14,
                          ),
                          speed: const Duration(milliseconds: 50),
                          cursor: '✨',
                        ),
                      ],
                      //totalRepeatCount: 4,
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                    ),
                    const Spacer(),
                    BlocBuilder<JobsenseAuthCubit, JobsenseAuthState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          initial: () => JobsenseButton(
                            text: 'Continue with Google',
                            color: context.colorScheme.onPrimary,
                            icon: const HeroIcon(HeroIcons.signal),
                            action: () {
                              context
                                  .read<JobsenseAuthCubit>()
                                  .loginWithGoogle();
                            },
                          ),
                          failure: (failure) => JobsenseButton(
                            text: 'Retry with Google',
                            color: context.colorScheme.onPrimary,
                            action: () {
                              context
                                  .read<JobsenseAuthCubit>()
                                  .loginWithGoogle();
                            },
                          ),
                          loading: () => Column(
                            children: [
                              const CircularProgressIndicator(),
                              Text(
                                'Loading...',
                                style: context.theme.textTheme.bodySmall,
                              ),
                            ],
                          ),
                          orElse: () => JobsenseButton(
                            text: 'Continue with Google',
                            icon: const HeroIcon(HeroIcons.commandLine),
                            color: context.colorScheme.onPrimary,
                            action: () {
                              context.router.pushNamed('/google-auth');
                            },
                          ),
                        );
                      },
                    ),
                    38.vGap,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
