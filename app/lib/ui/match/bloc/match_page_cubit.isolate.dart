// part of 'match_page_cubit.dart';

// const _kIsolateDone = 0xFF;

// void _groupingFixtureData(SendPort sendPort) {
//   final Map<String, List<FixtureData>> fixtureGroup = {};
//   final List<League> leagues = [];
//   final receivePort = ReceivePort();
//   sendPort.send(receivePort.sendPort);

//   int count = 0;
//   receivePort.listen((message) async {
//     if (message is String) {
//       final fixture = FixtureData.fromJson(message);
//       final leagueKey = fixture.league.id.toString();
//       if (fixtureGroup.containsKey(leagueKey)) {
//         fixtureGroup
//           ..update(leagueKey, (value) {
//             value.add(fixture);
//             return value;
//           });
//       } else {
//         leagues.add(fixture.league);
//         fixtureGroup.update(
//           leagueKey,
//           (_) => [fixture],
//           ifAbsent: () => [fixture],
//         );
//       }

//       if (count == maxSectionPerPage) {
//         count += 1;
//         sendPort.send(
//           _FixtureIsolateResult(
//             fixtureGroups: fixtureGroup,
//             leagues: leagues,
//             isDone: false,
//           ).toJson(),
//         );
//       }

//       if (count < maxSectionPerPage) {
//         final checkLeagueKey = leagues[count].id.toString();
//         if (fixtureGroup.containsKey(checkLeagueKey)) {
//           if (fixtureGroup[checkLeagueKey]!.length >= matchLimitPerSection) {
//             count += 1;
//           }
//         }
//       }
//     }

//     if (message == _kIsolateDone) {
//       sendPort.send(
//         _FixtureIsolateResult(
//           fixtureGroups: fixtureGroup,
//           leagues: leagues,
//           isDone: true,
//         ).toJson(),
//       );

//       receivePort.close();
//       return;
//     }
//   });
// }

// class _FixtureIsolateResult {
//   final Map<String, List<FixtureData>> fixtureGroups;
//   final List<League> leagues;
//   final bool isDone;

//   _FixtureIsolateResult({
//     required this.fixtureGroups,
//     required this.leagues,
//     required this.isDone,
//   });

//   String toJson() {
//     return jsonEncode(
//       {
//         'fixtureGroups': fixtureGroups.map(
//           (key, value) => MapEntry(
//             key,
//             value.map((e) => e.writeToJson()).toList(),
//           ),
//         ),
//         'leagues': leagues.map((e) => e.writeToJson()).toList(),
//         'isDone': isDone,
//       },
//     );
//   }

//   factory _FixtureIsolateResult.fromJson(String jsonString) {
//     final decode = jsonDecode(jsonString) as Map<String, dynamic>;
//     final _fixtureGroups = decode['fixtureGroups'] as Map<String, dynamic>;
//     final _leagues = decode['leagues'] as List<dynamic>;

//     return _FixtureIsolateResult(
//       fixtureGroups: _fixtureGroups.map(
//         (key, value) => MapEntry(
//           key,
//           (value as List)
//               .map((e) => FixtureData.fromJson(e as String))
//               .toList(),
//         ),
//       ),
//       leagues: _leagues.map((e) => League.fromJson(e)).toList(),
//       isDone: decode['isDone'],
//     );
//   }
// }
