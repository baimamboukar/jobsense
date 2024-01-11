// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i8;
import 'package:jobsense/app/features/auth/presentation/pages/authenitcation_page.dart'
    as _i2;
import 'package:jobsense/app/features/auth/presentation/pages/welcome.dart'
    as _i5;
import 'package:jobsense/app/features/home/data/models/job.dart' as _i7;
import 'package:jobsense/app/features/home/presenation/pages/alters_page.dart'
    as _i1;
import 'package:jobsense/app/features/home/presenation/pages/home_page.dart'
    as _i3;
import 'package:jobsense/app/features/home/presenation/pages/job_description_page.dart'
    as _i4;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AlertsRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AlertsPage(),
      );
    },
    AuthenticationRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthenticationPage(),
      );
    },
    Homepage.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.Homepage(),
      );
    },
    JobDescriptionRoute.name: (routeData) {
      final args = routeData.argsAs<JobDescriptionRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.JobDescriptionPage(
          job: args.job,
          key: args.key,
        ),
      );
    },
    Welcome.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.Welcome(),
      );
    },
  };
}

/// generated route for
/// [_i1.AlertsPage]
class AlertsRoute extends _i6.PageRouteInfo<void> {
  const AlertsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AlertsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AlertsRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AuthenticationPage]
class AuthenticationRoute extends _i6.PageRouteInfo<void> {
  const AuthenticationRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AuthenticationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticationRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.Homepage]
class Homepage extends _i6.PageRouteInfo<void> {
  const Homepage({List<_i6.PageRouteInfo>? children})
      : super(
          Homepage.name,
          initialChildren: children,
        );

  static const String name = 'Homepage';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.JobDescriptionPage]
class JobDescriptionRoute extends _i6.PageRouteInfo<JobDescriptionRouteArgs> {
  JobDescriptionRoute({
    required _i7.Job job,
    _i8.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          JobDescriptionRoute.name,
          args: JobDescriptionRouteArgs(
            job: job,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'JobDescriptionRoute';

  static const _i6.PageInfo<JobDescriptionRouteArgs> page =
      _i6.PageInfo<JobDescriptionRouteArgs>(name);
}

class JobDescriptionRouteArgs {
  const JobDescriptionRouteArgs({
    required this.job,
    this.key,
  });

  final _i7.Job job;

  final _i8.Key? key;

  @override
  String toString() {
    return 'JobDescriptionRouteArgs{job: $job, key: $key}';
  }
}

/// generated route for
/// [_i5.Welcome]
class Welcome extends _i6.PageRouteInfo<void> {
  const Welcome({List<_i6.PageRouteInfo>? children})
      : super(
          Welcome.name,
          initialChildren: children,
        );

  static const String name = 'Welcome';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
