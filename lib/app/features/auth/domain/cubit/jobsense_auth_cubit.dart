import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:jobsense/app/features/auth/domain/auth_service.dart';
import 'package:jobsense/app/features/auth/domain/models/user_model.dart';

part 'jobsense_auth_cubit.freezed.dart';
part 'jobsense_auth_state.dart';

class JobsenseAuthCubit extends HydratedCubit<JobsenseAuthState> {
  JobsenseAuthCubit() : super(const JobsenseAuthState.initial());

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
    required UserModel user,
  }) async {
    emit(const JobsenseAuthState.loading());
    try {
      final service = AuthService();
      await service.signUp(
        email: email,
        password: password,
        user: user,
      );
      emit(JobsenseAuthState.authenticated(user: user));
    } catch (e) {
      emit(JobsenseAuthState.failure(e.toString()));
    }
  }

  Future<void> signOut() async {
    emit(const JobsenseAuthState.logoutLoading());
    try {
      final service = AuthService();
      await service.signOut();
      emit(const JobsenseAuthState.initial());
    } catch (e) {
      emit(JobsenseAuthState.logoutFailure(e.toString()));
    }
  }

  @override
  JobsenseAuthState? fromJson(Map<String, dynamic> json) {
    final userJson = json['user'] as Map<String, dynamic>;
    final user = UserModel.fromMap(userJson);
    return userJson.isNotEmpty
        ? JobsenseAuthState.authenticated(user: user)
        : const JobsenseAuthState.initial();
  }

  @override
  Map<String, dynamic>? toJson(JobsenseAuthState state) {
    return {
      'user': state.maybeMap(
        authenticated: (data) => data.user.toMap(),
        orElse: () => null,
      ),
    };
  }
}

@override
JobsenseAuthState? fromJson(Map<String, dynamic> json) {
  final userJson = json['user'] as Map<String, dynamic>;
  final user = UserModel.fromMap(userJson);
  return userJson.isNotEmpty
      ? JobsenseAuthState.authenticated(user: user)
      : const JobsenseAuthState.initial();
}

@override
Map<String, dynamic>? toJson(JobsenseAuthState state) {
  return {
    'user': state.maybeMap(
      authenticated: (data) => data.user.toMap(),
      orElse: () => null,
    ),
  };
}
