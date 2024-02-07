import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsense/app/features/auth/domain/cubit/jobsense_auth_cubit.dart';
import 'package:jobsense/app/features/auth/domain/models/user_model.dart';

extension AuthCubitX on BuildContext {
  UserModel? get user => read<JobsenseAuthCubit>().state.maybeWhen(
        authenticated: (user) => user,
        orElse: () => null,
      );
  // Future<bool> refreshUser(UserModel user) async {
  //   try {
  //     await read<AuthCubit>().refreshUserData(id: user.owner_id!);
  //     return true;
  //   } catch (ex) {
  //     return false;
  //   }
  // }
}
