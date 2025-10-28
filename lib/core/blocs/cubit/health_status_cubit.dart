import 'package:bloc/bloc.dart';
import 'package:coin_hall/core/services/status_service/models.dart';
import 'package:coin_hall/core/services/status_service/status_service.dart';
import 'package:equatable/equatable.dart';

part 'health_status_state.dart';

class HealthStatusCubit extends Cubit<HealthStatusState> {
  HealthStatusCubit({
    required StatusService statusService,
  })  : _statusService = statusService,
        super(HealthStatusState());

  final StatusService _statusService;

  Future<void> fetch() async {
    final status = await _statusService.fetch();
    emit(state.copyWith(status: () => status));
  }
}
