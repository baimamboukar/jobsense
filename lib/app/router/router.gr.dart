// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i7;
import 'package:jobsense/app/features/auth/presentation/pages/authenitcation_page.dart'
    as _i1;
import 'package:jobsense/app/features/auth/presentation/pages/welcome.dart'
    as _i4;
import 'package:jobsense/app/features/home/data/models/job.dart' as _i6;
import 'package:jobsense/app/features/home/presenation/pages/home_page.dart'
    as _i2;
import 'package:jobsense/app/features/home/presenation/pages/job_description_page.dart'
    as _i3;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AuthenticationRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthenticationPage(),
      );
    },
    Homepage.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.Homepage(),
      );
    },
    JobDescriptionRoute.name: (routeData) {
      final args = routeData.argsAs<JobDescriptionRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.JobDescriptionPage(
          job: args.job,
          key: args.key,
        ),
      );
    },
    Welcome.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.Welcome(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthenticationPage]
class AuthenticationRoute extends _i5.PageRouteInfo<void> {
  const AuthenticationRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AuthenticationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticationRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Homepage]
class Homepage extends _i5.PageRouteInfo<void> {
  const Homepage({List<_i5.PageRouteInfo>? children})
      : super(
          Homepage.name,
          initialChildren: children,
        );

  static const String name = 'Homepage';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.JobDescriptionPage]
class JobDescriptionRoute extends _i5.PageRouteInfo<JobDescriptionRouteArgs> {
  JobDescriptionRoute({
    required _i6.Job job,
    _i7.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          JobDescriptionRoute.name,
          args: JobDescriptionRouteArgs(
            job: job,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'JobDescriptionRoute';

  static const _i5.PageInfo<JobDescriptionRouteArgs> page =
      _i5.PageInfo<JobDescriptionRouteArgs>(name);
}

class JobDescriptionRouteArgs {
  const JobDescriptionRouteArgs({
    required this.job,
    this.key,
  });

  final _i6.Job job;

  final _i7.Key? key;

  @override
  String toString() {
    return 'JobDescriptionRouteArgs{job: $job, key: $key}';
  }
}

/// generated route for
/// [_i4.Welcome]
class Welcome extends _i5.PageRouteInfo<void> {
  const Welcome({List<_i5.PageRouteInfo>? children})
      : super(
          Welcome.name,
          initialChildren: children,
        );

  static const String name = 'Welcome';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
