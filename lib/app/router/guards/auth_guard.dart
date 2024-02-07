import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final isUserAuthenticated = FirebaseAuth.instance.currentUser != null;
    if (isUserAuthenticated) {
      resolver.next();
    } else {
      resolver.next(false);
      router.pushNamed('/welcome');
    }
  }
}
