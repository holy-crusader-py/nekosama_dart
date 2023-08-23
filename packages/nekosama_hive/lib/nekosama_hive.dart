/// Unofficial dart api for neko-sama.fr.
library nekosama_hive;

// To keep the order of the files
// ignore: combinators_ordering
export 'package:nekosama/nekosama.dart'
    show
        NSAnime,
        NSAnimeBase,
        NSAnimeExtendedBase,
        NSCarouselAnime,
        NSEpisode,
        NSGenres,
        NSHome,
        NSNewEpisode,
        NSSearchAnime,
        NSSources,
        NSStatuses,
        NSTitles,
        NSTypes,
        NSWebsiteInfo,
        NekoSamaException;

export 'package:nekosama_hive/src/querys/ns_double_query.dart'
    show NSdoubleQuery;
export 'package:nekosama_hive/src/querys/ns_int_query.dart' show NSintQuery;
export 'package:nekosama_hive/src/querys/ns_string_query.dart'
    show NSStringQuery;

export 'package:nekosama_hive/src/models/ns_progress.dart' show NSProgress;
export 'package:nekosama_hive/src/models/ns_search_db_stats.dart'
    show NSSearchDbStats;

export 'package:nekosama_hive/src/neko_sama.dart' show NekoSama;
export 'package:nekosama_hive/src/ns_hive_search_db.dart' show NSHiveSearchDb;
