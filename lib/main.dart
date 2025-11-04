import 'dart:async';

import 'package:coin_hall/components/app_scaffold.dart';
import 'package:coin_hall/core/blocs/preferences_bloc/preferences_bloc.dart';
import 'package:coin_hall/core/blocs/reown/reown_bloc.dart';
import 'package:coin_hall/core/design_system/theme.dart';
import 'package:coin_hall/core/services/auth_interceptor/auth_interceptor.dart';
import 'package:coin_hall/core/services/reown/reown.dart';
import 'package:coin_hall/injection.dart';
import 'package:coin_hall/pages/auth/auth.dart';
import 'package:coin_hall/pages/home_page/home_page.dart';
import 'package:coin_hall/pages/nested/nested.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reown_appkit/modal/theme/public/appkit_modal_theme_widget.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toastification/toastification.dart';

part 'router/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final path = (await getTemporaryDirectory()).path;

  Hive.init(path);

  final storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(path),
  );

  HydratedBloc.storage = storage;

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(appInjection(const AutoShieldApp()));
}

class AutoShieldApp extends StatefulHookWidget {
  const AutoShieldApp({super.key});

  @override
  State<AutoShieldApp> createState() => AutoShieldAppState();
}

class AutoShieldAppState extends State<AutoShieldApp> with AutoShieldAppRouter {
  @override
  Widget build(BuildContext context) {
    final appRouter = useMemoized(() => router);
    final notifier = useMemoized(SplashState.new);

    return SplashStateProvider(
      notifier: notifier,
      child: BlocSelector<PreferencesBloc, PreferencesState, bool>(
        selector: (state) => state.isDark,
        builder: (context, isDark) {
          return ReownAppKitModalTheme(
            isDarkMode: isDark,
            child: ToastificationWrapper(
              config: const ToastificationConfig(
                maxToastLimit: 1,
                maxTitleLines: 4,
              ),
              child: MaterialApp.router(
                routerConfig: appRouter,
                title: 'Meta Coin Guard',
                theme: AutoShieldTheme()(isDark),
                builder: (context, child) {
                  return RepositoryProvider(
                    create: (context) =>
                        ReownService()..call(routerKey.currentContext!),
                    child: Builder(builder: (context) {
                      return BlocProvider(
                        create: (context) => ReownBloc(
                          authInterceptor: context.read(),
                          authService: context.read(),
                          reownService: context.read(),
                        )..add(ReownStarted()),
                        child: child,
                      );
                    }),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class SplashState extends ValueNotifier<bool> {
  SplashState() : super(false);

  void change() {
    value = true;
  }
}

class SplashStateProvider extends InheritedNotifier {
  const SplashStateProvider({
    required super.child,
    required SplashState super.notifier,
    super.key,
  });

  static SplashStateProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SplashStateProvider>();
  }

  @override
  bool updateShouldNotify(SplashStateProvider oldWidget) {
    return true;
  }
}
