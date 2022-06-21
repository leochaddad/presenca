
import 'package:auto_route/auto_route.dart';
import 'package:presenca_aluno/pages/home.dart';
import 'package:presenca_aluno/pages/login.dart';
import 'package:presenca_aluno/pages/signup.dart';
import 'package:presenca_aluno/pages/student_history.dart';
import 'package:presenca_aluno/routes/route_guard.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: LoginPage,
    path: '/login',
    name: 'LoginRoute',

    ),
    AutoRoute(page: SignupPage,
    path: '/signup',
    name: 'SignupRoute',
    ),
    AutoRoute(
      page: HomePage,
      name: 'HomeRoute',
      path: '/',
      guards: [RouteGuard]
    ),
    AutoRoute(
      page: StudentHistoryPage,
      name: 'StudentHistoryRoute',
      path: '/studentHistory',
    ),

  ],
)
class $AppRouter {}
