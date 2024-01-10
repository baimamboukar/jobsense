import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'jobsense_auth_cubit.freezed.dart';
part 'jobsense_auth_state.dart';

class JobsenseAuthCubit extends Cubit<JobsenseAuthState> {
  JobsenseAuthCubit() : super(const JobsenseAuthState.initial());

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(const JobsenseAuthState.loading());
    try {
      // final user = await _auth.signInWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );
      // emit(JobsenseAuthState.authenticated(user));
    } catch (e) {
      emit(JobsenseAuthState.failure(e.toString()));
    }
  }
}
