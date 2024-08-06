import 'package:riverpod_clean_arch/presentation/screens/navigation_panel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common/resources/page_path.dart';
import '../presentation/screens/auth_module/login_screen.dart';
import '../presentation/screens/student_screen/student_screen.dart';
import '../presentation/screens/teacher_module/teacher_screen.dart';

///Glabal Keys for Navigation
// final GlobalKey<NavigatorState> _rootNavigatorKey =
//     GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'Home');
final GlobalKey<NavigatorState> _shellNavigatorTeacherKey =
    GlobalKey<NavigatorState>(debugLabel: 'TeacherModule');

final GlobalKey<OverlayState> overlayState = GlobalKey<OverlayState>();

class AppRouter extends ChangeNotifier {
  static List<RouteBase> get routes => [
        GoRoute(
          path: PagePath.Login,
          pageBuilder: (context, state) => const MaterialPage(
            child: Scaffold(
              body: LoginScreen(),
            ),
          ),
        ),
        StatefulShellRoute.indexedStack(
          builder: (BuildContext context, GoRouterState state,
              StatefulNavigationShell navigationShell) {
            return NavigationPanel(
              axis: Axis.vertical,
              navigationShell: navigationShell,
            );
          },
          branches: [
            StatefulShellBranch(
                navigatorKey: _shellNavigatorHomeKey,
                routes: <RouteBase>[
                  GoRoute(
                    path: PagePath.Home,
                    pageBuilder: (context, state) => const MaterialPage(
                      child: StudentScreen(),
                    ),
                  ),
                ]),
            StatefulShellBranch(
                navigatorKey: _shellNavigatorTeacherKey,
                routes: <RouteBase>[
                  GoRoute(
                    path: PagePath.TeacherScreen,
                    pageBuilder: (context, state) => const MaterialPage(
                      child: TeacherScreen(),
                    ),
                  ),
                ]),
          ],
        ),
      ];
}
