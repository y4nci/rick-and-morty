import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'episode.dart';
import 'episode_list.dart';

Future<List<Episode>> fetchEpisodes() async {
  List<Episode> episodes = [];
  List<int> pages = [1, 2, 3];

  for (int page in pages) {
    var url = Uri.parse("https://rickandmortyapi.com/api/episode/?page=$page");
    Map<String, String> headers = {
      "Accept": "application/json",
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    };
    final response = await http.get(url, headers: headers);
    final results;
    Map<String, dynamic> data;

    if (response.statusCode == 200) {
      results = jsonDecode(response.body)["results"];
    } else {
      throw Exception('Failed to load episodes');
    }

    for (dynamic rawEpisode in results) {
      data = Map<String, dynamic>.from(rawEpisode);
      episodes.add(Episode.fromJson(data));
    }
  }

  return episodes;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState(
        title: "Rick and Morty Episodes",
      );
}

class _MyAppState extends State<MyApp> {
  late Future<List<Episode>> futureEpisodes;
  final String title;

  _MyAppState({required this.title});

  @override
  void initState() {
    super.initState();
    futureEpisodes = fetchEpisodes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueGrey.shade700,
              title: Text(
                "Rick and Morty Episodes",
                style: TextStyle(fontFamily: 'SFProDisplay'),
              ),
            ),
            body: Center(
              child: FutureBuilder<List<Episode>>(
                future: futureEpisodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return EpisodeList(items: snapshot.data!);
                    //;
                  } else if (snapshot.hasError) {
                    return Text(
                      '${snapshot.error}',
                      style: TextStyle(fontFamily: 'SFProDisplay'),
                    );
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            )));
  }
}
