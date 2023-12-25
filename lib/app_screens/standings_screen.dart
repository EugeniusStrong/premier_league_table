import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premier_league_table/bloc/standing_bloc.dart';
import 'package:premier_league_table/bloc/standing_state.dart';

class StandingsScreen extends StatelessWidget {
  const StandingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ENGLISH PREMIER LEAGUE 2023/2024'),
        centerTitle: true,
      ),
      body: BlocBuilder<StandingBloc, StandingState>(
        builder: (context, state) {
          if (state is StandingInitial || state is StandingLoadInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is StandingLoadedSuccess) {
            return Column(
              children: [
                Table(
                  columnWidths: const {
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(5),
                  },
                  children: [
                    TableRow(
                      children: [
                        _buildTableRow('', Colors.blue,
                            const TextStyle(color: Colors.white)),
                        _buildTableRow('', Colors.white,
                            const TextStyle(color: Colors.white)),
                        _buildTableRow(
                            'Teams',
                            Colors.white,
                            TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[800])),
                        _buildTableRow('Pl', Colors.blue[200]!,
                            const TextStyle(fontSize: 17)),
                        _buildTableRow('W', Colors.blue[100]!,
                            const TextStyle(fontSize: 14)),
                        _buildTableRow('L', Colors.blue[100]!,
                            const TextStyle(fontSize: 14)),
                        _buildTableRow('D', Colors.blue[100]!,
                            const TextStyle(fontSize: 14)),
                        _buildTableRow(
                            'GF', Colors.white, const TextStyle(fontSize: 14)),
                        _buildTableRow(
                            'GA', Colors.white, const TextStyle(fontSize: 14)),
                        _buildTableRow(
                            'GD', Colors.white, const TextStyle(fontSize: 14)),
                        _buildTableRow('PT', Colors.redAccent,
                            const TextStyle(color: Colors.white, fontSize: 16)),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.standings!.items![0].standings!.tables![0]
                        .rows!.length,
                    itemBuilder: (context, index) {
                      final standingData = state
                          .standings!.items![0].standings!.tables![0].rows!;
                      return Table(
                        border: TableBorder(
                          bottom: BorderSide(
                            color: index == 3
                                ? Colors.red
                                : (index == 5
                                    ? (index == 17
                                        ? Colors.redAccent
                                        : Colors.blue)
                                    : Colors.black12),
                          ),
                        ),
                        columnWidths: const {
                          1: FlexColumnWidth(2),
                          2: FlexColumnWidth(5),
                        },
                        children: [
                          TableRow(
                            children: [
                              _buildTableRow(
                                standingData[index].position.toString(),
                                Colors.blue,
                                const TextStyle(color: Colors.white),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: NetworkImage(standingData[index]
                                          .crestUrl
                                          .toString()),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                                child: Text(
                                  standingData[index].clubName.toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              _buildTableRow(
                                standingData[index].played.toString(),
                                Colors.blue[200]!,
                                const TextStyle(fontSize: 17),
                              ),
                              _buildTableRow(
                                standingData[index].won.toString(),
                                Colors.blue[100]!,
                                const TextStyle(fontSize: 14),
                              ),
                              _buildTableRow(
                                standingData[index].lost.toString(),
                                Colors.blue[100]!,
                                const TextStyle(fontSize: 14),
                              ),
                              _buildTableRow(
                                standingData[index].drawn.toString(),
                                Colors.blue[100]!,
                                const TextStyle(fontSize: 14),
                              ),
                              _buildTableRow(
                                standingData[index].goalsFor.toString(),
                                Colors.white,
                                const TextStyle(fontSize: 14),
                              ),
                              _buildTableRow(
                                standingData[index].goalsAgainst.toString(),
                                Colors.white,
                                const TextStyle(fontSize: 14),
                              ),
                              _buildTableRow(
                                standingData[index].goalDifference.toString(),
                                Colors.white,
                                const TextStyle(fontSize: 14),
                              ),
                              _buildTableRow(
                                standingData[index].points.toString(),
                                Colors.redAccent,
                                const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is StandingError) {
            return Center(
              child: Text(state.message),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildTableRow(String text, Color color, TextStyle textStyle) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(color: color),
      child: Center(
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
