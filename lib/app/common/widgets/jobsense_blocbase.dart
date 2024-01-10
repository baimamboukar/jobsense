import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsense/app/features/auth/domain/cubit/jobsense_auth_cubit.dart';

class JobsenseBlocBase extends StatelessWidget {
  const JobsenseBlocBase({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<JobsenseAuthCubit>(
          create: (context) => JobsenseAuthCubit(),
        ),
      ],
      child: child,
    );
  }
}
