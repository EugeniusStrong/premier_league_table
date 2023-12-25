import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premier_league_table/api/api_standing.dart';
import 'package:premier_league_table/bloc/standing_event.dart';
import 'package:premier_league_table/bloc/standing_state.dart';

class StandingBloc extends Bloc<StandingEvent, StandingState> {
  final ApiStanding apiStanding;
  StandingBloc({required this.apiStanding}) : super(StandingInitial()) {
    on<StandingOpened>((event, emit) async {
      emit(StandingLoadInProgress());

      try {
        final standing = await apiStanding.getStandingData();
        emit(StandingLoadedSuccess(standings: standing));
      } catch (e) {
        emit(StandingError(message: e.toString()));
        debugPrint(e.toString());
      }
    });
  }
}
