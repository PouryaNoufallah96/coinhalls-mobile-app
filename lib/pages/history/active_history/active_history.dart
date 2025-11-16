import 'package:coin_hall/core/blocs/fetch_list_base_cubit/fetch_list_base_cubit.dart';
import 'package:coin_hall/core/hooks/fetch_more.dart';
import 'package:coin_hall/core/services/prediction_service/models.dart';
import 'package:coin_hall/pages/history/active_history/cubit/active_history_cubit.dart';
import 'package:coin_hall/pages/history/widgets/history_item.dart';
import 'package:coin_hall/pages/history/widgets/history_symbol_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ActiveHistory extends HookWidget {
  const ActiveHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = useState('All');

    return Column(
      children: [
        SizedBox(
          height: 88,
          width: double.infinity,
          child: HistorySymbolFilter(
            notifier: notifier,
          ),
        ),
        BlocProvider(
          key: ValueKey(notifier.value),
          create: (context) {
            return ActiveHistoryCubit(
                predictionService: context.read(),
                symbol: notifier.value == 'All' ? null : notifier.value)
              ..fetch();
          },
          child: Expanded(
            child: BlocBuilder<ActiveHistoryCubit,
                FetchListBaseState<PredictionHistory>>(
              builder: (context, state) {
                return switch (state) {
                  final FetchListBaseInitial<PredictionHistory> _ =>
                    const SizedBox.shrink(),
                  final FetchListBaseInProgress<PredictionHistory> _ =>
                    const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  final FetchListBaseSuccess<PredictionHistory> i => _Body(
                      orders: i.data,
                      notifier: notifier,
                    ),
                  final FetchListBaseFailure<PredictionHistory> _ =>
                    const SizedBox.shrink(),
                };
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _Body extends HookWidget {
  const _Body({
    required this.orders,
    required this.notifier,
  });

  final List<PredictionHistory> orders;
  final ValueNotifier<String> notifier;

  @override
  Widget build(BuildContext context) {
    final scrollController = useFetchMore(() {
      context.read<ActiveHistoryCubit>().fetchMore();
    });

    return RefreshIndicator(
      onRefresh: () => context.read<ActiveHistoryCubit>().fetch(),
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
                    color: Colors.white,
                  ),
                  Text(
                    'No data',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
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
                  child: HistoryItem(
                    item: order,
                    onRefresh: () => context.read<ActiveHistoryCubit>().fetch(),
                  ),
                );
              },
            ),
            SliverToBoxAdapter(
              child: BlocSelector<ActiveHistoryCubit,
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
