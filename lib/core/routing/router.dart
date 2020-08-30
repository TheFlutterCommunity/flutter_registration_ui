import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_registration_ui/core/routing/routes.dart';
import 'package:flutter_registration_ui/ui/views/home_view.dart';
import 'package:flutter_registration_ui/ui/views/sign_up_view.dart';

class PageRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.SignUpRoute:
        return _getPageRoute(SignUpView(), settings);
      case Routes.HomeRoute:
        return _getPageRoute(HomeView(), settings);
      default:
        return _getPageRoute(HomeView(), settings);

        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            body: Center(
              child: Text('The Page ${settings.name} does not exists.'),
            ),
          ),
        );
    }
  }

  static PageRoute _getPageRoute(Widget child, RouteSettings settings) {
    return _FadeRoute(child: child, routeName: settings.name, arguments: settings.arguments);
  }
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  final Object arguments;

  _FadeRoute({this.child, this.routeName, this.arguments})
      : super(
          settings: RouteSettings(name: routeName, arguments: arguments),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
