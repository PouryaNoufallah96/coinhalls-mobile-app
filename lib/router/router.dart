part of '../main.dart';

final GlobalKey<NavigatorState> routerKey = GlobalKey();
final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>();

mixin AutoShieldAppRouter on State<AutoShieldApp> {
  bool isInAdd = false;

  GoRouter get router {
    return GoRouter(
      initialLocation: '/home_page',
      navigatorKey: routerKey,
      refreshListenable: _RouterRefreshStream(
        authStream: context.read<AuthInterceptor>().stream,
        preferencesStream: context.read<PreferencesBloc>().stream,
      ),
      redirect: (context, state) async {
        final streamValue = context.read<AuthInterceptor>().stream.value;
        final token = streamValue.token;

        isInAdd = state.matchedLocation == '/assets/add_shield';

        if (state.uri.toString().startsWith('metacoinguard') && isInAdd) {
          return null;
        }

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
                    return GameListCubit(gameService: context.read())..fetch();
                  },
                ),
                BlocProvider(
                  create: (context) {
                    return CategoriesCubit(gameService: context.read())
                      ..fetch();
                  },
                ),

                // BlocProvider(
                //   create: (context) => UserStatsCubit(
                //     statsService: context.read(),
                //   )..fetch(),
                //   lazy: false,
                // )
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
                  // routes: [
                  //   GoRoute(
                  //     parentNavigatorKey: routerKey,
                  //     path: 'add_shield',
                  //     name: 'add_shield',
                  //     builder: (context, state) {
                  //       final stat = switch (state.extra) {
                  //         final Map<String, dynamic> i =>
                  //           WalletStats.fromJson(i),
                  //         _ => state.extra! as WalletStats
                  //       };

                  //       return MultiBlocProvider(
                  //         providers: [
                  //           BlocProvider.value(
                  //             value: _sectionANavigatorKey.currentContext!
                  //                 .read<ShieldConfigCubit>(),
                  //           ),
                  //         ],
                  //         child: AddShieldPage(stat: stat),
                  //       );
                  //     },
                  //   )
                  // ],
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/settings',
                  builder: (context, state) {
                    return const SizedBox.shrink();
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
