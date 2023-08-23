import 'dart:convert';
import 'dart:io';

import 'package:nekosama/src/models/neko_sama_exception.dart';
import 'package:nekosama/src/models/get_url_response.dart';

extension UriWithGet on Uri {
  Future<GetUrlResponse> get({
    required HttpClient httpClient,
    Map<String, dynamic>? headers,
    bool? preserveHeaderCase,
  }) async {
    try {
      final request = await httpClient.getUrl(this)
        ..followRedirects = false
        ..persistentConnection = false;
      if (headers != null) {
        for (final header in headers.entries) {
          request.headers.add(
            header.key,
            header.value,
            preserveHeaderCase: preserveHeaderCase ?? false,
          );
        }
      }
      final response = await request.close();
      return GetUrlResponse(
        body: await response.transform(utf8.decoder).join(),
        timestamp: DateTime.now(),
      );
    } on Exception catch (e) {
      throw NekoSamaException("Failed to get or parse uri '${toString()}'", e);
    }
  }
}
