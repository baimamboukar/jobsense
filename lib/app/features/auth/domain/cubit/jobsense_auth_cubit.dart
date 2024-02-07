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
      final user = await service.signUp(
        email: email,
        password: password,
        user: user,
      );
      emit(JobsenseAuthState.authenticated(user));
    } catch (e) {
      emit(JobsenseAuthState.failure(e.toString()));
    }
  }

  @override
  JobsenseAuthState? fromJson(Map<String, dynamic> json) {
    final user = json['user'] as bool;
    return user
        ? const JobsenseAuthState.authenticated()
        : const JobsenseAuthState.initial();
  }

  @override
  Map<String, dynamic>? toJson(JobsenseAuthState state) {
    return {
      'user': true,
    };
  }
}
