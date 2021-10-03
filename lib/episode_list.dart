import 'package:flutter/material.dart';
import 'episode.dart';
import 'episode_item.dart';
import 'package:carousel_slider/carousel_slider.dart';

class EpisodeList extends StatelessWidget {
  final List<Episode> items;

  EpisodeList({required this.items});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
          Container(child: EpisodeItem(item: items[index])),
      options: CarouselOptions(
          autoPlay: false, enableInfiniteScroll: false, aspectRatio: 3 / 2),
    );
  }
}
