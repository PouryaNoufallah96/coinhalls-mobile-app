part of 'preferences_bloc.dart';

@JsonSerializable()
final class PreferencesState extends Equatable {
  const PreferencesState({
    this.isDark = false,
    this.isOnBoardingPass = false,
    this.isTermsAccepted = false,
  });

  factory PreferencesState.fromJson(Map<String, dynamic> json) =>
      _$PreferencesStateFromJson(json);

  final bool isOnBoardingPass;
  final bool isDark;
  final bool isTermsAccepted;

  PreferencesState copyWith({
    bool? isOnBoardingPass,
    bool? isDark,
    bool? isTermsAccepted,
  }) {
    return PreferencesState(
      isDark: isDark ?? this.isDark,
      isOnBoardingPass: isOnBoardingPass ?? this.isOnBoardingPass,
      isTermsAccepted: isTermsAccepted ?? this.isTermsAccepted,
    );
  }

  @override
  List<Object> get props => [isDark, isOnBoardingPass, isTermsAccepted];

  Map<String, dynamic> toJson() => _$PreferencesStateToJson(this);
}
