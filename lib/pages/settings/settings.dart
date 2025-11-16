import 'package:coin_hall/components/auth_status.dart';
import 'package:coin_hall/core/blocs/cubit/health_status_cubit.dart';
import 'package:coin_hall/core/services/auth_interceptor/auth_interceptor.dart';
import 'package:coin_hall/core/services/auth_service/auth_service.dart';
import 'package:coin_hall/core/services/reown/reown.dart';
import 'package:coin_hall/core/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final canShowAction =
        context.watch<HealthStatusCubit>().state.status?.checked ?? false;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Image.asset('assets/images/settings_title.png', height: 40),
          Image.asset('assets/images/settings_art.png', height: 40),
          const SizedBox(height: 44),
          if (canShowAction) ...[
            DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xffFFDA95).withValues(alpha: .08),
                borderRadius: BorderRadius.circular(8),
              ),
              child: AppAuthStatus(
                appKit: context.read<ReownService>().appKitModal,
                mainAxisAlignment: MainAxisAlignment.start,
                builder: (context, isConnected, child) {
                  return InkWell(
                    onTap: () {
                      if (isConnected) {
                        context
                            .read<ReownService>()
                            .appKitModal
                            .openModalView();
                      } else {
                        context
                            .read<ReownService>()
                            .appKitModal
                            .openModalView();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        isConnected
                                            ? 'Connected Wallet'
                                            : 'Connected with WalletConnect',
                                        style: const TextStyle(
                                          fontFamily: 'CentraNo1-Medium',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                child,
                              ],
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor:
                                const Color(0xffFFDA95).withValues(alpha: .08),
                            child: const Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: Color(0xffFFEEB9),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
          const SizedBox(height: 24),
          const _Logout(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _Logout extends HookWidget {
  const _Logout();

  @override
  Widget build(BuildContext context) {
    final isLoading = useState(false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: FilledButton(
          onPressed: () async {
            isLoading.value = true;
            final isSucceed = await context.read<AuthService>().logout();

            isLoading.value = false;
            if (context.mounted && isSucceed) {
              context.read<AuthInterceptor>().clear();
            }
          },
          style: FilledButton.styleFrom(
            textStyle: const TextStyle(
              fontFamily: 'CentraNo1-Medium',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            foregroundColor: const Color(0xffffffff),
            backgroundColor: context.colorScheme.error,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(80),
            ),
          ),
          child: isLoading.value
              ? const SizedBox.square(
                  dimension: 24,
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation(
                      Colors.white,
                    ),
                  ),
                )
              : const Text('Log out'),
        ),
      ),
    );
  }
}
