// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../pages/home.dart' as _i3;
import '../pages/login.dart' as _i1;
import '../pages/signup.dart' as _i2;
import '../pages/student/read_presence.dart' as _i8;
import '../pages/student_history.dart' as _i4;
import '../pages/teacher/new_presence_list.dart' as _i5;
import '../pages/teacher/presence_list.dart' as _i7;
import '../pages/teacher/presence_lists.dart' as _i6;
import 'route_guard.dart' as _i11;

class AppRouter extends _i9.RootStackRouter {
  AppRouter(
      {_i10.GlobalKey<_i10.NavigatorState>? navigatorKey,
      required this.routeGuard})
      : super(navigatorKey);

  final _i11.RouteGuard routeGuard;

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.LoginPage(key: args.key));
    },
    SignupRoute.name: (routeData) {
      final args = routeData.argsAs<SignupRouteArgs>(
          orElse: () => const SignupRouteArgs());
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.SignupPage(key: args.key));
    },
    HomeRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomePage());
    },
    StudentHistoryRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.StudentHistoryPage());
    },
    NewPresenceListRoute.name: (routeData) {
      final args = routeData.argsAs<NewPresenceListRouteArgs>(
          orElse: () => const NewPresenceListRouteArgs());
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.NewPresenceListPage(key: args.key));
    },
    PresenceListsRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.PresenceListsPage());
    },
    PresenceListRoute.name: (routeData) {
      final args = routeData.argsAs<PresenceListRouteArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.PresenceListPage(
              key: args.key, presenceList: args.presenceList));
    },
    ReadPresenceRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ReadPresencePage());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(LoginRoute.name, path: '/login'),
        _i9.RouteConfig(SignupRoute.name, path: '/signup'),
        _i9.RouteConfig(HomeRoute.name, path: '/', guards: [routeGuard]),
        _i9.RouteConfig(StudentHistoryRoute.name,
            path: '/studentHistory', guards: [routeGuard]),
        _i9.RouteConfig(NewPresenceListRoute.name,
            path: '/newPresenceList', guards: [routeGuard]),
        _i9.RouteConfig(PresenceListsRoute.name,
            path: '/presenceLists', guards: [routeGuard]),
        _i9.RouteConfig(PresenceListRoute.name,
            path: '/presenceList', guards: [routeGuard]),
        _i9.RouteConfig(ReadPresenceRoute.name,
            path: '/readPresence', guards: [routeGuard])
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i9.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i10.Key? key})
      : super(LoginRoute.name, path: '/login', args: LoginRouteArgs(key: key));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.SignupPage]
class SignupRoute extends _i9.PageRouteInfo<SignupRouteArgs> {
  SignupRoute({_i10.Key? key})
      : super(SignupRoute.name,
            path: '/signup', args: SignupRouteArgs(key: key));

  static const String name = 'SignupRoute';
}

class SignupRouteArgs {
  const SignupRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'SignupRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.StudentHistoryPage]
class StudentHistoryRoute extends _i9.PageRouteInfo<void> {
  const StudentHistoryRoute()
      : super(StudentHistoryRoute.name, path: '/studentHistory');

  static const String name = 'StudentHistoryRoute';
}

/// generated route for
/// [_i5.NewPresenceListPage]
class NewPresenceListRoute extends _i9.PageRouteInfo<NewPresenceListRouteArgs> {
  NewPresenceListRoute({_i10.Key? key})
      : super(NewPresenceListRoute.name,
            path: '/newPresenceList', args: NewPresenceListRouteArgs(key: key));

  static const String name = 'NewPresenceListRoute';
}

class NewPresenceListRouteArgs {
  const NewPresenceListRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'NewPresenceListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.PresenceListsPage]
class PresenceListsRoute extends _i9.PageRouteInfo<void> {
  const PresenceListsRoute()
      : super(PresenceListsRoute.name, path: '/presenceLists');

  static const String name = 'PresenceListsRoute';
}

/// generated route for
/// [_i7.PresenceListPage]
class PresenceListRoute extends _i9.PageRouteInfo<PresenceListRouteArgs> {
  PresenceListRoute({_i10.Key? key, required Map<String, dynamic> presenceList})
      : super(PresenceListRoute.name,
            path: '/presenceList',
            args: PresenceListRouteArgs(key: key, presenceList: presenceList));

  static const String name = 'PresenceListRoute';
}

class PresenceListRouteArgs {
  const PresenceListRouteArgs({this.key, required this.presenceList});

  final _i10.Key? key;

  final Map<String, dynamic> presenceList;

  @override
  String toString() {
    return 'PresenceListRouteArgs{key: $key, presenceList: $presenceList}';
  }
}

/// generated route for
/// [_i8.ReadPresencePage]
class ReadPresenceRoute extends _i9.PageRouteInfo<void> {
  const ReadPresenceRoute()
      : super(ReadPresenceRoute.name, path: '/readPresence');

  static const String name = 'ReadPresenceRoute';
}
