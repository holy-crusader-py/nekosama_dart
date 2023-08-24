import 'dart:io';

import 'package:nekosama_hive/nekosama_hive.dart';
import 'package:test/test.dart';

final basePath = '${Directory.current.path}/test/temp';

Future<void> main() async {
  await deleteTempDirectory();
  group('Main test', () {
    test('Init NSHiveSearchDb', () async {
      final api = NekoSama();
      final searchDB = api.hiveSearchDb;
      await searchDB.init('$basePath/init');
      expect(searchDB, isA<NSHiveSearchDb>());
      searchDB.dispose();
    });
    test('SearchDB populate', () async {
      final api = NekoSama();
      final searchDB = api.hiveSearchDb;
      await searchDB.init('$basePath/populate');
      await searchDB.populate();
      expect(searchDB, isA<NSHiveSearchDb>());
      searchDB.dispose();
    });
    test('SearchDB populate stream', () async {
      final api = NekoSama();
      final searchDB = api.hiveSearchDb;
      await searchDB.init('$basePath/populate_stream');
      final stream = searchDB.populateStream();
      expect(stream, isA<Stream<NSProgress>>());
      searchDB.dispose();
    });
    test('SearchDB search anime', () async {
      final api = NekoSama();
      final searchDB = api.hiveSearchDb;
      await searchDB.init('$basePath/search_anime');
      await searchDB.populate();
      final searchAnime = await searchDB.getSearchAnime(4833);
      expect(searchAnime, isA<NSSearchAnime>());
      searchDB.dispose();
    });
    test('SearchDB exists anime', () async {
      final api = NekoSama();
      final searchDB = api.hiveSearchDb;
      await searchDB.init('$basePath/exists_anime');
      await searchDB.populate();
      final exists = searchDB.existsAnime(4833);
      expect(exists, isTrue);
      expect(exists, isA<bool>());
      searchDB.dispose();
    });
    test('SearchDB search ids', () async {
      final api = NekoSama();
      final searchDB = api.hiveSearchDb;
      await searchDB.init('$basePath/search_ids');
      await searchDB.populate();
      final searchIDs = await searchDB.searchIds(
        title: NSStringQuery.contains('Panty'),
      );
      expect(searchIDs.length, isNonZero);
      expect(searchIDs, isA<List<int>>());
      searchDB.dispose();
    });
  });
  await deleteTempDirectory();
}

Future<void> deleteTempDirectory() async {
  final dir = Directory(basePath);
  if (dir.existsSync()) {
    await dir.delete(recursive: true);
  }
}
