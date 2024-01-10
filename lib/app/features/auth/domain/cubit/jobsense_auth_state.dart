part of 'jobsense_auth_cubit.dart';

@freezed
class JobsenseAuthState with _$JobsenseAuthState {
  const factory JobsenseAuthState.initial() = _Initial;

  /// Sigin in with email and password states
  const factory JobsenseAuthState.loading() = _Loading;
  const factory JobsenseAuthState.failure(String failure) = _Failure;

  // login with email and password states
  const factory JobsenseAuthState.loginLoading() = _LoginLoading;
  const factory JobsenseAuthState.loginFailure(String failure) = _LoginFailure;

  // logout states
  const factory JobsenseAuthState.logoutLoading() = _LogoutLoading;
  const factory JobsenseAuthState.logoutFailure(String failure) =
      _LogoutFailure;

  // authenticated state
  const factory JobsenseAuthState.authenticated() = _Authenticated;
}
