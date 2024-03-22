
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_practice/cart_screen.dart';
import 'package:go_router_practice/change_password.dart';
import 'package:go_router_practice/constants.dart';
import 'package:go_router_practice/dashboard_screen.dart';
import 'package:go_router_practice/sign_in_screen.dart';
import 'package:go_router_practice/sign_up_screen.dart';

/// Navigation using Push
/// Routes: Signup, Dashboard
/// Initial: Signup
/// Push -> Dashboard
/// Navigation Stack: Signup -> Dashboard
///
/// Navigation using Go
/// Routes: Signup/Signin, Dashboard,
/// Initial: Signup
/// Push -> Signin
/// Navigation Stack: Singup -> Signin
/// Go -> DashBoard
/// Navigation Stack: Dashboard
class CustomNavigationHelper {
  static final CustomNavigationHelper _instance =
      CustomNavigationHelper._internal();
  static late final GoRouter router;
  static CustomNavigationHelper get instance => _instance;
  factory CustomNavigationHelper() {
    return _instance;
  }
  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> changePasswordKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> signInKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> signUpKey =
      GlobalKey<NavigatorState>();
  CustomNavigationHelper._internal() {
    // Router initialization happens here.
    final List<RouteBase> routes = [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            navigatorKey: signInKey,
            routes: [
              GoRoute(
                path: signInPath,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    MaterialPage(
                  key: state.pageKey,
                  child: SignInScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: signUpKey,
            routes: [


              GoRoute(
                routes: [
                  GoRoute(
                    parentNavigatorKey: signUpKey,
                    path: cartPath,
                    name: cartPath,
                    pageBuilder: (BuildContext context, GoRouterState state) =>
                        MaterialPage(
                          key: state.pageKey,
                          child: CartScreen(),
                        ),
                  ),
                ],
                path: signUpPath,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    MaterialPage(
                      key: state.pageKey,
                      child: SignUpScreen(),
                    ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: changePasswordKey,
            routes: [
              GoRoute(
                path: changePasswordPath,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    MaterialPage(
                  key: state.pageKey,
                  child: ChangePasswordScreen(),
                ),
              ),
            ],
          ),

        ],
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return MaterialPage(
            key: state.pageKey,
            child: DashboardScreen(
              navigationShell: navigationShell,
            ),
          );
        },
      ),


      // ... other routes
    ];
    router = GoRouter(
        navigatorKey: parentNavigatorKey,
        initialLocation: signInPath,
        routes: routes,
        debugLogDiagnostics: true);
  }
}
