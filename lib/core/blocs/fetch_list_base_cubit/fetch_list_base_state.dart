part of 'fetch_list_base_cubit.dart';

sealed class FetchListBaseState<T> with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class FetchListBaseInitial<T> extends FetchListBaseState<T> {}

class FetchListBaseInProgress<T> extends FetchListBaseState<T> {}

class FetchListBaseSuccess<T> extends FetchListBaseState<T> {
  FetchListBaseSuccess({
    required this.data,
    required this.page,
    this.totalCount,
    this.isFetchingMore = false,
  });

  final List<T> data;
  final int? totalCount;
  final int page;
  final bool isFetchingMore;

  FetchListBaseSuccess<T> copyWith({
    List<T>? data,
    bool? isFetchingMore,
    int? page,
    int? Function()? totalCount,
  }) {
    return FetchListBaseSuccess(
      data: data ?? this.data,
      isFetchingMore: isFetchingMore ?? this.isFetchingMore,
      page: page ?? this.page,
      totalCount: totalCount == null ? this.totalCount : totalCount(),
    );
  }

  @override
  List<Object?> get props => [data, totalCount, page, isFetchingMore];
}

class FetchListBaseFailure<T> extends FetchListBaseState<T> {}

class FetchListReponse<T> {
  FetchListReponse({
    required this.data,
    this.totalCount,
  });

  final List<T> data;
  final int? totalCount;
}
