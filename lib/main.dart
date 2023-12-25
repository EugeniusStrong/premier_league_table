import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premier_league_table/api/api_standing.dart';
import 'package:premier_league_table/app_screens/standings_screen.dart';
import 'package:premier_league_table/bloc/standing_bloc.dart';
import 'package:premier_league_table/bloc/standing_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<StandingBloc>(
        create: (context) => StandingBloc(apiStanding: ApiStanding())
          ..add(
            StandingOpened(),
          ),
        child: const StandingsScreen(),
      ),
    );
  }
}
