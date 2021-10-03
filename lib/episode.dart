class Episode {
  final int id;
  final String name;
  final String airDate;
  final String seasonAndEpisode;

  Episode(this.id, this.name, this.airDate, this.seasonAndEpisode);

  factory Episode.fromMap(Map<String, dynamic> json) {
    return Episode(json['id'], json['name'], json['air_date'], json['episode']);
  }
  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(json['id'], json['name'], json['air_date'], json['episode']);
  }
}
