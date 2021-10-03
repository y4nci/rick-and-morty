import 'package:flutter/material.dart';
import 'episode.dart';

class EpisodeItem extends StatelessWidget {
  final Episode item;

  EpisodeItem({required this.item});

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
          elevation: 5,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              "${this.item.name}",
                              style: TextStyle(
                                  fontFamily: 'SFProDisplay', fontSize: 32),
                            ),
                            Text(
                              "${this.item.seasonAndEpisode}",
                              style: TextStyle(
                                  fontFamily: 'SFProDisplay', fontSize: 16),
                            ),
                            Text(
                              "aired on ${this.item.airDate}",
                              style: TextStyle(
                                  fontFamily: 'SFProDisplay', fontSize: 16),
                            ),
                            Text(
                              "episode number: ${this.item.id}",
                              style: TextStyle(
                                  fontFamily: 'SFProDisplay', fontSize: 16),
                            ),
                          ],
                        )))
              ]),
        ));
  }
}
