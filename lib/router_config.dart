part of 'main.dart';

GoRouter _routerConfig = GoRouter(
  initialLocation: '/loading',
  routes: [
    GoRoute(
      path: '/loading',
      pageBuilder: (context, state) => CupertinoPage(child: LoadingPage()),
    ),
    GoRoute(
      path: '/search',
      pageBuilder: (context, state) => CupertinoPage(child: SearchPage()),
      routes: [
        GoRoute(
          path: 'favorite',
          builder: (context, state) => FavoritePage(),
        ),
      ],
    ),
  ],
);
