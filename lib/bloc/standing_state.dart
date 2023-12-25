import 'package:equatable/equatable.dart';
import 'package:premier_league_table/models/model_standing_epl.dart';


class StandingState extends Equatable {
  const StandingState();

  @override
  List<Object?> get props => [];
}

class StandingInitial extends StandingState {
  @override
  List<Object?> get props => [];
}

class StandingLoadInProgress extends StandingState {
  @override
  List<Object?> get props => [];
}

class StandingLoadedSuccess extends StandingState {
  final Standing? standings;
  const StandingLoadedSuccess({required this.standings});
  @override
  List<Object?> get props => [standings];
}

class StandingError extends StandingState {
  final String message;

  const StandingError({required this.message});

  @override
  List<Object?> get props => [message];
}
