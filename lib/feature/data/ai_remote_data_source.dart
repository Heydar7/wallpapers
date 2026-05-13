import 'package:dio/dio.dart';

class PexelsPhoto {
  final String tiny;
  final String medium;
  final String large;

  PexelsPhoto({
    required this.tiny,
    required this.medium,
    required this.large,
  });

  factory PexelsPhoto.fromJson(Map<String, dynamic> json) {
    return PexelsPhoto(
      tiny: json['src']['tiny'],
      medium: json['src']['medium'],
      large: json['src']['large2x'],
    );
  }
}

class PexelsApi {
  static const String _apiKey =
      'ihBpMkJbLtXv1rOZUpYVIhVfXR0OXmHyjSwp4agqPUVcILoeq5M6oyH3';
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.pexels.com/v1',
      headers: {
        'Authorization': _apiKey,
      },
    ),
  );

  Future<List<String>> searchHdImages(String query) async {
    final response = await _dio.get(
      '/search',
      queryParameters: {
        'query': query,
        'per_page': 10,
        'orientation': 'portrait', // важно для обоев
      },
    );

    final List photos = response.data['photos'];

    return photos
        .map<String>((photo) => photo['src']['large2x'] as String)
        .toList();
  }
}

String buildSearchQuery(String userText, String style) {
  final styleKeywords = {
    'Neon Drift': 'neon cyberpunk',
    'Dreamcore Echo': 'dreamcore aesthetic',
    'Void Minimal': 'minimal dark',
    'Holo Grid': 'neon grid',
    'Bio Flow': 'abstract liquid',
    'Retro Future': 'synthwave',
    'Cosmic Drift': 'space galaxy',
  };

  final stylePart = styleKeywords[style] ?? '';

  return '$userText $stylePart wallpaper portrait';
}