import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fetch_list_base_state.dart';

abstract class FetchListBaseCubit<T> extends Cubit<FetchListBaseState<T>> {
  FetchListBaseCubit() : super(FetchListBaseInitial());

  Future<void> fetch() async {
    emit(FetchListBaseInProgress());

    try {
      final data = await fetcher();
      emit(FetchListBaseSuccess(data: data));
    } catch (e) {
      emit(FetchListBaseFailure());
    }
  }

  Future<List<T>> fetcher();
}
