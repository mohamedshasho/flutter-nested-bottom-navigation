part of 'routes.dart';

@immutable
class SettingsShellBranch extends StatefulShellBranch {
  SettingsShellBranch()
      : super(
          routes: [
            GoRoute(
              path: '/settings',
              builder: (BuildContext context, GoRouterState state) {
                return const SettingsScreen();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'details',
                  name: 'details',
                  builder: (BuildContext context, GoRouterState state) {
                    return const DetailsScreen('Settings');
                  },
                ),
              ],
            )
          ],
        );
}
