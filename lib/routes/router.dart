
import 'package:auto_route/auto_route.dart';
import 'package:presenca_aluno/pages/home.dart';
import 'package:presenca_aluno/pages/login.dart';
import 'package:presenca_aluno/pages/student_history.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: LoginPage,
    path: '/login',
    name: 'LoginRoute'
    ),
    AutoRoute(
      page: HomePage,
      name: 'HomeRoute',
      path: '/',
    ),
    AutoRoute(
      page: StudentHistoryPage,
      name: 'StudentHistoryRoute',
      path: '/studentHistory',
    ),

  ],
)
class $AppRouter {}
