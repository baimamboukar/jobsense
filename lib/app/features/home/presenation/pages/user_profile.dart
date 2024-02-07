import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:jobsense/app/common/widgets/button.dart';
import 'package:jobsense/app/extensions/auth_cubit.dart';
import 'package:jobsense/app/extensions/contextx.dart';
import 'package:jobsense/app/extensions/numx.dart';
import 'package:jobsense/app/extensions/widgetx.dart';
import 'package:jobsense/app/features/auth/domain/cubit/jobsense_auth_cubit.dart';

@RoutePage()
class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  bool contentIsPublic = false;
  bool isDarkModeEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: Column(
        children: [
          14.vGap,
          const CircleAvatar(
            radius: 38,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1508002366005-75a695ee2d17?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1936&q=80',
            ),
          ),
          Text(
            context.user!.displayName,
            style: context.typography.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            'Software Engineer | Passionate | Tech Enthusiast',
            style: context.typography.bodyLarge!.copyWith(
              fontSize: 12,
            ),
          ),
          14.vGap,
          ListTile(
            leading: const HeroIcon(HeroIcons.globeEuropeAfrica),
            title: const Text('Private Content Mode'),
            subtitle: Text(
              'Make content pubic or private',
              style: context.typography.bodyLarge!.copyWith(
                fontSize: 11,
              ),
            ),
            trailing: CupertinoSwitch(
              value: contentIsPublic,
              onChanged: (value) {
                setState(() {
                  contentIsPublic = value;
                });
              },
            ),
          ),
          ListTile(
            leading: const HeroIcon(HeroIcons.cursorArrowRays),
            title: const Text('Dark Mode'),
            subtitle: Text(
              'Control app themes',
              style: context.typography.bodyLarge!.copyWith(
                fontSize: 11,
              ),
            ),
            trailing: CupertinoSwitch(
              value: isDarkModeEnabled,
              onChanged: (value) {
                setState(() {
                  isDarkModeEnabled = value;
                });
              },
            ),
          ),
          100.vGap,
          BlocBuilder<JobsenseAuthCubit, JobsenseAuthState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => JobsenseButton(
                  text: 'Log out',
                  textColor: context.colorScheme.onPrimary,
                  color: context.colorScheme.error,
                  action: () async {
                    await context.read<JobsenseAuthCubit>().signOut();
                    await context.router.replaceNamed('/welcome');
                  },
                ),
                loading: () {
                  return const LoadingButton(
                    text: 'Signing Out...',
                  );
                },
              );
            },
          ),
        ],
      ).hPadding,
    );
  }
}
