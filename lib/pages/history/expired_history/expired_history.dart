import 'package:coin_hall/core/blocs/fetch_list_base_cubit/fetch_list_base_cubit.dart';
import 'package:coin_hall/core/hooks/fetch_more.dart';
import 'package:coin_hall/core/services/prediction_service/models.dart';
import 'package:coin_hall/pages/history/expired_history/cubit/expired_history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ExpiredHistory extends StatelessWidget {
  const ExpiredHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpiredHistoryCubit,
        FetchListBaseState<PredictionHistory>>(
      builder: (context, state) {
        return switch (state) {
          final FetchListBaseInitial<PredictionHistory> _ =>
            const SizedBox.shrink(),
          final FetchListBaseInProgress<PredictionHistory> _ => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          final FetchListBaseSuccess<PredictionHistory> i =>
            _Body(orders: i.data),
          final FetchListBaseFailure<PredictionHistory> _ =>
            const SizedBox.shrink(),
        };
      },
    );
  }
}

class _Body extends HookWidget {
  const _Body({
    required this.orders,
  });

  final List<PredictionHistory> orders;

  @override
  Widget build(BuildContext context) {
    final scrollController = useFetchMore(() {
      context.read<ExpiredHistoryCubit>().fetchMore();
    });

    return RefreshIndicator(
      onRefresh: () => context.read<ExpiredHistoryCubit>().fetch(),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: scrollController,
        slivers: <Widget>[
          if (orders.isEmpty)
            const SliverFillRemaining(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 12,
                children: [
                  Icon(
                    Icons.hourglass_empty_rounded,
                    size: 28,
                    color: Colors.black,
                  ),
                  Text('No data'),
                ],
              ),
            )
          else ...[
            SliverList.separated(
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: SizedBox(height: 16),
                );
              },
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];

                return Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Text(
                    order.gameName,
                  ),
                );
              },
            ),
            SliverToBoxAdapter(
              child: BlocSelector<ExpiredHistoryCubit,
                  FetchListBaseState<PredictionHistory>, bool>(
                selector: (state) {
                  return (state as FetchListBaseSuccess).isFetchingMore;
                },
                builder: (context, state) {
                  if (!state) {
                    return const SizedBox.shrink();
                  }

                  return const Padding(
                    padding: EdgeInsets.all(24),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ],
      ),
    );
  }
}
