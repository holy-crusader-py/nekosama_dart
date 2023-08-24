import 'package:nekosama/nekosama.dart';
import 'package:test/test.dart';

Future<void> main() async {
  group('Main test', () {
    final api = NekoSama();
    test('Get Home', () async {
      final home = await api.getHome();
      expect(home, isA<NSHome>());
    });
    test('Get Anime', () async {
      final anime = await api.getAnime(
        Uri.parse(
          "https://animecat.net/anime/info/4833-panty-stocking-with-garterbelt_vostfr",
        ),
      );
      expect(anime, isA<NSAnime>());
    });
    test('Guess Episode Urls', () async {
      final anime = await api.getAnime(
        Uri.parse(
          "https://animecat.net/anime/info/4833-panty-stocking-with-garterbelt_vostfr",
        ),
      );
      final episodeUrls = await api.guessEpisodeUrls(anime);
      expect(episodeUrls?.length, isNonZero);
      expect(episodeUrls, isA<List<Uri>>());
    });
    test('Get episodes', () async {
      final anime = await api.getAnime(
        Uri.parse(
          "https://animecat.net/anime/info/4833-panty-stocking-with-garterbelt_vostfr",
        ),
      );
      final episodes = await api.getEpisodes(anime);
      expect(episodes?.length, isNonZero);
      expect(episodes, isA<List<NSEpisode>>());
    });
    test('Get video urls', () async {
      final anime = await api.getAnime(
        Uri.parse(
          "https://animecat.net/anime/info/4833-panty-stocking-with-garterbelt_vostfr",
        ),
      );
      final episodes = await api.getEpisodes(anime);
      final videoUrls = await api.getVideoUrls(episodes![0]);
      expect(videoUrls.length, isNonZero);
      expect(videoUrls, isA<List<Uri>>());
    });
    group('Get SearchDb', () {
      test('(NSSources.vostfr)', () async {
        final searchDB = await api.getSearchDb(NSSources.vostfr);
        expect(searchDB.length, isNonZero);
        expect(searchDB, isA<List<NSSearchAnime>>());
      });
      test('(NSSources.vf)', () async {
        final searchDB = await api.getSearchDb(NSSources.vf);
        expect(searchDB.length, isNonZero);
        expect(searchDB, isA<List<NSSearchAnime>>());
      });
    });
    group('Get raw SearchDb', () {
      test('(NSSources.vostfr)', () async {
        final searchDB = await api.getRawSearchDb(NSSources.vostfr);
        expect(searchDB.length, isNonZero);
        expect(searchDB, isA<List<Map<String, dynamic>>>());
      });
      test('(NSSources.vf)', () async {
        final searchDB = await api.getRawSearchDb(NSSources.vf);
        expect(searchDB.length, isNonZero);
        expect(searchDB, isA<List<Map<String, dynamic>>>());
      });
    });
  });
}
