part of 'health_status_cubit.dart';

class HealthStatusState with EquatableMixin {
  HealthStatusState({
    this.status,
  });

  final AppHealthStatus? status;

  @override
  List<Object?> get props => [];

  HealthStatusState copyWith({
    AppHealthStatus? Function()? status,
  }) {
    return HealthStatusState(
      status: status == null ? this.status : status(),
    );
  }
}
