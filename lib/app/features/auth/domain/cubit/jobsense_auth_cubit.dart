import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'jobsense_auth_state.dart';

class JobsenseAuthCubit extends Cubit<JobsenseAuthState> {
  JobsenseAuthCubit() : super(JobsenseAuthInitial());

  Future<void> loginWithGoogle() async {}
}
