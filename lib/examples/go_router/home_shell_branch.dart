part of 'routes.dart';

@immutable
class HomeShellBranch extends StatefulShellBranch {
  HomeShellBranch()
      : super(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) {
                return const HomeScreen();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'details',
                  name: 'home-details',
                  builder: (BuildContext context, GoRouterState state) {
                    return const DetailsScreen('Home');
                  },
                ),
              ],
            ),
          ],
        );
}
