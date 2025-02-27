/// All genres available on `animecat.net`.
enum NSGenres {
  action(
    "action",
    "action",
    "action",
  ),
  adventure(
    "adventure",
    "adventure",
    "aventure",
  ),
  battleRoyale(
    "battle royale",
    "battle royale",
    "battle royale",
  ),
  comedy(
    "c0m1dy",
    "comedy",
    "comédie",
  ),
  cyberpunk(
    "cyberpunk",
    "cyberpunk",
    "cyberpunk",
  ),
  drama(
    "drama",
    "drama",
    "drama",
  ),
  ecchi(
    "ecchi",
    "ecchi",
    "ecchi",
  ),
  fantasy(
    "fantasy",
    "fantasy",
    "fantastique",
  ),
  hentai(
    "hentai",
    "hentai",
    "hentai",
  ),
  horror(
    "horror",
    "horror",
    "horreur",
  ),
  isekai(
    "isekai",
    "isekai",
    "isekai",
  ),
  mafia(
    "mafia",
    "mafia",
    "mafia",
  ),
  magic(
    "magic",
    "magic",
    "magique",
  ),
  magicalGirl(
    "mahou shoujo",
    "magical girl",
    "magical girl",
  ),
  mecha(
    "mecha",
    "mecha",
    "mecha",
  ),
  military(
    "military",
    "military",
    "militaire",
  ),
  music(
    "music",
    "music",
    "musique",
  ),
  mystery(
    "mystery",
    "mystery",
    "mystère",
  ),
  psychological(
    "psychological",
    "psychological",
    "psychologique",
  ),
  romance(
    "romance",
    "romance",
    "romance",
  ),
  sciFi(
    "sci-fi",
    "sci-fi",
    "sci-fi",
  ),
  sliceOfLife(
    "slice of life",
    "slice of life",
    "tranche de vie",
  ),
  sports(
    "sports",
    "sports",
    "sports",
  ),
  supernatural(
    "supernatural",
    "supernatural",
    "supernaturel",
  ),
  thriller(
    "thriller",
    "thriller",
    "suspense",
  );

  /// The name used internally by the website.
  final String apiName;

  /// The english name.
  final String englishName;

  /// The french name.
  final String frenchName;

  const NSGenres(this.apiName, this.englishName, this.frenchName);

  /// The url of this genre.
  Uri get url =>
      Uri.parse('https://animecat.net/anime/#{"genres":["$apiName"]}');

  /// Contruct a [NSGenres] from a `String`.
  ///
  /// Returns `null` if [genre] is not a valid value.
  static NSGenres? fromString(String genre) {
    final name = genre.trim().toLowerCase();
    for (final genreVal in NSGenres.values) {
      if ([
        genreVal.name,
        genreVal.apiName,
        genreVal.englishName,
        genreVal.frenchName
      ].contains(name)) {
        return genreVal;
      }
    }
    return null;
  }
}
