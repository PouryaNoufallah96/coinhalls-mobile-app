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
  });

  final List<T> data;

  @override
  List<Object?> get props => [data];
}

class FetchListBaseFailure<T> extends FetchListBaseState<T> {}
