import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fetch_list_base_state.dart';

abstract class FetchListBaseCubit<T> extends Cubit<FetchListBaseState<T>> {
  FetchListBaseCubit() : super(FetchListBaseInitial());

  Future<void> fetch() async {
    emit(FetchListBaseInProgress());

    try {
      final data = await fetcher();
      emit(FetchListBaseSuccess(
        data: data.data,
        totalCount: data.totalCount,
        page: 1,
      ));
    } catch (e) {
      emit(FetchListBaseFailure());
    }
  }

  Future<FetchListReponse<T>> fetcher();
}

mixin FetchMoreList<T> on FetchListBaseCubit<T> {
  Future<List<T>> moreFetcher(int page);

  Future<void> fetchMore() async {
    if (state is! FetchListBaseSuccess<T>) {
      return;
    }

    final current = state as FetchListBaseSuccess<T>;

    if (current.totalCount == null ||
        current.totalCount == current.data.length) {
      return;
    }

    emit(current.copyWith(isFetchingMore: true));

    final data = await moreFetcher(current.page + 1);

    emit(
      current.copyWith(
        page: current.page + 1,
        isFetchingMore: false,
        data: [
          ...current.data,
          ...data,
        ],
      ),
    );
  }
}
