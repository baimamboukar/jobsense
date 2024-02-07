import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsense/app/common/widgets/button.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
