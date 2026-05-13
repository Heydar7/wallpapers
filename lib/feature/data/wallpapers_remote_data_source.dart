import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Stream<Map<String, List<String>>> getWallpaperData() async* {
  final ref = FirebaseStorage.instance.ref("wallpapers/");
  final result = await ref.listAll();
  final random = Random();

  final folders = result.prefixes
      .where((folder) => folder.name != "iPad's")
      .toList()
    ..shuffle(random);

  final Map<String, List<String>> data = {};

  for (final folder in folders) {
    final files = await folder.listAll();

    final urls = await Future.wait(
      files.items.map((file) => file.getDownloadURL()),
    );

    if (folder.name != 'couple') {
      urls.shuffle(random);
    }

    data[folder.name] = urls;

    yield Map.from(data);
  }
}

Stream<List<String>> getImagesByCategory(String category) async* {
  final ref = FirebaseStorage.instance.ref("wallpapers/$category");

  final result = await ref.listAll();
  final random = Random();

  final items = result.items;

  if (items.isEmpty) {
    yield [];
    return;
  }

  final urls = <String>[];

  for (final file in items) {
    urls.add(await file.getDownloadURL());
  }

  if (category != 'couple' && urls.length > 1) {
    urls.shuffle(random);
  }

  yield urls;
}

Stream<List<String>> getLiveWallpaperData() async* {
  final ref = FirebaseStorage.instance.ref("wallpapers/");
  final result = await ref.listAll();
  final random = Random();

  final List<Reference> allFiles = [];

  for (final folder in result.prefixes) {
    final files = await folder.listAll();
    allFiles.addAll(files.items);
  }

  final gifFiles = allFiles.where((file) {
    return file.name.toLowerCase().endsWith('.gif');
  }).toList();

  if (gifFiles.isEmpty) {
    yield [];
    return;
  }

  final urls = await Future.wait(
    gifFiles.map((file) => file.getDownloadURL()),
  );

  urls.shuffle(random);

  yield urls;
}


Stream<List<Map<String, dynamic>>> getBannersStream() async* {
  await for (final snapshot
      in FirebaseFirestore.instance.collection('banners').snapshots()) {
    final banners = await Future.wait(
      snapshot.docs.map((doc) async {
        final data = doc.data();

        final imageName = data['image-name'];
        final imageUrl = await getBannerUrl(imageName);

        return {
          'image-name': imageName,
          'category': data['category'],
          'imageUrl': imageUrl,
        };
      }),
    );

    yield banners;
  }
}

Future<String> getBannerUrl(String imageName) async {
  final extensions = ['png', 'gif', 'jpg', 'jpeg', 'webp'];

  for (final ext in extensions) {
    try {
      final ref = FirebaseStorage.instance.ref('banners/$imageName.$ext');

      final url = await ref.getDownloadURL();

      return url;
    } catch (_) {}
  }

  throw Exception('File 404');
}
