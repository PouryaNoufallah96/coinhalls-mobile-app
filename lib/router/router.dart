part of '../main.dart';

final GlobalKey<NavigatorState> routerKey = GlobalKey();
final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>();

mixin AutoShieldAppRouter on State<AutoShieldApp> {
  GoRouter get router {
    return GoRouter(
      initialLocation: '/home_page',
      navigatorKey: routerKey,
      refreshListenable: _RouterRefreshStream(
        authStream: context.read<AuthInterceptor>().stream,
        preferencesStream: context.read<PreferencesBloc>().stream,
      ),
      debugLogDiagnostics: true,
      onEnter: (context, current, next, router) async {
        final isDeepLink = next.uri.hasScheme || next.uri.host.isNotEmpty;

        if (!isDeepLink) return const Allow();

        return const Block.stop();
      },
      redirect: (context, state) {
        final streamValue = context.read<AuthInterceptor>().stream.value;
        final token = streamValue.token;

        final isLoggingIn = state.uri.path == '/';

        if (isLoggingIn) return token != null ? '/home_page' : null;

        return token != null ? null : '/';
      },
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: context.read<ReownBloc>(),
                ),
                BlocProvider(
                  create: (context) {
                    return CategoriesCubit(gameService: context.read())
                      ..fetch();
                  },
                ),
              ],
              child: StreamBuilder(
                  stream: context
                      .read<AuthInterceptor>()
                      .stream
                      .map((event) => event.token?.token)
                      .distinctUnique(equals: (e1, e2) => e1 != e2),
                  builder: (context, asyncSnapshot) {
                    if (asyncSnapshot.data == null) {
                      return AppScaffold();
                    }
                    return NestedPage(child: navigationShell);
                  }),
            );
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/history',
                  builder: (context, state) {
                    return const HistoryPage();
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _sectionANavigatorKey,
              routes: [
                GoRoute(
                  path: '/home_page',
                  builder: (context, state) {
                    return const HomePage();
                  },
                  routes: [
                    GoRoute(
                      parentNavigatorKey: routerKey,
                      path: 'select_game',
                      name: 'select_game',
                      builder: (context, state) {
                        final stat = state.uri.queryParameters['address']!;

                        return SelectGamePge(
                          token: stat,
                        );
                      },
                    ),
                    GoRoute(
                      parentNavigatorKey: routerKey,
                      path: 'place_guess',
                      name: 'place_guess',
                      builder: (context, state) {
                        final data = state.extra! as Map<String, dynamic>;

                        return PlaceGuessPage(
                          gameData: data,
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/settings',
                  builder: (context, state) {
                    return const SettingsPage();
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const AuthScreen(),
              transitionDuration: const Duration(milliseconds: 400),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                final offsetAnimation = Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(animation);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            );
          },
        ),
        // GoRoute(
        //   path: '/on_boarding',
        //   builder: (context, state) => const OnBoardingPage(),
        // ),
        // GoRoute(
        //   path: '/terms_of_use',
        //   builder: (context, state) => const TermsOfUsePage(),
        // )
      ],
    );
  }
}

class _RouterRefreshStream extends ChangeNotifier {
  _RouterRefreshStream({
    required Stream<PreferencesState> preferencesStream,
    required ValueStream<AuthContainer> authStream,
  }) {
    notifyListeners();
    _subscription = preferencesStream.listen((_) {
      notifyListeners();
    });
    _authSubscription = authStream.listen((_) {
      notifyListeners();
    });
  }

  late final StreamSubscription<dynamic> _subscription;
  late final StreamSubscription<AuthContainer> _authSubscription;

  @override
  void dispose() {
    _authSubscription.cancel();
    _subscription.cancel();
    super.dispose();
  }
}
