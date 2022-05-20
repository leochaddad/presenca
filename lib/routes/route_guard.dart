import 'package:auto_route/auto_route.dart';
import 'package:presenca_aluno/routes/router.gr.dart';
import 'package:presenca_aluno/services/auth_service.dart';

class RouteGuard extends AutoRedirectGuard {
  final AuthService authService;
  RouteGuard(this.authService) {
    authService.addListener(() {
      if (
        authService.user == null 
      ) {
        reevaluate();
      }
    });
  }
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {

    if (authService.user != null) return resolver.next();
    router.push(LoginRoute());
  }

  @override
  Future<bool> canNavigate(route) {
    return Future.value(authService.user != null);
  }

}