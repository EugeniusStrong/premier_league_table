import 'package:equatable/equatable.dart';

abstract class StandingEvent extends Equatable {
  const StandingEvent();

  @override
  bool? get stringify => true;
}

class StandingOpened extends StandingEvent {
  @override
  List<Object?> get props => [];
}
