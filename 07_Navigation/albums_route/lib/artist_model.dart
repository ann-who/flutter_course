class Artist {
  final String name;
  final String link;
  final String about;

  Artist(this.name, this.link, this.about);

  Artist.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        link = json['link'],
        about = json['about'];

  String get normalizedName {
    List<String> bandName = name.split(' ');
    List<String> capitalizedBandName = bandName.map((String word) {
      String trimmedWord = word.trim();
      if (trimmedWord.isEmpty) {
        return '';
      }

      final String firstLetter = trimmedWord.substring(0, 1).toUpperCase();
      final String remainingLetters = trimmedWord.substring(1);
      return '$firstLetter$remainingLetters';
    }).toList();

    return capitalizedBandName.join(' ');
  }
}
