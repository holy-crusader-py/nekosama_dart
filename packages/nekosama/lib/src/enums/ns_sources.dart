/// All sources available on `animecat.net`.
enum NSSources {
  vostfr("vostfr", "french sub", "vostfr"),
  vf("vf", "french dub", "vf");

  /// The name used internally by the website.
  final String apiName;

  /// The english name.
  final String englishName;

  /// The french name.
  final String frenchName;

  const NSSources(this.apiName, this.englishName, this.frenchName);

  /// The url of this source.
  Uri get url => Uri.https(
        "animecat.net",
        "/anime${this == NSSources.vf ? "-vf" : ""}",
      );

  /// Contruct a [NSSources] from a `String`.
  ///
  /// Returns `null` if [source] is not a valid value.
  static NSSources? fromString(String source) {
    final name = source.trim().toLowerCase();
    for (final sourceVal in NSSources.values) {
      if ([
        sourceVal.name,
        sourceVal.apiName,
        sourceVal.englishName,
        sourceVal.frenchName
      ].contains(name)) {
        return sourceVal;
      }
    }
    return null;
  }
}
