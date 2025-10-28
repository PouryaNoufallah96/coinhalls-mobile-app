part of 'preferences_bloc.dart';

sealed class PreferencesEvent extends Equatable {
  const PreferencesEvent();

  @override
  List<Object> get props => [];
}

class PreferencesThemeToggled extends PreferencesEvent {}

class PreferencesOnBoardingPassed extends PreferencesEvent {}

class PreferencesTermsOfUsePassed extends PreferencesEvent {}
