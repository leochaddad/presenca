// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../pages/home.dart' as _i3;
import '../pages/login.dart' as _i1;
import '../pages/signup.dart' as _i2;
import '../pages/student_history.dart' as _i4;
import '../pages/teacher/new_presence_list.dart' as _i5;
import 'route_guard.dart' as _i8;

class AppRouter extends _i6.RootStackRouter {
  AppRouter(
      {_i7.GlobalKey<_i7.NavigatorState>? navigatorKey,
      required this.routeGuard})
      : super(navigatorKey);

  final _i8.RouteGuard routeGuard;

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.LoginPage(key: args.key));
    },
    SignupRoute.name: (routeData) {
      final args = routeData.argsAs<SignupRouteArgs>(
          orElse: () => const SignupRouteArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.SignupPage(key: args.key));
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomePage());
    },
    StudentHistoryRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.StudentHistoryPage());
    },
    NewPresenceListRoute.name: (routeData) {
      final args = routeData.argsAs<NewPresenceListRouteArgs>(
          orElse: () => const NewPresenceListRouteArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.NewPresenceListPage(key: args.key));
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(LoginRoute.name, path: '/login'),
        _i6.RouteConfig(SignupRoute.name, path: '/signup'),
        _i6.RouteConfig(HomeRoute.name, path: '/', guards: [routeGuard]),
        _i6.RouteConfig(StudentHistoryRoute.name, path: '/studentHistory'),
        _i6.RouteConfig(NewPresenceListRoute.name, path: '/newPresenceList')
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i7.Key? key})
      : super(LoginRoute.name, path: '/login', args: LoginRouteArgs(key: key));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.SignupPage]
class SignupRoute extends _i6.PageRouteInfo<SignupRouteArgs> {
  SignupRoute({_i7.Key? key})
      : super(SignupRoute.name,
            path: '/signup', args: SignupRouteArgs(key: key));

  static const String name = 'SignupRoute';
}

class SignupRouteArgs {
  const SignupRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'SignupRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.StudentHistoryPage]
class StudentHistoryRoute extends _i6.PageRouteInfo<void> {
  const StudentHistoryRoute()
      : super(StudentHistoryRoute.name, path: '/studentHistory');

  static const String name = 'StudentHistoryRoute';
}

/// generated route for
/// [_i5.NewPresenceListPage]
class NewPresenceListRoute extends _i6.PageRouteInfo<NewPresenceListRouteArgs> {
  NewPresenceListRoute({_i7.Key? key})
      : super(NewPresenceListRoute.name,
            path: '/newPresenceList', args: NewPresenceListRouteArgs(key: key));

  static const String name = 'NewPresenceListRoute';
}

class NewPresenceListRouteArgs {
  const NewPresenceListRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'NewPresenceListRouteArgs{key: $key}';
  }
}
