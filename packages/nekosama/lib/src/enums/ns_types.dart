/// All types available on `animecat.net`.
enum NSTypes {
  movie("m0v1e", "movie", "film"),
  ova("ova", "ova", "ova"),
  special("special", "special", "special"),
  tv("tv", "tv", "tv");

  /// The name used internally by the website.
  final String apiName;

  /// The english name.
  final String englishName;

  /// The french name.
  final String frenchName;

  const NSTypes(this.apiName, this.englishName, this.frenchName);

  /// The url of this type.
  Uri get url => Uri.parse('https://animecat.net/anime/#{"type":["$apiName"]}');

  /// Contruct a `NSTypes` from a `String`.
  ///
  /// Returns `null` if [type] is not a valid value.
  static NSTypes? fromString(String type) {
    final name = type.trim().toLowerCase();
    for (final typeVal in NSTypes.values) {
      if ([
        typeVal.name,
        typeVal.apiName,
        typeVal.englishName,
        typeVal.frenchName
      ].contains(name)) {
        return typeVal;
      }
    }
    return null;
  }
}
